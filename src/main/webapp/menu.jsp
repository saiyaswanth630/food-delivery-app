<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Menu" %>

<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    List<Menu> menus = (List<Menu>) request.getAttribute("menus");

    String restaurantName = (String) request.getAttribute("restaurantName");

    if (restaurantName == null || restaurantName.trim().isEmpty()) {
        restaurantName = "Restaurant Menu";
    }

    String contextPath = request.getContextPath();
%>
<%
    String cartMessage =
            (String) session.getAttribute("cartMessage");

    session.removeAttribute("cartMessage");

    List<Integer> cart =
            (List<Integer>) session.getAttribute("cart");

    int cartCount = (cart == null) ? 0 : cart.size();
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title><%= restaurantName %> - Menu</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f7f7f7;
            color: #222;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            height: 70px;
            background: #ffffff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 25px;
            font-weight: 800;
            color: #ff4d2d;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-size: 15px;
            font-weight: 600;
            transition: 0.2s;
        }

        .nav-links a:hover {
            color: #ff4d2d;
        }

        .cart-link {
            position: relative;
        }

        .cart-link i {
            font-size: 19px;
        }

        /* ================= HEADER ================= */

        .menu-header {
            background: linear-gradient(135deg, #ff512f, #dd2476);
            color: white;
            padding: 55px 7%;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            margin-bottom: 22px;
            opacity: 0.9;
        }

        .back-link:hover {
            opacity: 1;
        }

        .menu-header h1 {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .menu-header p {
            font-size: 16px;
            opacity: 0.9;
        }

        /* ================= MENU CONTAINER ================= */

        .menu-container {
            width: 86%;
            max-width: 1250px;
            margin: 40px auto;
        }

        .section-title {
            font-size: 25px;
            margin-bottom: 25px;
        }

        /* ================= MENU GRID ================= */

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .menu-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 28px rgba(0,0,0,0.13);
        }

        /* ================= FOOD IMAGE ================= */

        .food-image-container {
            width: 100%;
            height: 210px;
            overflow: hidden;
            background: #eeeeee;
        }

        .food-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.35s ease;
        }

        .menu-card:hover .food-image {
            transform: scale(1.05);
        }

        /* ================= FOOD DETAILS ================= */

        .food-details {
            padding: 20px;
        }

        .food-name {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .food-description {
            color: #777;
            font-size: 14px;
            line-height: 1.5;
            min-height: 42px;
            margin-bottom: 15px;
        }

        .food-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }

        .food-price {
            font-size: 19px;
            font-weight: 700;
            color: #222;
        }

        .add-btn {
            border: none;
            background: #ff4d2d;
            color: white;
            padding: 10px 17px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 700;
            transition: 0.2s;
        }

        .add-btn:hover {
            background: #e63e20;
            transform: translateY(-1px);
        }

        .add-btn i {
            margin-right: 5px;
        }

        /* ================= EMPTY MENU ================= */

        .empty-menu {
            background: white;
            border-radius: 15px;
            padding: 70px 20px;
            text-align: center;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
        }

        .empty-menu i {
            font-size: 55px;
            color: #ff4d2d;
            margin-bottom: 20px;
        }

        .empty-menu h2 {
            margin-bottom: 10px;
        }

        .empty-menu p {
            color: #777;
        }

        /* ================= FEATURE STRIP ================= */

        .feature-strip {
            margin-top: 45px;
            background: white;
            border-radius: 15px;
            padding: 25px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.06);
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .feature-icon {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: #fff0ec;
            color: #ff4d2d;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .feature h4 {
            margin-bottom: 4px;
        }

        .feature p {
            color: #777;
            font-size: 13px;
        }

        /* ================= FOOTER ================= */

        footer {
            margin-top: 60px;
            background: #1f1f1f;
            color: white;
            text-align: center;
            padding: 25px;
        }

        footer p {
            color: #aaa;
            font-size: 14px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 950px) {

            .menu-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .feature-strip {
                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 650px) {

            .navbar {
                padding: 0 5%;
            }

            .nav-links {
                gap: 13px;
            }

            .nav-links a {
                font-size: 13px;
            }

            .menu-header {
                padding: 40px 5%;
            }

            .menu-header h1 {
                font-size: 30px;
            }

            .menu-container {
                width: 90%;
            }

            .menu-grid {
                grid-template-columns: 1fr;
            }

            .food-image-container {
                height: 220px;
            }

        }

    </style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <a href="home.jsp" class="logo">
        FoodApp
    </a>

    <div class="nav-links">

        <a href="restaurants">
            Restaurants
        </a>

        <a href="orderHistory.jsp">
            Orders
        </a>

        <a href="profile.jsp">
            Profile
        </a>

        <a href="cart.jsp" class="cart-link">
            <i class="fa-solid fa-cart-shopping"></i>
            Cart
        </a>

    </div>

</nav>


<!-- ================= HEADER ================= -->

<section class="menu-header">

    <a href="restaurants" class="back-link">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Restaurants
    </a>

    <h1>
        <%= restaurantName %>
    </h1>

    <p>
        Explore our menu and choose your favourite food.
    </p>

</section>


<!-- ================= MENU ================= -->

<div class="menu-container">

    <h2 class="section-title">
        Popular Menu
    </h2>


    <% if (menus != null && !menus.isEmpty()) { %>

        <div class="menu-grid">

            <% for (Menu m : menus) { %>

                <div class="menu-card">

                    <!-- FOOD IMAGE -->

                    <div class="food-image-container">

                        <img
                            class="food-image"
                            src="<%= contextPath %>/<%= m.getImage() %>"
                            alt="<%= m.getItemName() %>"
                            onerror="this.onerror=null;this.src='<%= contextPath %>/images/default-food.jpg';"
                        >

                    </div>


                    <!-- FOOD DETAILS -->

                    <div class="food-details">

                        <div class="food-name">
                            <%= m.getItemName() %>
                        </div>

                        <div class="food-description">

                            <%
                                String description = m.getDescription();

                                if (description == null ||
                                    description.trim().isEmpty()) {
                            %>

                                Delicious and freshly prepared.

                            <%
                                } else {
                            %>

                                <%= description %>

                            <%
                                }
                            %>

                        </div>


                        <div class="food-bottom">

                            <span class="food-price">
                                &#8377;<%= String.format("%.2f", m.getPrice()) %>
                            </span>


                            <form action="addToCart" method="post">

                                <input
                                    type="hidden"
                                    name="menuId"
                                    value="<%= m.getId() %>"
                                >

                                <input
                                    type="hidden"
                                    name="restaurantId"
                                    value="<%= m.getRestaurantId() %>"
                                >

                                <button
                                    type="submit"
                                    class="add-btn"
                                >

                                    <i class="fa-solid fa-plus"></i>
                                    Add

                                </button>

                            </form>

                        </div>

                    </div>

                </div>

            <% } %>

        </div>

    <% } else { %>


        <!-- EMPTY MENU -->

        <div class="empty-menu">

            <i class="fa-solid fa-utensils"></i>

            <h2>
                No Menu Items Available
            </h2>

            <p>
                This restaurant has not added any menu items yet.
            </p>

        </div>


    <% } %>


    <!-- ================= FEATURES ================= -->

    <div class="feature-strip">

        <div class="feature">

            <div class="feature-icon">
                <i class="fa-solid fa-bolt"></i>
            </div>

            <div>
                <h4>Quick Delivery</h4>
                <p>Fresh food delivered to your doorstep.</p>
            </div>

        </div>


        <div class="feature">

            <div class="feature-icon">
                <i class="fa-solid fa-shield-halved"></i>
            </div>

            <div>
                <h4>Secure Ordering</h4>
                <p>Safe and reliable ordering experience.</p>
            </div>

        </div>


        <div class="feature">

            <div class="feature-icon">
                <i class="fa-solid fa-star"></i>
            </div>

            <div>
                <h4>Quality Food</h4>
                <p>Choose from a variety of delicious meals.</p>
            </div>

        </div>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>
        © 2026 FoodApp. All rights reserved.
    </p>

</footer>
<%
    if (cartMessage != null) {
%>

<div id="cartToast" class="cart-toast">
    <i class="fa-solid fa-circle-check"></i>
    <span><%= cartMessage %></span>
</div>

<%
    }
%>


<%
    if (cartCount > 0) {
%>

<a href="<%=contextPath%>/cart.jsp"
   class="floating-cart">

    <i class="fa-solid fa-cart-shopping"></i>

    <span>
        View Cart
    </span>

    <b>
        <%= cartCount %>
    </b>

</a>

<%
    }
%>


<style>

.cart-toast {
    position: fixed;
    top: 90px;
    right: 30px;
    z-index: 9999;

    display: flex;
    align-items: center;
    gap: 12px;

    background: #16a34a;
    color: white;

    padding: 15px 22px;
    border-radius: 10px;

    font-size: 15px;
    font-weight: 600;

    box-shadow: 0 8px 25px rgba(0,0,0,0.18);

    animation: toastIn 0.35s ease;
}

.cart-toast i {
    font-size: 20px;
}


.floating-cart {
    position: fixed;

    bottom: 25px;
    right: 30px;

    z-index: 9998;

    display: flex;
    align-items: center;
    gap: 12px;

    background: #ff4d2d;
    color: white;

    padding: 15px 20px;

    border-radius: 50px;

    text-decoration: none;

    font-weight: 700;

    box-shadow: 0 8px 25px rgba(0,0,0,0.20);

    transition: 0.25s ease;
}

.floating-cart:hover {
    transform: translateY(-3px);
    background: #e63e20;
}

.floating-cart i {
    font-size: 19px;
}

.floating-cart b {
    background: white;
    color: #ff4d2d;

    min-width: 25px;
    height: 25px;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    font-size: 13px;
}


@keyframes toastIn {

    from {
        opacity: 0;
        transform: translateX(30px);
    }

    to {
        opacity: 1;
        transform: translateX(0);
    }

}


@media (max-width: 600px) {

    .cart-toast {
        right: 15px;
        left: 15px;
        top: 80px;
        justify-content: center;
    }

    .floating-cart {
        right: 15px;
        bottom: 15px;
    }

}

</style>


<%
    if (cartMessage != null) {
%>

<script>

setTimeout(function() {

    const toast =
        document.getElementById("cartToast");

    if (toast) {
        toast.style.transition = "0.4s";
        toast.style.opacity = "0";
        toast.style.transform = "translateX(30px)";

        setTimeout(function() {
            toast.remove();
        }, 400);
    }

}, 2500);

</script>

<%
    }
%>

</body>

</html>