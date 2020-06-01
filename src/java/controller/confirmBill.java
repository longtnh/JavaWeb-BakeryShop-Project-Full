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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Order;

/**
 *
 * @author HaiLong
 */
@WebServlet(name = "confirmBill", urlPatterns = {"/confirmBill"})
public class confirmBill extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String Or_id = request.getParameter("Or_id");
        String cid = request.getParameter("cid");
        String t = request.getParameter("t");
        int order_id = Integer.parseInt(Or_id);
        int c_id = Integer.parseInt(cid);

        System.out.println(cid + "\t" + t + "\t");
        Order order = new Order();
        if (t.equals("0"))
            order.confirm(order_id, c_id, 1);
        else if (t.equals("1")){
            order.confirm(order_id, c_id, 2);
        } else if (t.equals("2")){
            order.confirm(order_id, c_id, 3);
        } else {
            try {
                order.confirm(order_id, c_id, 4);
                order.getOr_Id(order_id);
                Customer c = new Customer();
                c.getCusId(order.getOr_Id(order_id).get(0).getC_id());
                System.out.println(c.getBoom());
                if ((c.getBoom()+1) >= 3)
                    c.boom(order.getOr_Id(order_id).get(0).getC_id(), 1, c.getBoom() + 1);
                else 
                    c.boom(order.getOr_Id(order_id).get(0).getC_id(), 0, c.getBoom() + 1);
            } catch (SQLException ex) {
                Logger.getLogger(confirmBill.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("BillManager.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
