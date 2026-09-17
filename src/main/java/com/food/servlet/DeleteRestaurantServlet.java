package com.food.servlet;

import java.io.IOException;

import com.food.dao.RestaurantDAO;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRestaurant")

public class DeleteRestaurantServlet

extends HttpServlet{

protected void doGet(

HttpServletRequest request,

HttpServletResponse response)

throws IOException{

int id=

Integer.parseInt(

request.getParameter(

"id"

)

);

RestaurantDAO dao=

new RestaurantDAO();

dao.deleteRestaurant(

id

);

response.sendRedirect("admin.jsp?msg=Restaurant Deleted Successfully");
}

}