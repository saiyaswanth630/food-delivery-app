import os
import re
import time
import requests
import mysql.connector


# =========================================================
# CONFIGURATION
# =========================================================

PEXELS_API_KEY = "dSnBJigHNyoGpMpGWf3YNtGKYJLQeZuncmxzil6E0FxTme23Tvbp68X2"

DB_HOST = "localhost"
DB_PORT = 3306
DB_NAME = "foodapp"
DB_USER = "root"
DB_PASSWORD = "root"

PROJECT_PATH = r"D:\new-workspace\Foodapp"

IMAGE_ROOT = os.path.join(
    PROJECT_PATH,
    "src",
    "main",
    "webapp",
    "images",
    "foods"
)

PEXELS_SEARCH_URL = "https://api.pexels.com/v1/search"


# =========================================================
# DATABASE CONNECTION
# =========================================================

def connect_database():

    return mysql.connector.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )


# =========================================================
# CREATE SAFE FILE NAME
# =========================================================

def clean_name(text):

    text = text.lower().strip()

    text = re.sub(
        r"[^a-z0-9]+",
        "-",
        text
    )

    return text.strip("-")


# =========================================================
# SEARCH PEXELS
# =========================================================

def search_pexels(search_text):

    headers = {
        "Authorization": PEXELS_API_KEY
    }

    params = {
        "query": search_text,
        "per_page": 5,
        "orientation": "landscape"
    }

    response = requests.get(
        PEXELS_SEARCH_URL,
        headers=headers,
        params=params,
        timeout=30
    )

    if response.status_code != 200:

        raise Exception(
            f"Pexels API HTTP {response.status_code}"
        )

    data = response.json()

    photos = data.get("photos", [])

    if not photos:
        return None

    photo = photos[0]

    return {
        "image_url": photo["src"]["large"],
        "photo_url": photo["url"],
        "photographer": photo["photographer"],
        "photographer_url": photo["photographer_url"]
    }


# =========================================================
# DOWNLOAD IMAGE
# =========================================================

def download_image(image_url, destination):

    response = requests.get(
        image_url,
        timeout=30
    )

    if response.status_code != 200:

        raise Exception(
            f"Image download HTTP {response.status_code}"
        )

    with open(destination, "wb") as file:

        file.write(response.content)


# =========================================================
# MAIN
# =========================================================

def main():

    print()
    print("=" * 60)
    print(" FOODAPP - MENU IMAGE SETUP")
    print("=" * 60)
    print()

    # Create images/foods folder
    os.makedirs(
        IMAGE_ROOT,
        exist_ok=True
    )

    # Connect to MySQL
    connection = connect_database()

    print("Database connected successfully.")

    cursor = connection.cursor(
        dictionary=True
    )

    # =====================================================
    # GET ALL RESTAURANTS + MENU ITEMS
    # =====================================================

    query = """
        SELECT
            m.id AS menu_id,
            m.restaurant_id,
            r.name AS restaurant_name,
            r.category AS restaurant_category,
            m.item_name
        FROM menu m
        INNER JOIN restaurants r
            ON m.restaurant_id = r.id
        ORDER BY
            m.restaurant_id,
            m.id
    """

    cursor.execute(query)

    menus = cursor.fetchall()

    print(
        "Total menu items:",
        len(menus)
    )

    print()

    # Cursor for updating database
    update_cursor = connection.cursor()

    success = 0
    failed = 0
    skipped = 0

    # =====================================================
    # PROCESS EVERY MENU ITEM
    # =====================================================

    for index, menu in enumerate(
        menus,
        start=1
    ):

        menu_id = menu["menu_id"]

        restaurant_id = menu["restaurant_id"]

        restaurant_name = menu["restaurant_name"]

        restaurant_category = menu["restaurant_category"]

        item_name = menu["item_name"]

        print()
        print("-" * 60)

        print(
            f"[{index}/{len(menus)}]"
        )

        print(
            "Restaurant:",
            restaurant_name
        )

        print(
            "Food:",
            item_name
        )

        # =================================================
        # CREATE RESTAURANT-SPECIFIC FOLDER
        # =================================================

        restaurant_folder = os.path.join(
            IMAGE_ROOT,
            f"restaurant-{restaurant_id}"
        )

        os.makedirs(
            restaurant_folder,
            exist_ok=True
        )

        # =================================================
        # CREATE UNIQUE FILE NAME
        # =================================================

        filename = (
            f"menu-{menu_id}-"
            f"{clean_name(item_name)}.jpg"
        )

        image_path = os.path.join(
            restaurant_folder,
            filename
        )

        # JSP/browser path
        web_path = (
            f"images/foods/"
            f"restaurant-{restaurant_id}/"
            f"{filename}"
        )

        # =================================================
        # IF IMAGE ALREADY EXISTS
        # =================================================

        if os.path.exists(image_path):

            print(
                "Image already exists - skipping download."
            )

            update_cursor.execute(
                """
                UPDATE menu
                SET image = %s
                WHERE id = %s
                """,
                (
                    web_path,
                    menu_id
                )
            )

            connection.commit()

            skipped += 1

            continue

        # =================================================
        # SEARCH QUERY
        # =================================================

        search_text = (
            f"{item_name} "
            f"{restaurant_category} food"
        )

        print(
            "Searching:",
            search_text
        )

        # =================================================
        # DOWNLOAD IMAGE
        # =================================================

        try:

            result = search_pexels(
                search_text
            )

            if result is None:

                print(
                    "No image found."
                )

                failed += 1

                continue

            print(
                "Photographer:",
                result["photographer"]
            )

            download_image(
                result["image_url"],
                image_path
            )

            # =================================================
            # SAVE IMAGE PATH TO DATABASE
            # =================================================

            update_cursor.execute(
                """
                UPDATE menu
                SET image = %s
                WHERE id = %s
                """,
                (
                    web_path,
                    menu_id
                )
            )

            connection.commit()

            print(
                "SUCCESS"
            )

            print(
                "Saved:",
                web_path
            )

            success += 1

            # Small delay between requests
            time.sleep(1)

        except Exception as e:

            print(
                "FAILED:",
                e
            )

            failed += 1

    # =====================================================
    # CLOSE DATABASE
    # =====================================================

    cursor.close()

    update_cursor.close()

    connection.close()

    # =====================================================
    # FINAL RESULT
    # =====================================================

    print()
    print("=" * 60)
    print(" DOWNLOAD COMPLETED")
    print("=" * 60)

    print(
        "Successful:",
        success
    )

    print(
        "Skipped:",
        skipped
    )

    print(
        "Failed:",
        failed
    )

    print(
        "Image folder:",
        IMAGE_ROOT
    )

    print("=" * 60)


# =========================================================
# START PROGRAM
# =========================================================

if __name__ == "__main__":

    main()