package com.food.model;

public class Order {

    private int id;

    private int userId;

    private double totalAmount;

    private String orderDate;

    private String status;

    public Order() {

    }

	public Order(int userId, double totalAmount, String orderDate, String status) {
		super();
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.orderDate = orderDate;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
    
}
