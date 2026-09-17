package com.food.servlet;

import java.io.IOException;

import com.food.dao.MenuDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet{

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException{

        int id=Integer.parseInt(request.getParameter("id"));

        MenuDAO dao=new MenuDAO();

        dao.deleteMenu(id);

        response.sendRedirect("admin.jsp?msg=Menu Deleted Successfully");

    }

}