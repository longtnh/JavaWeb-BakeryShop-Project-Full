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
import model.Feedback;

/**
 *
 * @author HaiLong
 */
@WebServlet(name = "confirmFeedback", urlPatterns = {"/confirmFeedback"})
public class confirmFeedback extends HttpServlet {

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

        String check[] = request.getParameterValues("checkFeed");

        for (String c : check) {
            Feedback f = new Feedback();
            try {
                f.getFeedId(Integer.parseInt(c));
                f.confirmFeedback(Integer.parseInt(c));
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(confirmFeedback.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(confirmFeedback.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("feedbackManager.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
