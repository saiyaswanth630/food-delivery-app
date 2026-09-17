package com.food.servlet;

import java.io.IOException;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        String name = request.getParameter("name").trim();
        String category = request.getParameter("category").trim();
        String ratingStr = request.getParameter("rating").trim();
        String image = request.getParameter("image").trim();

        // Validation
        if(name.isEmpty() || category.isEmpty() || ratingStr.isEmpty() || image.isEmpty()){

            response.getWriter().println("<h2>All fields are required.</h2>");
            response.getWriter().println("<a href='addRestaurant.jsp'>Go Back</a>");
            return;
        }

        double rating;

        try{

            rating = Double.parseDouble(ratingStr);

        }catch(Exception e){

            response.getWriter().println("<h2>Invalid Rating.</h2>");
            response.getWriter().println("<a href='addRestaurant.jsp'>Go Back</a>");
            return;
        }

        if(rating < 0 || rating > 5){

            response.getWriter().println("<h2>Rating must be between 0 and 5.</h2>");
            response.getWriter().println("<a href='addRestaurant.jsp'>Go Back</a>");
            return;
        }

        Restaurant r = new Restaurant();

        r.setName(name);
        r.setCategory(category);
        r.setRating(rating);
        r.setImage(image);

        RestaurantDAO dao = new RestaurantDAO();

        dao.addRestaurant(r);

        response.sendRedirect("admin.jsp?msg=Restaurant Added Successfully");
    }
}