package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;
import entity.Content;

//商品的业务逻辑类
public class ContentDAO{

     //获得所有的商品信息
    public ArrayList<Content> getAllContent() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Content> list1 = new ArrayList<Content>(); /// 商品集合
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from content;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Content ct = new Content();
                ct.setCtid(rs.getInt("ctid"));
                ct.setName(rs.getString("name"));
                ct.setAuthor(rs.getString("author"));
                ct.setPress(rs.getString("press"));
                ct.setPrice(rs.getInt("price"));
                ct.setPicture(rs.getString("picture"));
                ct.setBacpicture(rs.getString("bacpicture"));
                ct.setIntroduction1(rs.getString("introduction1"));
                ct.setIntroduction2(rs.getString("introduction2"));
                ct.setIntroduction3(rs.getString("introduction3"));
                ct.setTitle1(rs.getString("title1"));
                ct.setTitle2(rs.getString("title2"));
                ct.setP1(rs.getString("p1"));
                ct.setP2(rs.getString("p2"));
                ct.setP3(rs.getString("p3"));
                ct.setP4(rs.getString("p4"));
                ct.setP5(rs.getString("p5"));
                ct.setP6(rs.getString("p6"));
                ct.setP7(rs.getString("p7"));
                ct.setPp1(rs.getString("pp1"));
                ct.setPp2(rs.getString("pp2"));
                ct.setPp3(rs.getString("pp3"));
                ct.setPp4(rs.getString("pp4"));
                ct.setPp5(rs.getString("pp5"));
                ct.setPp6(rs.getString("pp6"));
                ct.setPp7(rs.getString("pp7"));
                ct.setImg1(rs.getString("img1"));
                ct.setImg2(rs.getString("img2"));
                ct.setImg3(rs.getString("img3"));
                ct.setImg4(rs.getString("img4"));
                ct.setImg5(rs.getString("img5"));
                ct.setImg6(rs.getString("img6"));
                ct.setImg7(rs.getString("img7"));
                list1.add(ct);// 把一个商品加入集合
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
    public Content getContentById(int ctid) {
        Connection conn = null;
        PreparedStatement stmt1 = null;
        ResultSet rs1 = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from content where ctid=?;"; // SQL语句
            stmt1 = conn.prepareStatement(sql);
            stmt1.setInt(1,ctid);
            rs1 = stmt1.executeQuery();
            if (rs1.next()) {
                Content ct = new Content();
                ct.setCtid(rs1.getInt("ctid"));
                ct.setName(rs1.getString("name"));
                ct.setAuthor(rs1.getString("author"));
                ct.setPress(rs1.getString("press"));
                ct.setPrice(rs1.getInt("price"));
                ct.setPicture(rs1.getString("picture"));
                ct.setBacpicture(rs1.getString("bacpicture"));
                ct.setIntroduction1(rs1.getString("introduction1"));
                ct.setIntroduction2(rs1.getString("introduction2"));
                ct.setIntroduction3(rs1.getString("introduction3"));
                ct.setTitle1(rs1.getString("title1"));
                ct.setTitle2(rs1.getString("title2"));
                ct.setP1(rs1.getString("p1"));
                ct.setP2(rs1.getString("p2"));
                ct.setP3(rs1.getString("p3"));
                ct.setP4(rs1.getString("p4"));
                ct.setP5(rs1.getString("p5"));
                ct.setP6(rs1.getString("p6"));
                ct.setP7(rs1.getString("p7"));
                ct.setPp1(rs1.getString("pp1"));
                ct.setPp2(rs1.getString("pp2"));
                ct.setPp3(rs1.getString("pp3"));
                ct.setPp4(rs1.getString("pp4"));
                ct.setPp5(rs1.getString("pp5"));
                ct.setPp6(rs1.getString("pp6"));
                ct.setPp7(rs1.getString("pp7"));
                ct.setImg1(rs1.getString("img1"));
                ct.setImg2(rs1.getString("img2"));
                ct.setImg3(rs1.getString("img3"));
                ct.setImg4(rs1.getString("img4"));
                ct.setImg5(rs1.getString("img5"));
                ct.setImg6(rs1.getString("img6"));
                ct.setImg7(rs1.getString("img7"));
                return ct;
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