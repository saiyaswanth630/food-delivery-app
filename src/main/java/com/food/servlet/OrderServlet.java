package com.food.servlet;

import java.io.IOException;

import com.food.dao.OrderDAO;
import com.food.model.Order;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.food.dao.MenuDAO;
import com.food.model.Menu;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException{

        HttpSession session=request.getSession();

        User user=(User)session.getAttribute("user");

        if(user==null){

            response.sendRedirect("login.jsp");

            return;

        }

        double total=(Double)session.getAttribute("total");

        String payment=request.getParameter("payment");

        Order order=new Order();

        order.setUserId(user.getId());

        order.setTotalAmount(total);

        order.setStatus("Placed");

        OrderDAO dao=new OrderDAO();

        int orderId = dao.addOrder(order);

        if(orderId != -1){

            List<Integer> cart =
                    (List<Integer>)session.getAttribute("cart");

            MenuDAO menuDAO = new MenuDAO();

            Map<Integer,Integer> quantityMap = new HashMap<>();

            for(Integer menuId : cart){

                quantityMap.put(menuId,
                        quantityMap.getOrDefault(menuId,0)+1);

            }

            for(Integer menuId : quantityMap.keySet()){

                int quantity = quantityMap.get(menuId);

                Menu menu = menuDAO.getMenuById(menuId);

                double subtotal = quantity * menu.getPrice();

                dao.addOrderItem(orderId,
                        menuId,
                        quantity,
                        subtotal);

            }

            request.setAttribute("orderId",orderId);

            request.setAttribute("payment",payment);

            session.removeAttribute("cart");

            session.removeAttribute("restaurantId");

            session.removeAttribute("total");

            request.getRequestDispatcher("orderSuccess.jsp")
            .forward(request,response);

        }
        else{

            response.getWriter().println("Order Failed");

        }
    }

}