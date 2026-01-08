package com.food.model;

import java.sql.Timestamp;

public class Order {
    private int orderId;
    private int userId;
    private int restaurantId;
    private double totalAmount;
    private String status;
    private String paymentMode;
    private Timestamp orderDate;
    private String address;

    // Constructors
    public Order() {}

    public Order(int userId, int restaurantId, double totalAmount, String status, String paymentMode, String address) {
        this.userId = userId;
        this.restaurantId = restaurantId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.paymentMode = paymentMode;
        this.address = address;
    }
    public int getUserId() { return userId; }
    public int getRestaurantId() { return restaurantId; }
    public double getTotalAmount() { return totalAmount; }
    public String getStatus() { return status; }
    public String getPaymentMode() { return paymentMode; }
    public String getAddress() { return address; }

    // Getters and Setters for all fields...
}
