package com.food.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove")
public class RemoveCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();

        List<Integer> cart =
                (List<Integer>) session.getAttribute("cart");

        if (cart != null) {

            cart.remove(Integer.valueOf(id));

            // ✅ If cart becomes empty, clear everything
            if (cart.isEmpty()) {

                session.removeAttribute("cart");

                session.removeAttribute("restaurantId");

            } else {

                session.setAttribute("cart", cart);

            }
        }

        response.sendRedirect("cart.jsp");
    }
}