package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")

public class RestaurantServlet extends HttpServlet {

	protected void doGet(

			HttpServletRequest request,

			HttpServletResponse response)

					throws ServletException, IOException {
		String search=
				request.getParameter("search");

				RestaurantDAO dao=
				new RestaurantDAO();

				List<Restaurant> restaurants;

				if(search!=null && !search.isEmpty()){

				restaurants=
				dao.searchRestaurant(search);

				}

				else{

				restaurants=
				dao.getAllRestaurants();

				}

				request.setAttribute(
				"restaurants",
				restaurants
				);

				request.getRequestDispatcher(
				"restaurants.jsp"
				)

				.forward(
				request,
				response
				);


	}

}