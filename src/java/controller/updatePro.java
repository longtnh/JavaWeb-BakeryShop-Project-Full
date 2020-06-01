/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author HaiLong
 */
@WebServlet(name = "updatePro", urlPatterns = {"/updatePro"})
public class updatePro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String pname = request.getParameter("pname");
        String type = request.getParameter("typeb");
        int stock = Integer.parseInt(request.getParameter("stock"));
        int price = Integer.parseInt(request.getParameter("price"));
        String de = request.getParameter("des");

        Product p = new Product(Integer.parseInt(pid), type, price, stock, pname, de, pname);
        p.updatePro();

        request.getRequestDispatcher("order.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
