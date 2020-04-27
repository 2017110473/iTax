/*
 * 功能：连接数据库，为sevlet层提供数据访问的接口
 *
 *完成情况：董嘉懿完成
 **/

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import bean.insurance;

public class InsDao {
	public static final String URL = "jdbc:mysql://localhost:3306/itax?serverTimezone=GMT";
	public static final String USER = "root";
	public static final String PASSWORD = "123456";
	
	private Connection conn;
	private Statement stmt;
	
	public InsDao() {
		try {
	          //1.加载驱动程序
	    	  Class.forName("com.mysql.jdbc.Driver");
		      //2. 获得数据库连接
		      conn = DriverManager.getConnection(URL, USER, PASSWORD);
		      //3.操作数据库，实现增删改查
		      stmt = conn.createStatement();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 功能：查询所有数据
	 * 输入：
	 * 输出：数据库中所有数据
	 * 
	 * */
	public List<insurance> queryAll() throws SQLException
	{
		String sql = "select * from social_insurance ";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		List<insurance> Insurance = new ArrayList<>();
		while(rs.next())
		{
			insurance i = new insurance(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),  rs.getString(10),  rs.getString(11), rs.getString(12),  rs.getString(13));
			Insurance.add(i);		
		}
		return Insurance;
	}
	
	/*
	 * 功能：按照城市名查询数据
	 * 输入：城市名
	 * 输出：某一城市相关数据
	 * 
	 * */
	public insurance selectByRegion(String region) throws SQLException
	{
		String sql  ="select * from social_insurance where region='" + region+"' ";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		insurance i = null;
		while(rs.next())
		{
			i = new insurance(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),  rs.getString(10),  rs.getString(11), rs.getString(12),  rs.getString(13));	
		}
		return i;
	}
	


}