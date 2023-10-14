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

	//DAO �� database access object�μ� ������ DB�� �����Ҷ� ���Ǵ� ��ü�̴�.

	

	public int productenrollment(int ProductNum,String ProductName,
			int price,String catecode,String productstate,String content,String ID,String PhoneNumber) 
	{
		//��ǰ�� ����Ҷ� ����մϴ�

		String SQL = "INSERT INTO PRODUCTLIST VALUES (?,?,?,?,?,?,?,?)";

		try {

			System.out.println("getConnectionȣ��.");

			Connection conn = DatabaseUtil.getConnection();

			System.out.println("getConnection��.");

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
			System.out.println("getConnectionȣ��.");

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
			System.out.println("getConnectionȣ��.");

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
			System.out.println("getConnectionȣ��.");

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