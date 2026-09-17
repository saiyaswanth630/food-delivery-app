package com.food.servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;

@WebServlet("/clearcart")

public class ClearCartServlet

extends HttpServlet{

protected void doGet(

HttpServletRequest request,

HttpServletResponse response)

throws IOException{

HttpSession session=

request.getSession();

session.removeAttribute(

"cart"

);

session.removeAttribute(

"restaurantId"

);

response.sendRedirect(

"restaurants"

);

}
}
