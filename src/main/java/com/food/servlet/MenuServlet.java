package com.food.servlet;

import java.io.IOException;

import java.util.List;

import com.food.dao.MenuDAO;

import com.food.model.Menu;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")

public class MenuServlet

extends HttpServlet {

    protected void doGet(

    HttpServletRequest request,

    HttpServletResponse response)

    throws ServletException,

    IOException {

        int restaurantId =

        Integer.parseInt(

        request.getParameter(

        "restaurantId"

        )

        );

        MenuDAO dao =

        new MenuDAO();

        List<Menu> menus =

        dao.getMenuByRestaurantId(

        restaurantId

        );

        request.setAttribute(

        "menus",

        menus

        );

        request.getRequestDispatcher(

        "menu.jsp"

        )

        .forward(

        request,

        response

        );

    }

}
