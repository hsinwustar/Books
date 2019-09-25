package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;
import entity.User;

public class UserDAO {

    // 获得所有的商品信息
    public ArrayList<User> getAllUsers() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<User> list = new ArrayList<User>(); /// 商品集合
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from user;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUid(rs.getInt("uid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                list.add(user);// 把一个商品加入集合
            }
            return list; // 返回集合。
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            // 释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            // 释放语句对象
            if (stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }

    }

    // 根据商品编号获得商品资料
    public User getUserById(String username) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from user where username=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "uesrname");
            rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUid(rs.getInt("uid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            } else {
                return null;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            // 释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            // 释放语句对象
            if (stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        }
    }

}
