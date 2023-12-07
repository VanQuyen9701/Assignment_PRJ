/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.User;
import Util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ACER
 */
public class UserDAO {

    public static User getUser(String username, String password)
            throws Exception {
        User us = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [userId], [password], [fullName], [phone], [userAddress], [roleId]\n"
                    + "FROM [dbo].[User] \n"
                    + "WHERE [userId] = ? AND PASSWORD = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String userid = rs.getString("userId");
                String pass = rs.getString("password");
                String name = rs.getString("fullName");
                String phone = rs.getString("phone");
                String userAddress = rs.getString("userAddress");
                String roleId = rs.getString("roleId");
                us = new User(userid, password, name, phone, userAddress, roleId);
            }
            pst.close();
            cn.close();
        }
        return us;
    }

    public static boolean isExist(String userId)
            throws Exception {
        boolean flag = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [userId], [password]\n"
                    + "FROM [dbo].[User]\n"
                    + "WHERE [userId] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, userId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                flag = true;
            }
            pst.close();
            cn.close();
        }
        return flag;
    }

    public static int insertUser(String userId, String password, String name)
            throws Exception {
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "INSERT INTO [dbo].[User] ([userId], [password], [fullName])\n"
                    + "VALUES (?, ?, ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, userId);
            pst.setString(2, password);
            pst.setString(3, name);
            rs = pst.executeUpdate();
            pst.close();
            cn.close();
        }
        return rs;
    }
}
