package com.food.model;

public class Restaurant {
    private int restaurantId;
    private String name;
    private String cuisineType;
    private int deliveryTime;
    private String address;
    private float rating;
    private boolean isActive;
    private String imagePath;

    // ... Constructor goes here ...
    public Restaurant(int restaurantId, String name, String cuisineType, int deliveryTime, 
            String address, float rating, boolean isActive, String imagePath) {
this.restaurantId = restaurantId;
this.name = name;
this.cuisineType = cuisineType;
this.deliveryTime = deliveryTime;
this.address = address;
this.rating = rating;
this.isActive = isActive;
this.imagePath = imagePath;
}
    // GETTERS - The JSP needs these!
    public int getRestaurantId() { return restaurantId; }
    public String getName() { return name; }
    public String getCuisineType() { return cuisineType; }
    public int getDeliveryTime() { return deliveryTime; }
    public String getAddress() { return address; }
    public float getRating() { return rating; }
    public boolean getIsActive() { return isActive; }
    public String getImagePath() { return imagePath; }
    
    // SETTERS (Optional but good to have)
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }
    public void setName(String name) { this.name = name; }
    // ... etc
}
