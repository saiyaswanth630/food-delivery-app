package com.food.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(
                request.getParameter("menuId"));

        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        List<Integer> cart =
                (List<Integer>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }


        /* ================= ADD ================= */

        if (action == null || action.equals("add")) {

            int restaurantId = Integer.parseInt(
                    request.getParameter("restaurantId"));

            Integer currentRestaurant =
                    (Integer) session.getAttribute("restaurantId");


            if (cart.isEmpty()) {
                session.setAttribute(
                        "restaurantId",
                        restaurantId);
            }

            else if (currentRestaurant != null &&
                     currentRestaurant != restaurantId) {

                response.sendRedirect(
                        "restaurantWarning.jsp");

                return;
            }


            cart.add(menuId);

            session.setAttribute(
                    "cart",
                    cart);

            session.setAttribute(
                    "cartMessage",
                    "Item added to cart successfully!");


            response.sendRedirect(
                    "menu?restaurantId=" + restaurantId);

            return;
        }


        /* ================= INCREASE ================= */

        if (action.equals("increase")) {

            cart.add(menuId);

            session.setAttribute(
                    "cart",
                    cart);


            response.setContentType(
                    "application/json");

            response.setCharacterEncoding(
                    "UTF-8");

            response.getWriter().write(
                    "{\"success\":true}");

            return;
        }


        /* ================= DECREASE ================= */

        if (action.equals("decrease")) {

            cart.remove(
                    Integer.valueOf(menuId));


            if (cart.isEmpty()) {

                session.removeAttribute(
                        "cart");

                session.removeAttribute(
                        "restaurantId");

            } else {

                session.setAttribute(
                        "cart",
                        cart);
            }


            response.setContentType(
                    "application/json");

            response.setCharacterEncoding(
                    "UTF-8");

            response.getWriter().write(
                    "{\"success\":true}");

            return;
        }
    }
}