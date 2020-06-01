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
@WebServlet(name = "csignup", urlPatterns = {"/csignup"})
public class csignup extends HttpServlet {

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
            String username = request.getParameter("user");
            String password = request.getParameter("psws");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String age = request.getParameter("birth");
            Customer c = null;

            if (gender.equals("female")) {
                c = new Customer(username, password, name, address, Integer.parseInt(age), email, phone, "Nữ");
            } else {
                c = new Customer(username, password, name, address, Integer.parseInt(age), email, phone, "Nam");
            }

            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            if (!c.checkUser().equals("true")) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Your " + c.checkUser() + " is not valid');");
                pw.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
                rd.include(request, response);
            } else {
                try {
                    c.signUp();
                } catch (SQLException ex) {
                    Logger.getLogger(csignup.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println(name);
                HttpSession s = request.getSession();
                s.setAttribute("cname", name);
                s.setAttribute("uname", username);
                s.setAttribute("idu", c.getCus(username).getC_id());
                Cookie co = new Cookie("us", username);
                co.setMaxAge(24 * 60 * 60);
                response.addCookie(co);
                Cookie co1 = new Cookie("pa", password);
                co1.setMaxAge(24 * 60 * 60);
                response.addCookie(co1);
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Welcome " + c.getC_name() + " become our member');");
                pw.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
                rd.include(request, response);
            }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
