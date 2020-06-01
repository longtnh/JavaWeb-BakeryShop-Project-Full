package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectSQL {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("net.sourceforge.jtds.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:jtds:sqlserver://DESKTOP-R4FUMQC/BakeryShop", "long1234", "long1234");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
