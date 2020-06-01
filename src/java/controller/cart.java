/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.Product;

/**
 *
 * @author HaiLong
 */
@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class cart extends HttpServlet {
    Cart c = new Cart();
    Order or = null;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String page = request.getParameter("page");
        String id = request.getParameter("id");
        String ac = request.getParameter("action");

        HttpSession session = request.getSession();

        if (page.equals("addtocart")) {
            Product x = new Product();
            c.addToCart(x.getPro(id));
            session = request.getSession();
            session.setAttribute("cart", c.getAl());
        } else if (page.equals("remove")) {
            Product x = new Product();
            c.removePro(x.getPro(id));
            session = request.getSession();
            session.setAttribute("cart", c.getAl());
        } else if (page.equals("logout")) {
            c.delete();
            session.invalidate();
        } else if (page.equals("delete")) {
            try {
                String name = (String) session.getAttribute("named");
                String address = (String) session.getAttribute("addressd");
                String phone = (String) session.getAttribute("phoned");
                int c_id = (int) session.getAttribute("idu");

                or = new Order(c_id, c.getTotal(), phone, address);
                or.setAl(c.getAl());
                or.addCart();

                c.delete();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cart.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cart.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        request.getRequestDispatcher(ac + ".jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
