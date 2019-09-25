package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;
import entity.Review;

public class ReviewDAO {
    //获得所有的商品信息
    public ArrayList<Review> getAllReview() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Review> list1 = new ArrayList<Review>(); /// 商品集合
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from review;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Review rv = new Review();
//                rv.setReid(rs.getInt("reid"));
                rv.setUserid(rs.getString("userid"));
                rv.setIcon(rs.getString("icon"));
                rv.setViews(rs.getString("views"));
                rv.setCtid(rs.getInt("ctid"));
                list1.add(rv);// 把一个商品加入集合
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



    // 根据商品编号获得商品资料
    public Review getReviewById(int ctid) {
        Connection conn = null;
        PreparedStatement stmt1 = null;
        ResultSet rs1 = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from review where ctid=?;"; // SQL语句
            stmt1 = conn.prepareStatement(sql);
            stmt1.setInt(1,ctid);
            rs1 = stmt1.executeQuery();
            if (rs1.next()) {
                Review rv = new Review();
//                rv.setReid(rs1.getInt("reid"));
                rv.setUserid(rs1.getString("userid"));
                rv.setIcon(rs1.getString("icon"));
                rv.setViews(rs1.getString("views"));
                rv.setCtid(rs1.getInt("ctid"));
                return rv;
            } else {
                return null;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            // 释放数据集对象
            if (rs1 != null) {
                try {
                    rs1.close();
                    rs1 = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            // 释放语句对象
            if (stmt1 != null) {
                try {
                    stmt1.close();
                    stmt1 = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        }
    }
}
