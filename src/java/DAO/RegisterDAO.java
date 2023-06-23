/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import context.DBContext;
import java.sql.*;

/**
 *
 * @author ducnl
 */
public class RegisterDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean isEmpty(String input) {
        return input == null || input.trim().isEmpty();
    }

    public Account checkAccountExist(String email) {
        try {
            String query = "Select * from tblUser where [email] = ? ";
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                return a;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void register(String username, String password, String email) {
        HashDAO hashPass = new HashDAO(password);
        password = hashPass.getHashCode().trim();
        try {
            String query = "INSERT INTO tblUser(userName,email,pass,point,rankID) \n"
                    + "VALUES \n"
                    + "    (?, ?, ?, 0, 1);";
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
}
