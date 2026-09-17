package com.food.servlet;

import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // Validation
        if(email.isEmpty() || password.isEmpty()){

            response.getWriter().println("Email and Password are required.");

            return;
        }

        UserDAO dao = new UserDAO();

        User user = dao.validateUser(email, password);

        if(user != null){

            request.getSession().setAttribute("user", user);

            if("ADMIN".equalsIgnoreCase(user.getRole())){

                response.sendRedirect("admin.jsp");

            }else{

                response.sendRedirect("restaurants");

            }

        }else{

            response.getWriter().println("<h2 style='color:red;text-align:center;'>Invalid Email or Password</h2>");
            response.getWriter().println("<div style='text-align:center;margin-top:20px;'>");
            response.getWriter().println("<a href='login.jsp'>Try Again</a>");
            response.getWriter().println("</div>");

        }

    }

}