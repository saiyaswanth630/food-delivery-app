package com.food.servlet;

import java.io.IOException;

import com.food.dao.MenuDAO;
import com.food.model.Menu;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        String restaurantIdStr = request.getParameter("restaurantId");
        String itemName = request.getParameter("itemName").trim();
        String priceStr = request.getParameter("price").trim();
        String description = request.getParameter("description").trim();

        // Validation
        if (restaurantIdStr == null || restaurantIdStr.isEmpty()
                || itemName.isEmpty()
                || priceStr.isEmpty()
                || description.isEmpty()) {

            response.getWriter().println("<h2>All fields are required.</h2>");
            response.getWriter().println("<a href='addMenu.jsp'>Go Back</a>");
            return;
        }

        int restaurantId;
        double price;

        try {

            restaurantId = Integer.parseInt(restaurantIdStr);
            price = Double.parseDouble(priceStr);

        } catch (Exception e) {

            response.getWriter().println("<h2>Invalid Price.</h2>");
            response.getWriter().println("<a href='addMenu.jsp'>Go Back</a>");
            return;
        }

        if (price <= 0) {

            response.getWriter().println("<h2>Price must be greater than 0.</h2>");
            response.getWriter().println("<a href='addMenu.jsp'>Go Back</a>");
            return;
        }

        Menu m = new Menu();

        m.setRestaurantId(restaurantId);
        m.setItemName(itemName);
        m.setPrice(price);
        m.setDescription(description);

        MenuDAO dao = new MenuDAO();

        dao.addMenu(m);

        response.sendRedirect("admin.jsp?msg=Menu Added Successfully");
    }
}