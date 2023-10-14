package STUDENT;



import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {

	//DAO �� database access object�μ� ������ DB�� �����Ҷ� ���Ǵ� ��ü�̴�.

	

	public int join(String ID, String PassWord,String Department,
			String PhoneNumber,String StudentName,String Grade) 
	{
		//ȸ�������Ҷ� ����մϴ�

		String SQL = "INSERT INTO STUDENT VALUES (?,?,?,?,?,?)";

		try {

			System.out.println("getConnectionȣ��.");

			Connection conn = DatabaseUtil.getConnection();

			System.out.println("getConnection��.");

			PreparedStatement pstmt = conn.prepareStatement(SQL);

		
			pstmt.setString(1, ID);
			pstmt.setString(2, PassWord);
			pstmt.setString(3, Department);
			pstmt.setString(4, PhoneNumber);
			pstmt.setString(5, StudentName);
			pstmt.setString(6, Grade);
			

			return pstmt.executeUpdate();

		
		} 
		
		catch (Exception e) {

		

			e.printStackTrace();

		}

		return -1;

	}

public int IDCheck(String ID) {

	String SQL = "SELECT * FROM STUDENT WHERE ID = ?";

	try {
		System.out.println("getConnectionȣ��.");
		Connection conn = DatabaseUtil.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		System.out.println("getConnection��.");
		ResultSet rs = null;

		

		pstmt.setString(1, ID);

		rs = pstmt.executeQuery();

	

		// �ߺ��� ���̵� ������ 1�� ��ȯ

		if (rs.next()) {

			return 1;

		} else { // ���̵� ������ 0 ��ȯ

			return 0;

		}

	} catch (Exception e) {

		e.printStackTrace();

	}

	// ���� �߻� �� -1 ��ȯ

	return -1;

}

}