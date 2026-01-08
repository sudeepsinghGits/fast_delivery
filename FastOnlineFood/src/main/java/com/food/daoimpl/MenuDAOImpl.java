package com.food.daoimpl;

import java.sql.*;
import java.util.*;
import com.food.dao.MenuDAO;
import com.food.model.Menu;
import com.food.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {
    
    private static final String SELECT_BY_RESTAURANT = "SELECT * FROM menu WHERE restaurant_id = ?";

    @Override
    public List<Menu> getMenuByRestaurant(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_BY_RESTAURANT)) {
            
            pstmt.setInt(1, restaurantId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                menuList.add(new Menu(
                    rs.getInt("menu_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("item_name"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getBoolean("is_available"),
                    rs.getString("image_path")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }
}
