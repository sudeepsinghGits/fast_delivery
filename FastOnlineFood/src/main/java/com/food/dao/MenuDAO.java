package com.food.dao;

import java.util.List;
import com.food.model.Menu;

public interface MenuDAO {
    List<Menu> getMenuByRestaurant(int restaurantId);
}