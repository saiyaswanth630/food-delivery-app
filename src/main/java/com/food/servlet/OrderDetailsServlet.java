package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("id"));

        OrderDAO dao = new OrderDAO();

        List<OrderItem> items = dao.getOrderItems(orderId);

        request.setAttribute("items", items);

        request.setAttribute("orderId", orderId);

        request.getRequestDispatcher("orderDetails.jsp")
               .forward(request, response);

    }

}