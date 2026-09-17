package com.food.model;

public class Restaurant {

    private int id;

    private String name;

    private String category;

    private double rating;

    private String image;

    public Restaurant() {

    }

	public Restaurant(String name, String category, double rating, String image) {
		this.name = name;
		this.category = category;
		this.rating = rating;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
    

}
