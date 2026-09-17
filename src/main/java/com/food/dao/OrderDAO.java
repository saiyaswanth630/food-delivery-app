package com.food.dao;

import java.sql.Connection;
import com.food.model.OrderItem;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.model.Order;

import com.food.util.DBConnection;

public class OrderDAO {

	public int addOrder(Order order){

	    String query =
	    "INSERT INTO orders(user_id,total_amount,order_date,status) VALUES(?,?,NOW(),?)";

	    try{

	        Connection con =
	        DBConnection.getConnection();

	        PreparedStatement ps =
	        con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

	        ps.setInt(1, order.getUserId());

	        ps.setDouble(2, order.getTotalAmount());

	        ps.setString(3, order.getStatus());

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();

	        if(rs.next()){

	            return rs.getInt(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return -1;

	}
    public List<Order> getOrdersByUserId(

    		int userId){

    		List<Order> list=

    		new ArrayList<>();

    		String query=

    		"SELECT * FROM orders WHERE user_id=?";

    		try{

    		Connection con=

    		DBConnection.getConnection();

    		PreparedStatement ps=

    		con.prepareStatement(query);

    		ps.setInt(1,userId);

    		ResultSet rs=

    		ps.executeQuery();

    		while(rs.next()){

    		Order o=

    		new Order();

    		o.setId(

    		rs.getInt("id")

    		);

    		o.setUserId(

    		rs.getInt("user_id")

    		);

    		o.setTotalAmount(

    		rs.getDouble(

    		"total_amount"

    		)

    		);

    		o.setOrderDate(

    		rs.getString(

    		"order_date"

    		)

    		);

    		o.setStatus(

    		rs.getString(

    		"status"

    		)

    		);

    		list.add(o);

    		}

    		}

    		catch(Exception e){

    		e.printStackTrace();

    		}

    		return list;

    		}
    public void addOrderItem(int orderId,int menuId,int quantity,double subtotal){

        String sql="INSERT INTO order_items(order_id,menu_id,quantity,subtotal) VALUES(?,?,?,?)";

        try{

            Connection con=DBConnection.getConnection();

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,orderId);
            ps.setInt(2,menuId);
            ps.setInt(3,quantity);
            ps.setDouble(4,subtotal);

            ps.executeUpdate();

        }
        catch(Exception e){

            e.printStackTrace();

        }

    }
    public List<OrderItem> getOrderItems(int orderId){

        List<OrderItem> list = new ArrayList<>();

        String sql =
        "SELECT oi.*,m.item_name,m.price " +
        "FROM order_items oi " +
        "JOIN menu m ON oi.menu_id=m.id " +
        "WHERE oi.order_id=?";

        try{

            Connection con=DBConnection.getConnection();

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,orderId);

            ResultSet rs=ps.executeQuery();

            while(rs.next()){

                OrderItem item=new OrderItem();

                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setMenuId(rs.getInt("menu_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setSubtotal(rs.getDouble("subtotal"));

                item.setItemName(rs.getString("item_name"));
                item.setPrice(rs.getDouble("price"));

                list.add(item);

            }

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

}
