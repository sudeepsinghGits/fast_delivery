package com.food.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.model.CartItem;
import com.food.model.Order;

public class OrderDAO {
    private String url = "jdbc:mysql://localhost:3306/fast_delivery_db";
    private String username = "root";
    private String password = "root123";

    public int saveOrder(Order order) {
        String sql = "INSERT INTO orders (user_id, restaurant_id, total_amount, status, payment_mode, address) VALUES (?, ?, ?, ?, ?, ?)";
        int generatedId = -1;

        try (Connection con = DriverManager.getConnection(url, username, password);
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setDouble(3, order.getTotalAmount());
            ps.setString(4, order.getStatus());
            ps.setString(5, order.getPaymentMode());
            ps.setString(6, order.getAddress());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public void saveOrderItem(int orderId, CartItem item) {
        String sql = "INSERT INTO order_items (order_id, menu_id, item_name, quantity, item_price) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection con = DriverManager.getConnection(url, username, password);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ps.setInt(2, item.getItemId());
            ps.setString(3, item.getName());
            ps.setInt(4, item.getQuantity());
            ps.setDouble(5, (double) item.getPrice());

            ps.executeUpdate();
            System.out.println("Item saved successfully: " + item.getName());
            
        } catch (SQLException e) {
            System.err.println("Database Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * NEW METHOD: Fetches all user details along with their order info.
     * Uses INNER JOIN to link 'users' and 'orders' tables via 'user_id'.
     */
    public void getAllUsersWithOrders() {
        String sql = "SELECT u.user_id, u.userName, u.email, o.order_id, o.total_amount, o.address, o.order_date " +
                     "FROM users u " +
                     "JOIN orders o ON u.user_id = o.user_id " +
                     "ORDER BY o.order_date DESC";

        try (Connection con = DriverManager.getConnection(url, username, password);
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            System.out.println("\n--- ALL USER DETAILS & ORDERS ---");
            System.out.printf("%-10s | %-15s | %-20s | %-10s | %-10s | %-15s\n", 
                              "User ID", "Name", "Email", "Order ID", "Total", "Address");
            System.out.println("-------------------------------------------------------------------------------------------------");

            while (rs.next()) {
                System.out.printf("%-10d | %-15s | %-20s | %-10d | ₹%-9.2f | %-15s\n",
                                  rs.getInt("user_id"),
                                  rs.getString("userName"),
                                  rs.getString("email"),
                                  rs.getInt("order_id"),
                                  rs.getDouble("total_amount"),
                                  rs.getString("address"));
            }
            System.out.println("-------------------------------------------------------------------------------------------------");

        } catch (SQLException e) {
            System.err.println("Error fetching user details: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
