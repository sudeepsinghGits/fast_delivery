package com.food.daoimpl;

import com.food.model.Menu;
import java.util.List;

public class TestMenuDAO {
    public static void main(String[] args) {
        MenuDAOImpl dao = new MenuDAOImpl();
        
        // Try to fetch items for Restaurant ID 1
        List<Menu> items = dao.getMenuByRestaurant(1);
        
        if (items.isEmpty()) {
            System.out.println("❌ Verification Failed: No items found for Restaurant 1.");
        } else {
            System.out.println("✅ Verification Success! Found " + items.size() + " items:");
            for (Menu m : items) {
                System.out.println("- " + m.getItemName() + " (Price: " + m.getPrice() + ")");
            }
        }
    }
}