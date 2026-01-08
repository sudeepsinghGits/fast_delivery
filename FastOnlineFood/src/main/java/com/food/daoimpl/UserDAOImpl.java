package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

	private static final String INSERT_USER = "INSERT INTO users (name, username, password, email, phone, address, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_USER_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
	private static final String UPDATE_USER = "UPDATE users SET name=?, phone=?, address=? WHERE user_id=?";
	private static final String DELETE_USER = "DELETE FROM users WHERE user_id=?";

	
	private static final String SELECT_USER = "SELECT * FROM users WHERE email = ? AND password = ?";
    @Override
    public int addUser(User user) {
        int status = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_USER)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getRole());
            status = ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }

    @Override
    public User getUser(String email, String password) {
        User user = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_USER)) {
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new User(
                    rs.getInt("user_id"), // <-- CHECK THIS NAME IN SQL
                    rs.getString("name"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("role")
                );
                System.out.println("User found: " + user.getName());
            } else {
                System.out.println("No user found with Email: " + email + " and provided password.");
            }
        } catch (Exception e) {
            System.out.println("Database Error!");
            e.printStackTrace(); 
        }
        return user;
    }

    @Override
    public int updateUser(User user) {
        int status = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_USER)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getUserId());
            status = ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }

    @Override
    public int deleteUser(int userId) {
        int status = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_USER)) {
            ps.setInt(1, userId);
            status = ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }
}

