package com.food.servlet;

import java.io.IOException;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editRestaurant")

public class EditRestaurantServlet extends HttpServlet{

protected void doPost(HttpServletRequest request,
HttpServletResponse response)throws IOException{

Restaurant r=new Restaurant();

r.setId(Integer.parseInt(request.getParameter("id")));
r.setName(request.getParameter("name"));
r.setCategory(request.getParameter("category"));
r.setRating(Double.parseDouble(request.getParameter("rating")));
r.setImage(request.getParameter("image"));

RestaurantDAO dao=new RestaurantDAO();

dao.updateRestaurant(r);

response.sendRedirect("admin.jsp?msg=Restaurant Updated Successfully");

}

}
