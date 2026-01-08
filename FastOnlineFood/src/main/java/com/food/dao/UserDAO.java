package com.food.dao;

import com.food.model.User;

public interface UserDAO {
    int addUser(User user);
    User getUser(String email, String password);    // Check if this exists!
    int updateUser(User user);      // Check if this exists!
    int deleteUser(int userId);    // Check if this exists!
}