package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;
import entity.Longreview;

public class LongreviewDAO {

    //获得所有的商品信息
    public ArrayList<Longreview> getAllLongreview() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Longreview> list1 = new ArrayList<Longreview>(); /// 商品集合
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from longreview;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Longreview lrv = new Longreview();
//                rv.setReid(rs.getInt("reid"));
                lrv.setLrvid(rs.getInt("lrvid"));
                lrv.setUserid(rs.getString("userid"));
                lrv.setIcon(rs.getString("icon"));
                lrv.setTime(rs.getString("time"));
                lrv.setTitle(rs.getString("title"));
                lrv.setContent(rs.getString("content"));
                lrv.setContent1(rs.getString("content1"));
                lrv.setPicture(rs.getString("picture"));
                list1.add(lrv);// 把一个商品加入集合
            }
            return list1; // 返回集合。
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
