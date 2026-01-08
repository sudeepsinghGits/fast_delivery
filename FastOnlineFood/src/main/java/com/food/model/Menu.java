package com.food.model;

public class Menu {
    private int menuId;
    private int restaurantId;
    private String itemName;
    private String description;
    private int price;
    private boolean isAvailable;
    private String imagePath;

    // Constructor for fetching data
    public Menu(int menuId, int restaurantId, String itemName, String description, int price, boolean isAvailable, String imagePath) {
        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
        this.imagePath = imagePath;
    }

    // Getters (Required for JSP to display data)
    public int getMenuId() { return menuId; }
    public String getItemName() { return itemName; }
    public String getDescription() { return description; }
    public int getPrice() { return price; }
    public String getImagePath() { return imagePath; }
    public int getRestaurantId() {
        return restaurantId;
    }
}
