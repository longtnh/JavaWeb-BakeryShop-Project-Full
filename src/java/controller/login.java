/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;

/**
 *
 * @author HaiLong
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");
        HttpSession s = request.getSession();
        try {
            Customer c = new Customer();
            if (c.logIn(username, password) != null) {
                if (c.getStatus() == 1) {
                    response.setContentType("text/html");
                    PrintWriter pw = response.getWriter();
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('This username is blocked because you boom a lot of order of us !');");
                    pw.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
                    rd.include(request, response);
                } else {
                    s.setAttribute("cname", c.getC_name());
                    s.setAttribute("uname", c.getC_username());
                    s.setAttribute("idu", c.getC_id());
                    s.setAttribute("role", String.valueOf(c.getRole()));
                    if (request.getParameter("remember") != null) {
                        Cookie co = new Cookie("us", username);
                        co.setMaxAge(24 * 60 * 60);
                        response.addCookie(co);
                        Cookie co1 = new Cookie("pa", password);
                        co1.setMaxAge(24 * 60 * 60);
                        response.addCookie(co1);
                    }
                    response.sendRedirect("order.jsp");
                }
            } else {
                response.setContentType("text/html");
                PrintWriter pw = response.getWriter();
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Your username or password is not correct');");
                pw.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
                rd.include(request, response);
//                request.getRequestDispatcher("order.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
