package com.food.daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private static final String SELECT_ALL = "SELECT * FROM restaurants";

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(SELECT_ALL)) {

            while (rs.next()) {
                // Check these types against your Restaurant.java fields!
                list.add(new Restaurant(
                    rs.getInt("restaurant_id"),
                    rs.getString("name"),
                    rs.getString("cuisine_type"),
                    rs.getInt("delivery_time"),
                    rs.getString("address"),
                    rs.getFloat("rating"),
                    rs.getBoolean("is_active"),
                    rs.getString("image_path")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {
        // This is the second method from your interface
        // Return null for now just to clear the error
        return null; 
    }
}