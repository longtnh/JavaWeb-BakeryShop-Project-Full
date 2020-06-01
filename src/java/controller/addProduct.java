/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

/**
 *
 * @author HaiLong
 */
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
@MultipartConfig
public class addProduct extends HttpServlet {

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
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String stock = request.getParameter("stock");
        String price = request.getParameter("price");
        Part filePart = request.getPart("photo");
        String des = request.getParameter("de");

        if (filePart != null) {
            // prints out some information for debugging
            String fileName = extractFileName(filePart);
            fileName = new File(fileName).getName();

            System.out.println("XXX" + File.separator + fileName);
            filePart.write("E:\\NetBeans\\BakeryShop_FSoft\\web\\image\\" + fileName);
            Product p = new Product(type, Integer.parseInt(price), Integer.parseInt(stock), name, des, "image/" + fileName);
            p.addPro();
        }

        request.getRequestDispatcher("order.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
