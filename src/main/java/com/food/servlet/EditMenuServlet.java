package com.food.servlet;

import java.io.IOException;

import com.food.dao.MenuDAO;
import com.food.model.Menu;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)throws IOException{

        Menu m = new Menu();

        m.setId(Integer.parseInt(request.getParameter("id")));
        m.setItemName(request.getParameter("itemName"));
        m.setPrice(Double.parseDouble(request.getParameter("price")));
        m.setDescription(request.getParameter("description"));

        MenuDAO dao = new MenuDAO();

        dao.updateMenu(m);

        response.sendRedirect("admin.jsp?msg=Menu Updated Successfully");

    }

}
