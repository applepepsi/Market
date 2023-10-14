package PRODUCTLIST;



import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DatabaseUtil;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DatabaseUtil ;

public class ProductDAO<PRODUCTLIST> {

	//DAO 는 database access object로서 실제로 DB에 접근할때 사용되는 객체이다.

	

	public int productenrollment(int ProductNum,String ProductName,
			int price,String catecode,String productstate,String content,String ID,String PhoneNumber) 
	{
		//상품을 등록할때 사용합니다

		String SQL = "INSERT INTO PRODUCTLIST VALUES (?,?,?,?,?,?,?,?)";

		try {

			System.out.println("getConnection호출.");

			Connection conn = DatabaseUtil.getConnection();

			System.out.println("getConnection끝.");

			PreparedStatement pstmt = conn.prepareStatement(SQL);

		
			pstmt.setInt(1, ProductNum);
			pstmt.setString(2, ProductName);
			pstmt.setInt(3, price);
			pstmt.setString(4, catecode);
			pstmt.setString(5, productstate);
			pstmt.setString(6, content);
			pstmt.setString(7, ID);
			pstmt.setString(8, PhoneNumber);
			return pstmt.executeUpdate();

		
		} 
		
		catch (Exception e) {

			// TODO: handle exception

			e.printStackTrace();

		}

		return -1;

	}
	public int update(int ProductNum,String ProductName,
			int price,String catecode,String productstate,String content,String ID,String PhoneNumber)
	{
		String SQL="update productlist set ProductNum=?,Productname=?,price=?,catecode=?,productstate=?,content=?,ID=?,PhoneNumber=? where ProductNum=?";
		
		try {
			System.out.println("getConnection호출.");

			Connection conn = DatabaseUtil.getConnection();

			
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, ProductNum);
			pstmt.setString(2, ProductName);
			pstmt.setInt(3, price);
			pstmt.setString(4, catecode);
			pstmt.setString(5, productstate);
			pstmt.setString(6, content);
			pstmt.setString(7, ID);
			pstmt.setString(8, PhoneNumber);
			pstmt.setInt(9, ProductNum);
			return pstmt.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int ProductNum)
	{
		String SQL="delete from productlist where ProductNum=?";
		
		try {
			System.out.println("getConnection호출.");

			Connection conn = DatabaseUtil.getConnection();

			
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, ProductNum);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public int serch(int ProductNum,String ProductName,
			int price,String catecode,String productstate,String PhoneNumber,String ID)
	{
		String SQL="select productnum,productname,price,catecode,productlist,id from productlist where catecode=?";
		
		try {
			System.out.println("getConnection호출.");

			Connection conn = DatabaseUtil.getConnection();

			
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, ProductNum);
			pstmt.setString(2, ProductName);
			pstmt.setInt(3, price);
			pstmt.setString(4, catecode);
			pstmt.setString(5, productstate);
			pstmt.setString(6, ID);
			pstmt.setString(7, PhoneNumber);
			pstmt.setString(8, catecode);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
}