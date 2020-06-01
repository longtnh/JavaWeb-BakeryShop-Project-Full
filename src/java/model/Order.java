/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Order extends Cart {

    private int or_id, c_id;
    private String phone, address;
    int status , staff;
    private Date day;

    public Order() {
    }

    public Order(int or_id) {
        this.or_id = or_id;
    }
   

    public Order(int c_id, int total, String phone, String address) {
        this.c_id = c_id;
        this.total = total;
        this.phone = phone;
        this.address = address;
    }

    public Order(int or_id, int c_id, int total, String phone, String address) {
        this.or_id = or_id;
        this.c_id = c_id;
        this.total = total;
        this.phone = phone;
        this.address = address;
    }

    public Order(int or_id, int c_id, int total, String phone, String address, int status, Date date) {
        this.or_id = or_id;
        this.c_id = c_id;
        this.total = total;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.day = date;
    }
    
    public Order(int or_id, int c_id, int total, String phone, String address, int status, Date date, int staff) {
        this.or_id = or_id;
        this.c_id = c_id;
        this.total = total;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.day = date;
        this.staff = staff;
    }

    public void setStaff(int staff) {
        this.staff = staff;
    }

    public int getStaff() {
        return staff;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    public int getOr_id() {
        return or_id;
    }

    public int getC_id() {
        return c_id;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public void setOr_id(int or_id) {
        this.or_id = or_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    @Override
    public int getTotal() {
        return total;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    @Override
    public String toString() {
        return "Order{" + "or_id=" + or_id + ", c_id=" + c_id + ", total=" + total + ", phone=" + phone + ", address=" + address + '}';
    }

    //------------------------------------------------------------------------------------------------------
    public void addCart() throws ClassNotFoundException, SQLException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("insert into [Order](C_id, total, phone, address, status, date) output inserted.or_id values (?,?,?,?,?,?)");
        stmt.setInt(1, c_id);
        stmt.setInt(2, total);
        stmt.setString(3, phone);
        stmt.setString(4, address);
        stmt.setInt(5, 0);
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        stmt.setString(6, String.valueOf(date));

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            or_id = rs.getInt(1);
            setOr_id(or_id);
        }

        for (Pro_Order x : al) {
            System.out.println(x.getP_id() + "\t" + x.getPrice());
            x.addProLine(or_id);
            x.reduceStock(x.getQuantity());
        }
    }

    public ArrayList<Order> getOrId(int c_id) throws ClassNotFoundException, SQLException {
        ArrayList<Order> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where C_id = ? and status = 3");
        stmt.setInt(1, c_id);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            or_id = rs.getInt("Or_id");
            total = rs.getInt("total");
            phone = rs.getString("phone");
            address = rs.getString("address");
            status = rs.getInt("status");
            day = rs.getDate("date");
            al.add(new Order(or_id, c_id, total, phone, address, status, day));
        }
        return al;
    }
    
    public ArrayList<Order> getStt(int status) throws SQLException {
        ArrayList<Order> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where status = ?");
        stmt.setInt(1, status);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()) {
            or_id = rs.getInt("Or_id");
            c_id = rs.getInt("C_id");
            total = rs.getInt("total");
            phone = rs.getString("phone");
            address = rs.getString("address");
            day = rs.getDate("date");
            al.add(new Order(or_id, c_id, total, phone, address, status, day));
        }
        return al;
    }
    
    public ArrayList<Order> getOr_Id(int or_id) throws SQLException {
        ArrayList<Order> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where Or_id = ?");
        stmt.setInt(1, or_id);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()) {
            or_id = rs.getInt("Or_id");
            c_id = rs.getInt("C_id");
            total = rs.getInt("total");
            phone = rs.getString("phone");
            address = rs.getString("address");
            status = rs.getInt("status");
            day = rs.getDate("date");
            al.add(new Order(or_id, c_id, total, phone, address, status, day));
        }
        return al;
    }
    
    public void confirm(int or_id, int staff, int status) {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Update [Order] set status = ?, Staff = ? where Or_id = ?");            
            stmt.setInt(3, or_id);
            stmt.setInt(1, status);
            stmt.setInt(2, staff);
            
            stmt.execute();
        } catch(Exception e) {
            System.out.println("ERROR : confirmFunction " + e);
        }
    }

    public static HashMap<Integer, Order> checkOrder (int C_id){
        HashMap<Integer, Order> danhsach = new HashMap<Integer, Order>();
        Order or = null;
        try(Connection con = ConnectSQL.getConnection()) {
            PreparedStatement st = con.prepareStatement("Select * from [Order] where C_id = ? and status = 1");
            st.setInt(1, C_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()){             
               or = new Order(rs.getInt("Or_id"),C_id, rs.getInt("total") , rs.getString("phone"), 
                        rs.getString("address"), rs.getInt("status"), rs.getDate("date"));
                danhsach.put(rs.getInt("Or_id"), or);          
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return danhsach;      
    }
//    
//    public static boolean seenNotification(int C_id){
//        String query = "update [Order] set status = 0 where C_id = ?";
//        try (Connection con = ConnectSQL.getConnection()){
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setInt(1, C_id);
//            int result = ps.executeUpdate();
//            if(result > 0){
//                return true;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    
    public int getOrder(String x){
        try {
            int m = 0;
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from [Order] where date = ? and status = 4");
            stmt.setString(1, x);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                m += rs.getInt("total");
            }
            return m;
        } catch (SQLException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public Order getPay(int or_id) throws ClassNotFoundException, SQLException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where Or_id = ? and status = 3");
        stmt.setInt(1, or_id);
        ResultSet rs = stmt.executeQuery();
        Order p = null;
        if (rs.next()) {
            total = rs.getInt("total");
            day = rs.getDate("date");
            p = new Order(or_id, c_id, total, phone, address);
        }
        return p;
    }
    
    public ArrayList<Order> getSttStaff(int status, int C_id) throws SQLException {
        ArrayList<Order> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where status = ? and Staff = ?");
        stmt.setInt(1, status);
        stmt.setInt(2, C_id);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()) {
            or_id = rs.getInt("Or_id");
            c_id = rs.getInt("C_id");
            total = rs.getInt("total");
            phone = rs.getString("phone");
            address = rs.getString("address");
            day = rs.getDate("date");
            al.add(new Order(or_id, c_id, total, phone, address, status, day));
        }
        return al;
    }
    
    public ArrayList<Order> getSttAdmin(int status) throws SQLException {
        ArrayList<Order> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where status = ?");
        stmt.setInt(1, status);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            or_id = rs.getInt("Or_id");
            c_id = rs.getInt("C_id");
            total = rs.getInt("total");
            phone = rs.getString("phone");
            address = rs.getString("address");
            day = rs.getDate("date");
            staff = rs.getInt("Staff");
            al.add(new Order(or_id, c_id, total, phone, address, status, day, staff));
        }
        return al;
    }
    public ArrayList<Order> getSttAdminDone() throws SQLException {
        ArrayList<Order> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where status in (3,4)");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            status = rs.getInt("status");
            or_id = rs.getInt("Or_id");
            c_id = rs.getInt("C_id");
            total = rs.getInt("total");
            phone = rs.getString("phone");
            address = rs.getString("address");
            day = rs.getDate("date");
            staff = rs.getInt("Staff");
            al.add(new Order(or_id, c_id, total, phone, address, status, day, staff));
        }
        return al;
    }
        
