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

public class Feedback {

    public int id;
    public String firstName;
    public String lastName;
    public String email;
    public String feedback;
    public String star;

    public Feedback() {

    }

    public Feedback(String firstName, String lastName, String email, String feedback, String star) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.feedback = feedback;
        this.star = star;
    }

    public Feedback(int id, String firstName, String lastName, String email, String feedback, String star) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.feedback = feedback;
        this.star = star;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getStar() {
        return star;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFeedback() {
        return feedback;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public void setStar(String star) {
        this.star = star;
    }

    @Override
    public String toString() {
        return "Feedback{" + "firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", feedback=" + feedback + ", star=" + star + '}';
    }

    public void addFeedback() {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Insert into Feedback values (?,?,?,?,?,0)");

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, feedback);
            stmt.setString(5, star);

            stmt.executeQuery();
            con.close();
        } catch (Exception e) {
        }
    }

//    public void addFeedbackCheck() {
//        try {
//            Connection con = ConnectSQL.getConnection();
//            PreparedStatement stmt = con.prepareStatement("Insert into FeedbackCheck values (?,?,?,?,?)");
//
//            stmt.setString(1, firstName);
//            stmt.setString(2, lastName);
//            stmt.setString(3, email);
//            stmt.setString(4, feedback);
//            stmt.setString(5, star);
//
//            stmt.executeQuery();
//            con.close();
//        } catch (Exception e) {
//        }
//    }
    public void confirmFeedback(int id) throws SQLException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Update Feedback set status = 1 where F_id = ?");
        stmt.setInt(1, id);
        stmt.executeQuery();
    }
    
    public ArrayList<Feedback> getFeed() throws ClassNotFoundException, SQLException {
        ArrayList<Feedback> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from Feedback where status = 0");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            id = rs.getInt("F_id");
            firstName = rs.getString("first_name");
            lastName = rs.getString("last_name");
            email = rs.getString("email");
            feedback = rs.getString("feedback");
            star = rs.getString("star");
            al.add(new Feedback(id, firstName, lastName, email, feedback, star));
        }
        return al;
    }

    public ArrayList<Feedback> getFeedCheck() throws ClassNotFoundException, SQLException {
        ArrayList<Feedback> al = new ArrayList<>();
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from Feedback where status = 1");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            id = rs.getInt("F_id");
            firstName = rs.getString("first_name");
            lastName = rs.getString("last_name");
            email = rs.getString("email");
            feedback = rs.getString("feedback");
            star = rs.getString("star");
            al.add(new Feedback(id, firstName, lastName, email, feedback, star));
        }
        return al;
    }

    public Feedback getFeedId(int id) throws ClassNotFoundException, SQLException {
        Connection con = ConnectSQL.getConnection();
        PreparedStatement stmt = con.prepareStatement("Select * from Feedback where F_id = ?");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        Feedback x = null;
        while (rs.next()) {
            id = rs.getInt("F_id");
            firstName = rs.getString("first_name");
            lastName = rs.getString("last_name");
            email = rs.getString("email");
            feedback = rs.getString("feedback");
            star = rs.getString("star");
            x = new Feedback(id, firstName, lastName, email, feedback, star);
        }
        return x;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Feedback f = new Feedback();
        ArrayList<Feedback> al = new ArrayList<>();
        al = f.getFeedCheck();
        System.out.println(al);
    }

    public void deleteFeedback(int id) {
        try {
            Connection con = ConnectSQL.getConnection();
            PreparedStatement stmt = con.prepareStatement("Delete from Feedback where F_id=?");
            stmt.setInt(1, id);
            stmt.executeQuery();

        } catch (Exception e) {

        }
    }
}
