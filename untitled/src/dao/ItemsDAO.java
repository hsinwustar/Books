package dao;

		import java.sql.Connection;
		import java.sql.PreparedStatement;
		import java.sql.ResultSet;
		import java.util.ArrayList;

		import util.DBHelper;
		import entity.Items;

//商品的业务逻辑类
public class ItemsDAO{

	// 获得所有的商品信息
	public ArrayList<Items> getAllItems() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>(); /// 商品集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setAuthor(rs.getString("author"));
				item.setAuthor2(rs.getString("author2"));
				item.setISBN(rs.getString("ISBN"));
				item.setLeibie(rs.getString("leibie"));
				item.setZishu(rs.getString("zishu"));
				item.setGongying(rs.getString("gongying"));
				item.setPress(rs.getString("press"));
				item.setSynopsis(rs.getString("synopsis"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));
				item.setBacpicture(rs.getString("bacpicture"));
				item.setIntroduction1(rs.getString("introduction1"));
				item.setIntroduction2(rs.getString("introduction2"));
				item.setIntroduction3(rs.getString("introduction3"));
				list.add(item);// 把一个商品加入集合
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
	public Items getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items where id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setAuthor(rs.getString("author"));
				item.setAuthor2(rs.getString("author2"));
				item.setISBN(rs.getString("ISBN"));
				item.setLeibie(rs.getString("leibie"));
				item.setZishu(rs.getString("zishu"));
				item.setGongying(rs.getString("gongying"));
				item.setPress(rs.getString("press"));
				item.setSynopsis(rs.getString("synopsis"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));
				item.setBacpicture(rs.getString("bacpicture"));
				item.setIntroduction1(rs.getString("introduction1"));
				item.setIntroduction2(rs.getString("introduction2"));
				item.setIntroduction3(rs.getString("introduction3"));
				return item;
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
	//获取最近浏览的前10条商品信息
	public ArrayList<Items> getViewList(String list)
	{
		System.out.println("list:"+list);
		ArrayList<Items> itemlist = new ArrayList<Items>();
		int iCount=10; //每次返回前10条记录
		if(list!=null&&list.length()>0)
		{
			String[] arr = list.split("#");
			System.out.println("arr.length="+arr.length);
			//如果商品记录大于等于10条
			if(arr.length>=10)
			{
				for(int i=arr.length-1;i>=arr.length-iCount;i--)
				{
					itemlist.add(getItemsById(Integer.parseInt(arr[i])));
				}
			}
			else
			{
				for(int i=arr.length-1;i>=0;i--)
				{
					itemlist.add(getItemsById(Integer.parseInt(arr[i])));
				}
			}
			return itemlist;
		}
		else
		{
			return null;
		}

	}


}