//    
//    public void done(int or_id, int staff) {
//        try {
//            Connection con = ConnectSQL.getConnection();
//            PreparedStatement stmt = con.prepareStatement("Update [Order] set status = 2, Staff = ? where Or_id = ?");            
//            stmt.setInt(2, or_id);
//            stmt.setInt(1, staff);
//            
//            stmt.executeQuery();
//        } catch(Exception e) {
//            System.out.println("ERROR : confirmFunction " + e);
//        }
//    }
    
//    public Order getUrOrdere(int C_id) throws ClassNotFoundException, SQLException {
//        Connection con = ConnectSQL.getConnection();
//        PreparedStatement stmt = con.prepareStatement("Select * from [Order] where C_id = 7 and status != 4");
//        stmt.setInt(1, C_id);
//        ResultSet rs = stmt.executeQuery();
//        Order p = null;
//        if (rs.next()) {
//            total = rs.getInt("total");
//            day = rs.getDate("date");
//            status = rs.getInt("status");
//            p = new Order(or_id, C_id, total, phone, address, status, day);
//        }
//        return p;
//    }
    
    public int getIncome(String x) throws ParseException{
        try {
            int m = 0;
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from [Order] where date = ? and status = 3");
            stmt.setString(1, x);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                m += rs.getInt("total");
            }
            return m;
        } catch (SQLException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    
    public ArrayList<Order> getUrOrder(int C_id, int x) {
        ArrayList<Order> al = new ArrayList<>();
        try {            
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from [Order] where C_id = ? and status = ? order by Date DESC");
            stmt.setInt(1, C_id);
            stmt.setInt(2, x);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                or_id = rs.getInt("Or_id");
                total = rs.getInt("total");
                phone = rs.getString("phone");
                address = rs.getString("address");
                day = rs.getDate("date");
                al.add(new Order(or_id, C_id, total, phone, address, x, day));
            }
        } catch (Exception e){
            System.out.println("ERROR : GetUrOrder " + e);
        }
        return al;
    }
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {
        Order or = new Order();
        System.out.println(or.getIncome("2019-11-06"));
//        System.out.println(or.getOrId(1));
//        System.out.println(or.getStt(0));
    }
    
    //0 là đã đặt đơn thành công
    //1 là bên manager hoặc admin đã accept đơn hàng
    //2 là đã hoàn thành bánh và đang giao
    //3 là giao hàng thành công
    //4 là bị boom hàng cmnr

}
