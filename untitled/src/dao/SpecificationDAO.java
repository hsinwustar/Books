package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;
import entity.Specification;

public class SpecificationDAO {

    // 根据商品编号获得商品资料
    public Specification getSpecificationById(int ctid) {
        Connection conn = null;
        PreparedStatement stmt1 = null;
        ResultSet rs1 = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from specification where ctid=?;"; // SQL语句
            stmt1 = conn.prepareStatement(sql);
            stmt1.setInt(1,ctid);
            rs1 = stmt1.executeQuery();
            if (rs1.next()) {
                Specification sp = new Specification();
                sp.setCtid(rs1.getInt("ctid"));
                sp.setName(rs1.getString("name"));
                sp.setTitle(rs1.getString("title"));
                sp.setAuthor(rs1.getString("author"));
                sp.setAuthor2(rs1.getString("author2"));
                sp.setWriter(rs1.getString("writer"));
                sp.setPress(rs1.getString("press"));
                sp.setPresstime(rs1.getString("presstime"));
                sp.setPrice(rs1.getString("price"));
                sp.setHardcover(rs1.getString("hardcover"));
                sp.setISBN(rs1.getString("ISBN"));
                return sp;
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
