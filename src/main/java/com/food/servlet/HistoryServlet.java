package com.food.servlet;

import java.io.IOException;

import java.util.List;

import com.food.dao.OrderDAO;

import com.food.model.Order;

import com.food.model.User;

import jakarta.servlet.*;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.*;

@WebServlet("/history")

public class HistoryServlet

extends HttpServlet {

protected void doGet(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,

IOException {

User user=

(User)

request.getSession()

.getAttribute(

"user"

);

OrderDAO dao=

new OrderDAO();

List<Order> orders=

dao.getOrdersByUserId(

user.getId()

);

request.setAttribute(

"orders",

orders

);

request.getRequestDispatcher(

"history.jsp"

)

.forward(

request,

response

);

}

}
