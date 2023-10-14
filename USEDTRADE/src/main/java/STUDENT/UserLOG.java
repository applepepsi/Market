package STUDENT;



import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserLOG {

	//로그인할때 사용됩니다

	

	public int login(String ID, String password) 
	{

		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수입니다.
        int x = -1;
 
        try {
           //먼저 입력된 아이디로 DB에서 비밀번호를 조회합니다.
            StringBuffer query = new StringBuffer();
            query.append("SELECT password FROM STUDENT WHERE ID=?");
 
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, ID);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우에
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣습니다
 
                if (dbPW.equals(password)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else
                	x=0;// DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
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