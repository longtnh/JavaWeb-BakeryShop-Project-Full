/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Customer {

    private int C_id;
    private String C_username;
    private String C_password;
    private String C_name;
    private String address;
    private int age;
    private String email;
    private String phone;
    private String gender;
    private int role, status, boom;

    public Customer() {
    }

    public Customer(int C_id, String C_username, String C_password, String C_name, String address, int age, String email, String phone, String gender) {
        this.C_id = C_id;
        this.C_username = C_username;
        this.C_password = C_password;
        this.C_name = C_name;
        this.address = address;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
    }

    public Customer(String C_username, String C_password, String C_name, String address, int age, String email, String phone, String gender) {
        this.C_username = C_username;
        this.C_password = C_password;
        this.C_name = C_name;
        this.address = address;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
    }

    public Customer(int C_id, String C_username, String C_password, String C_name, String address, int age, String email, String phone, String gender, int role, int status) {
        this.C_id = C_id;
        this.C_username = C_username;
        this.C_password = C_password;
        this.C_name = C_name;
        this.address = address;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.role = role;
        this.status = status;
    }

    public Customer(String C_username, String C_password, String C_name, String address, int age, String email, String phone, String gender, int status) {
        this.C_username = C_username;
        this.C_password = C_password;
        this.C_name = C_name;
        this.address = address;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public int getBoom() {
        return boom;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setBoom(int boom) {
        this.boom = boom;
    }

    public int getC_id() {
        return C_id;
    }

    public String getC_username() {
        return C_username;
    }

    public String getC_password() {
        return C_password;
    }

    public String getC_name() {
        return C_name;
    }

    public String getAddress() {
        return address;
    }

    public int getAge() {
        return age;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getGender() {
        return gender;
    }

    public void setC_id(int C_id) {
        this.C_id = C_id;
    }

    public void setC_username(String C_username) {
        this.C_username = C_username;
    }

    public void setC_password(String C_password) {
        this.C_password = C_password;
    }

    public void setC_name(String C_name) {
        this.C_name = C_name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Customer{" + "C_id=" + C_id + ", C_username=" + C_username + ", C_password=" + C_password + ", C_name=" + C_name + ", address=" + address + ", age=" + age + ", email=" + email + ", phone=" + phone + ", gender=" + gender + '}';
    }

    public Customer logIn(String userName, String password) throws SQLException, ClassNotFoundException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from Customer where C_username = ? and C_password = ?");
        stmt.setString(1, userName);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        Customer x = null;
        while (rs.next()) {
            C_id = rs.getInt("C_id");
            C_password = rs.getString("C_password");
            C_username = rs.getString("C_username");
            C_name = rs.getString("C_name");
            address = rs.getString("address");
            age = rs.getInt("age");
            email = rs.getString("email");
            phone = rs.getString("phone");
            gender = rs.getString("gender");
            role = rs.getInt("role");
            status = rs.getInt("status");
            x = new Customer(C_id, C_username, C_password, C_name, address, age, email, phone, gender, role, status);
        }
        return x;
    }

    public void signUp() throws SQLException {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("insert into Customer(C_username,C_password,C_name,address,age,email,phone,gender,role,status,boom) output inserted.c_id values(?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, C_username);
            stmt.setString(2, C_password);
            stmt.setString(3, C_name);
            stmt.setString(4, address);
            stmt.setInt(5, age);
            stmt.setString(6, email);
            stmt.setString(7, phone);
            stmt.setString(8, gender);
            stmt.setInt(9, 2);
            stmt.setInt(10, 0);
            stmt.setInt(11, 0);
            stmt.executeUpdate();

    }

    public void update() {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Update Customer set C_password=?,C_name=?,address=?,age=?,email=?,phone=?,gender=? where C_username=?");

            stmt.setString(8, C_username);
            stmt.setString(1, C_password);
            stmt.setString(2, C_name);
            stmt.setString(3, address);
            stmt.setInt(4, age);
            stmt.setString(5, email);
            stmt.setString(6, phone);
            stmt.setString(7, gender);

            stmt.executeUpdate();
        } catch (Exception e) {

        }

    }

    public Customer getCus(String username) {
        Customer x = null;
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from Customer where C_username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                C_id = rs.getInt("C_id");
                C_password = rs.getString("C_password");
                C_username = rs.getString("C_username");
                C_name = rs.getString("C_name");
                address = rs.getString("address");
                age = rs.getInt("age");
                email = rs.getString("email");
                phone = rs.getString("phone");
                gender = rs.getString("gender");
                x = new Customer(C_id, C_username, C_password, C_name, address, age, email, phone, gender);
            }
        }
        catch(Exception e) {
            
        } 
        return x;
    }

    public ArrayList<Customer> getCusId(int id) throws SQLException {
        ArrayList<Customer> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from Customer where C_id = ?");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            C_id = rs.getInt("C_id");
            C_password = rs.getString("C_password");
            C_username = rs.getString("C_username");
            C_name = rs.getString("C_name");
            address = rs.getString("address");
            age = rs.getInt("age");
            email = rs.getString("email");
            phone = rs.getString("phone");
            gender = rs.getString("gender");
            boom = rs.getInt("boom");
            status = rs.getInt("status");
            al.add(new Customer(C_id, C_username, C_password, C_name, address, age, email, phone, gender, role, status));
        }
        return al;
    }

    public String checkUser() {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from Customer where C_username = ?");
            stmt.setString(1, C_username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return "username";
            }

            stmt = con.prepareStatement("Select * from Customer where email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return "email";
            }

            stmt = con.prepareStatement("Select * from Customer where phone = ?");
            stmt.setString(1, phone);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return "phone";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "true";
    }

//    public String checkSignUp(Customer c) {
//        try {
//            if (c.checkUser().equals("true")) {
//            Customer x = new Customer();
//            x.signUp();
//            return null;
//            }
//        }
//        catch(Exception e) {
//            e.printStackTrace();
//        }
//        return c.checkUser();
//    }

    public ArrayList<Customer> getAllCus() throws ClassNotFoundException, SQLException {
        ArrayList<Customer> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM Customer where status = 0 ORDER BY C_username ASC");
        ResultSet rs = stmt.executeQuery();
        Customer x = null;
        while (rs.next()) {
            C_id = rs.getInt("C_id");
            C_password = rs.getString("C_password");
            C_username = rs.getString("C_username");
            C_name = rs.getString("C_name");
            address = rs.getString("address");
            age = rs.getInt("age");
            email = rs.getString("email");
            phone = rs.getString("phone");
            gender = rs.getString("gender");
            al.add(new Customer(C_id, C_username, C_password, C_name, address, age, email, phone, gender));
        }
        return al;
    }

    public ArrayList<Customer> searchCus(String tt) {
        ArrayList<Customer> al = new ArrayList<>();
        String[] text = tt.split("\\s+");
        for (String t : text) {
            try {
                Connection con = ConnectSQL.getConnection();
                Customer x = null;
                PreparedStatement stmt = con.prepareStatement("Select * from Customer where status = 0 and C_name LIKE N'%" + t + "%'");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    C_username = rs.getString("C_username");
                    C_id = rs.getInt("C_id");
                    C_password = rs.getString("C_password");
                    C_name = rs.getString("C_name");
                    address = rs.getString("address");
                    age = rs.getInt("age");
                    email = rs.getString("email");
                    gender = rs.getString("gender");
                    phone = rs.getString("phone");
                    al.add(new Customer(C_id, C_username, C_password, C_name, address, age, email, phone, gender));
                }

                stmt = con.prepareStatement("Select * from Customer where status = 0 and C_username LIKE N'%" + t + "%'");
                rs = stmt.executeQuery();
                boolean z = false;
                while (rs.next()) {
                    C_username = rs.getString("C_username");
                    for (Customer m : al) {
                        if (m.getC_username().equals(C_username)) {
                            z = true;
                        }
                    }
                    if (z == false) {
                        C_password = rs.getString("C_password");
                        C_name = rs.getString("C_name");
                        address = rs.getString("address");
                        age = rs.getInt("age");
                        email = rs.getString("email");
                        gender = rs.getString("gender");
                        phone = rs.getString("phone");
                        al.add(new Customer(C_id, C_username, C_password, C_name, address, age, email, phone, gender));
                    }
                }

            } catch (Exception e) {
                System.out.println("Loi searchCus : " + e);
            }
        }
        return al;
    }

    public void boom(int cid, int status, int boom) {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Update Customer set boom = ?, status = ? where C_id = ?");
            stmt.setInt(1, boom);
            stmt.setInt(2, status);
            stmt.setInt(3, cid);
            
            stmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ERROR : BOOM - " + ex);
        }
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Customer c = new Customer();
        c.getCusId(9);
        System.out.println(c.getBoom());
    }
}
