package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.model.Menu;
import com.food.util.DBConnection;

public class MenuDAO {

    // =========================================================
    // GET MENU BY RESTAURANT ID
    // =========================================================

    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menus = new ArrayList<>();

        String sql =
                "SELECT * FROM menu WHERE restaurant_id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu m = new Menu();

                m.setId(rs.getInt("id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setPrice(rs.getDouble("price"));
                m.setDescription(rs.getString("description"));
                m.setImage(rs.getString("image"));

                menus.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }


    // =========================================================
    // GET MENU BY ID
    // =========================================================

    public Menu getMenuById(int id) {

        String sql =
                "SELECT * FROM menu WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Menu m = new Menu();

                m.setId(rs.getInt("id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setPrice(rs.getDouble("price"));
                m.setDescription(rs.getString("description"));
                m.setImage(rs.getString("image"));

                return m;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // ADD MENU
    // =========================================================

    public void addMenu(Menu m) {

        String sql =
                "INSERT INTO menu " +
                "(restaurant_id,item_name,price,description,image) " +
                "VALUES(?,?,?,?,?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setDouble(3, m.getPrice());
            ps.setString(4, m.getDescription());
            ps.setString(5, m.getImage());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // =========================================================
    // DELETE MENU
    // =========================================================

    public void deleteMenu(int id) {

        String sql =
                "DELETE FROM menu WHERE id=?";

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


    // =========================================================
    // GET ALL MENUS
    // =========================================================

    public List<Menu> getAllMenus() {

        List<Menu> menuList = new ArrayList<>();

        String sql =
                "SELECT * FROM menu";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu m = new Menu();

                m.setId(rs.getInt("id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setPrice(rs.getDouble("price"));
                m.setDescription(rs.getString("description"));
                m.setImage(rs.getString("image"));

                menuList.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }


    // =========================================================
    // GET MENUS BY RESTAURANT ID
    // =========================================================

    public List<Menu> getMenusByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        String sql =
                "SELECT * FROM menu WHERE restaurant_id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu m = new Menu();

                m.setId(rs.getInt("id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setPrice(rs.getDouble("price"));
                m.setDescription(rs.getString("description"));
                m.setImage(rs.getString("image"));

                menuList.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }


    // =========================================================
    // UPDATE MENU
    // =========================================================

    public void updateMenu(Menu m) {

        String sql =
                "UPDATE menu " +
                "SET item_name=?, price=?, description=?, image=? " +
                "WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, m.getItemName());
            ps.setDouble(2, m.getPrice());
            ps.setString(3, m.getDescription());
            ps.setString(4, m.getImage());
            ps.setInt(5, m.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}