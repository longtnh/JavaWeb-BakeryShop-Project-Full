/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Search {

    private String text;

    public Search() {
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    //-------------------------------------------------------------------------------------------------------------
    public ArrayList<Product> userSearch(String tt) {
        ArrayList<Product> al = new ArrayList<>();
        String[] text = tt.split("\\s+");
        for (String t : text) {
            try {
                Connection con = ConnectSQL.getConnection();
                PreparedStatement stmt = con.prepareStatement("Select * from Product where P_name LIKE N'%" + t + "%'");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    int p_id = rs.getInt("P_id");
                    String pname = rs.getString("P_name");
                    String type_id = rs.getString("type");
                    int price = rs.getInt("price");
                    String image = rs.getString("image");
                    int stock = rs.getInt("stock");
                    String de = rs.getString("description");
                    al.add(new Product(p_id, type_id, price, stock, pname, de, image));
                }

                stmt = con.prepareStatement("Select * from Product where type LIKE N'%" + t + "%'");
                rs = stmt.executeQuery();
                while (rs.next()) {
                    int p_id = rs.getInt("P_id");
                    boolean z = false;
                    for (Product x : al) {
                        if (x.getP_id() == p_id) {
                            z = true;
                        }
                    }
                    if (z == false) {
                        String pname = rs.getString("P_name");
                        String type_id = rs.getString("type");
                        int price = rs.getInt("price");
                        String image = rs.getString("image");
                        int stock = rs.getInt("stock");
                        String de = rs.getString("description");
                        al.add(new Product(p_id, type_id, price, stock, pname, de, image));

                    }
                }

                stmt = con.prepareStatement("Select * from Product where description LIKE N'%" + t + "%'");
                rs = stmt.executeQuery();
                while (rs.next()) {
                    int p_id = rs.getInt("P_id");
                    boolean z = false;
                    for (Product x : al) {
                        if (x.getP_id() == p_id) {
                            z = true;
                        }
                    }
                    if (z == false) {
                        String pname = rs.getString("P_name");
                        String type_id = rs.getString("type");
                        int price = rs.getInt("price");
                        String image = rs.getString("image");
                        int stock = rs.getInt("stock");
                        String de = rs.getString("description");
                        al.add(new Product(p_id, type_id, price, stock, pname, de, image));

                    }
                }
                con.close();
            } catch (Exception ex) {
                //            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
            }
        }
        return al;
    }

    //---------------------------------------------------------------------------------------------
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Search s = new Search();
        System.out.println(s.userSearch("Drink"));;
    }
}
