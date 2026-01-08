package com.food.test;

import com.food.model.User;
import com.food.daoimpl.UserDAOImpl;

public class MainTest {
    public static void main(String[] args) {
        // 1. Initialize the DAO Engine
        UserDAOImpl dao = new UserDAOImpl();
        
        // 2. Create a Dummy User (Matches your User.java constructor)
        // Order: id, name, username, password, email, phone, address, role
        User testUser = new User(0, "Gemini Test", "gemini123", "secret", "test@food.com", "99999", "Tech Street", "customer");
        
        // 3. Try to add to Database
        int result = dao.addUser(testUser);
        
        // 4. Check result
        if(result > 0) {
            System.out.println("🎉 SUCCESS: Connection works! User added to MySQL.");
        } else {
            System.out.println("❌ FAILURE: Code is okay, but check your MySQL Password or Database Name.");
        }
    }
}