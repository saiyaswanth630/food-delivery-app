package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.food.util.DBConnection;

public class AdminDAO {

    public int getRestaurantCount() {

        return getCount("SELECT COUNT(*) FROM restaurants");

    }

    public int getMenuCount() {

        return getCount("SELECT COUNT(*) FROM menu");

    }

    public int getCustomerCount() {

        return getCount("SELECT COUNT(*) FROM users WHERE role='CUSTOMER'");

    }

    public int getOrderCount() {

        return getCount("SELECT COUNT(*) FROM orders");

    }

    private int getCount(String sql) {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return count;

    }

}