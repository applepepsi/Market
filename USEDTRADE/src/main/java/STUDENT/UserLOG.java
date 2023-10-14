package STUDENT;



import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserLOG {

	//�α����Ҷ� ���˴ϴ�

	

	public int login(String ID, String password) 
	{

		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db���� ���� ��й�ȣ�� ���� �����Դϴ�.
        int x = -1;
 
        try {
           //���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�մϴ�.
            StringBuffer query = new StringBuffer();
            query.append("SELECT password FROM STUDENT WHERE ID=?");
 
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, ID);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� ������쿡
            {
                dbPW = rs.getString("password"); // ����� ������ �ֽ��ϴ�
 
                if (dbPW.equals(password)) 
                    x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
                else
                	x=0;// DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
                
            } else {
                x = -1; // �ش� ���̵� ���� ���
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }

		
		}

	}