/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Product {

    protected int p_id, price, stock;
    protected String pname, de, type_id, image;

    public Product() {
    }

    public Product(int p_id, String type_id, int price, int stock, String pname, String de, String image) {
        this.p_id = p_id;
        this.type_id = type_id;
        this.price = price;
        this.stock = stock;
        this.pname = pname;
        this.de = de;
        this.image = image;
    }

    public Product(String type_id, int price, int stock, String pname, String de, String image) {
        this.type_id = type_id;
        this.price = price;
        this.stock = stock;
        this.pname = pname;
        this.de = de;
        this.image = image;
    }

    public int getP_id() {
        return p_id;
    }

    public String getType_id() {
        return type_id;
    }

    public int getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public int getStock() {
        return stock;
    }

    public String getPname() {
        return pname;
    }

    public String getDe() {
        return de;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setDe(String de) {
        this.de = de;
    }

    @Override
    public String toString() {
        return "Product{" + "p_id=" + p_id + ", type_id=" + type_id + ", price=" + price + ", image=" + image + ", stock=" + stock + ", pname=" + pname + ", de=" + de + '}';
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || obj.getClass() != this.getClass()) {
            return false;
        }

        Product id = (Product) obj;

        // comparing the state of argument with  
        // the state of 'this' Object. 
        return (id.getP_id() == this.p_id);
    }

    //------------------------------------------------------------------------------------------------
    public ArrayList<Product> getType(String type) {
        ArrayList<Product> al = new ArrayList<>();
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from Product where type = ?");
            stmt.setString(1, type);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                p_id = rs.getInt("P_id");
                pname = rs.getString("P_name");
                type_id = rs.getString("type");
                price = rs.getInt("price");
                image = rs.getString("image");
                stock = rs.getInt("stock");
                de = rs.getString("description");
                al.add(new Product(p_id, type_id, price, stock, pname, de, image));
            }
            con.close();
        } catch (Exception ex) {
            //            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return al;
    }

    public Product getPro(String id) {
        ArrayList<Product> al = new ArrayList<>();
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from Product where P_id = ?");
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                p_id = rs.getInt("P_id");
                pname = rs.getString("P_name");
                type_id = rs.getString("type");
                price = rs.getInt("price");
                image = rs.getString("image");
                stock = rs.getInt("stock");
                de = rs.getString("description");
                Product x = new Product(p_id, type_id, price, stock, pname, de, image);
                return x;
            }
            con.close();
        } catch (Exception ex) {
            //            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return null;
    }

    public void reduceStock(int quantity) throws ClassNotFoundException, SQLException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("update Product set stock = ? where P_id = ?");
        stmt.setInt(1, stock - quantity);
        stmt.setInt(2, p_id);
        System.out.print(stock + "\t" + p_id + "\t" + (stock - quantity));
        stmt.execute();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException, IOException {
        Product t = new Product();
        t.setP_id(35);
        t.deletePro();
    }

    public void addPro() {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("insert into Product(P_name, type, price, stock, description, image) output inserted.P_id values(?,?,?,?,?,?)");
            stmt.setString(1, pname);
            stmt.setString(2, type_id);
            stmt.setInt(3, price);
            stmt.setInt(4, stock);
            stmt.setString(5, de);
            stmt.setString(6, image);
            stmt.executeQuery();
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public void updatePro() {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("update Product set P_name = ?, type = ?, price = ?, stock = ?, description = ? where P_id = ?");
            stmt.setString(1, pname);
            stmt.setString(2, type_id);
            stmt.setInt(3, price);
            stmt.setInt(4, stock);
            stmt.setString(5, de);
            stmt.setInt(6, p_id);
            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.print("Loi roi : " + e);
        }
    }

    public void deletePro() {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("delete from Product where P_id = ?");
            stmt.setInt(1, p_id);
            stmt.execute();
        } catch (Exception e) {
            System.out.print("Loi roi : " + e);
        }
    }
}
