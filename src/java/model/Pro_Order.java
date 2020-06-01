/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Pro_Order extends Product {

    private int quantity, total, or_id;

    public Pro_Order() {
        super();
    }

    public Pro_Order(int quantity) {
        this.quantity = quantity;
    }

    public Pro_Order(int quantity, int or_id, int p_id, String type_id, int price, int stock, String pname, String de, String image) {
        super(p_id, type_id, price, stock, pname, de, image);
        this.quantity = quantity;
        this.or_id = or_id;
    }

    public Pro_Order(int quantity, int p_id, String type_id, int price, int stock, String pname, String de, String image) {
        super(p_id, type_id, price, stock, pname, de, image);
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getTotal() {
        return total = quantity * price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    //-------------------------------------------------------------------------------------------

    public void addProLine(int orid) throws ClassNotFoundException, SQLException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Insert into Pro_Order values (?,?,?,?)");
        stmt.setInt(2, p_id);
        stmt.setInt(3, quantity);
        stmt.setInt(1, orid);
        stmt.setInt(4, total);
        stmt.execute();
    }

    public ArrayList<Pro_Order> getOr(int or_id) {
        ArrayList<Pro_Order> al = new ArrayList<>();
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from Pro_Order where Or_id = ?");
            stmt.setInt(1, or_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                p_id = rs.getInt("P_id");
                quantity = rs.getInt("quantity");
                total = rs.getInt("total");
                al.add(new Pro_Order(quantity, or_id, p_id, type_id, price, stock, pname, de, image));
            }
            con.close();
        } catch (Exception ex) {
            //            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return al;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        Product pro = new Pro_Order();
//        pro.getPro("1");
//        Pro_Order p = new Pro_Order(1, pro.getP_id(), pro.getType_id(), pro.getPrice(), pro.getStock(), pro.getPname(), pro.getDe(), pro.getImage());
//        p.addProLine(15);
    }
}
