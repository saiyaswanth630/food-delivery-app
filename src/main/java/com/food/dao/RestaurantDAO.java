package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.model.Restaurant;
import com.food.util.DBConnection;

public class RestaurantDAO {

    // =====================================================
    // GET ALL RESTAURANTS
    // =====================================================

    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurants = new ArrayList<>();

        String sql = "SELECT * FROM restaurants";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Restaurant r = new Restaurant();

                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setCategory(rs.getString("category"));
                r.setRating(rs.getDouble("rating"));
                r.setImage(rs.getString("image"));

                restaurants.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurants;
    }


    // =====================================================
    // SEARCH RESTAURANT
    // =====================================================

    public List<Restaurant> searchRestaurant(String search) {

        List<Restaurant> list = new ArrayList<>();

        String sql =
            "SELECT * FROM restaurants WHERE name LIKE ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, "%" + search + "%");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Restaurant r = new Restaurant();

                    r.setId(rs.getInt("id"));
                    r.setName(rs.getString("name"));
                    r.setCategory(rs.getString("category"));
                    r.setRating(rs.getDouble("rating"));
                    r.setImage(rs.getString("image"));

                    list.add(r);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // =====================================================
    // ADD RESTAURANT
    // =====================================================

    public void addRestaurant(Restaurant r) {

        String sql =
            "INSERT INTO restaurants " +
            "(name, category, rating, image) " +
            "VALUES (?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, r.getName());
            ps.setString(2, r.getCategory());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getImage());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // =====================================================
    // GET RESTAURANT BY ID
    // =====================================================

    public Restaurant getRestaurantById(int id) {

        Restaurant r = null;

        String sql =
            "SELECT * FROM restaurants WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    r = new Restaurant();

                    r.setId(rs.getInt("id"));
                    r.setName(rs.getString("name"));
                    r.setCategory(rs.getString("category"));
                    r.setRating(rs.getDouble("rating"));
                    r.setImage(rs.getString("image"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }


    // =====================================================
    // UPDATE RESTAURANT
    // =====================================================

    public void updateRestaurant(Restaurant r) {

        String sql =
            "UPDATE restaurants " +
            "SET name=?, category=?, rating=?, image=? " +
            "WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, r.getName());
            ps.setString(2, r.getCategory());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getImage());
            ps.setInt(5, r.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // =====================================================
    // DELETE RESTAURANT
    // =====================================================

    public void deleteRestaurant(int id) {

        String sql =
            "DELETE FROM restaurants WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}