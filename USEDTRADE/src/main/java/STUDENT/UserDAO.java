package STUDENT;



import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {

	//DAO 는 database access object로서 실제로 DB에 접근할때 사용되는 객체이다.

	

	public int join(String ID, String PassWord,String Department,
			String PhoneNumber,String StudentName,String Grade) 
	{
		//회원가입할때 사용합니다

		String SQL = "INSERT INTO STUDENT VALUES (?,?,?,?,?,?)";

		try {

			System.out.println("getConnection호출.");

			Connection conn = DatabaseUtil.getConnection();

			System.out.println("getConnection끝.");

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
		System.out.println("getConnection호출.");
		Connection conn = DatabaseUtil.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		System.out.println("getConnection끝.");
		ResultSet rs = null;

		

		pstmt.setString(1, ID);

		rs = pstmt.executeQuery();

	

		// 중복된 아이디가 있으면 1로 반환

		if (rs.next()) {

			return 1;

		} else { // 아이디 없으면 0 반환

			return 0;

		}

	} catch (Exception e) {

		e.printStackTrace();

	}

	// 오류 발생 시 -1 반환

	return -1;

}

}