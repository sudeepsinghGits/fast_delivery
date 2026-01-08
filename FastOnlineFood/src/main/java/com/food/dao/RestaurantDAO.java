package com.food.dao;

import java.util.List;
import com.food.model.Restaurant;

public interface RestaurantDAO {
    // This is the main method we need for the home page
    List<Restaurant> getAllRestaurants();
    
    // You can add these for later use
    Restaurant getRestaurant(int restaurantId);
}