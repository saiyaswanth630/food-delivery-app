package com.food.servlet;

import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String address = request.getParameter("address").trim();

        UserDAO dao = new UserDAO();

        if(name.isEmpty() || email.isEmpty() || password.isEmpty() || address.isEmpty()){

            response.getWriter().println("All fields are required.");

            return;
        }

        if(password.length() < 6){

            response.getWriter().println("Password must contain at least 6 characters.");

            return;
        }

        if(dao.emailExists(email)){

            response.getWriter().println("Email already registered.");

            return;
        }

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAddress(address);
        user.setRole("CUSTOMER");

        boolean result = dao.addUser(user);

        if(result){

            response.sendRedirect("login.jsp");

        }else{

            response.getWriter().println("Registration Failed.");

        }

    }

}