package com.food.model;

public class Menu {

    private int id;
    private int restaurantId;
    private String itemName;
    private double price;
    private String description;
    private String image;

    public Menu() {
    }

    public Menu(int id, int restaurantId, String itemName,
                double price, String description, String image) {

        this.id = id;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}