<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="PRODUCTLIST.ProductDAO" %>
<%@ page import="PRODUCTLIST.ProductDTO" %> 

<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="util.DatabaseUtil" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JSP 게시판 웹 사이트</title>
</head>
<%
//품목별로 검색할수 있습니다.
request.setCharacterEncoding("UTF-8");

Connection con = DatabaseUtil.getConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;
int ProductNum=0;
String catecode=null;
String catename=null;
String productname=null;
int price=0;
String ID=null;
if(request.getParameter("catecode") != null){
	catecode = (String) request.getParameter("catecode");
}
System.out.println(catecode);
try {
 con = DatabaseUtil.getConnection();
	 String SQL="Select ProductNum,productname,price,catecode,id from productlist where catecode =?";
	 pstmt = con.prepareStatement(SQL);
     
     System.out.println(catecode);
     pstmt.setString(1,catecode);
     rs = pstmt.executeQuery();
     %>
     <table width="70%"  border="1">
     
     <th align="center" width="60">상품번호</th>
     <th align="center" width="100">상품이름</th>
     <th align="center" width="75">가격</th>
     <th align="center" width="50">상품종류</th>
     <th align="center" width="50">학번</th>
    <th align="center" width="30">선택</th>
     <% 
     while(rs.next()) {
    	 
			ProductNum=rs.getInt("ProductNum");
			productname=rs.getString("ProductName");
			price=rs.getInt("Price");
			catecode=rs.getString("catecode");
			ID=rs.getString("ID");
			
		%>

			
			</tr>
			
				<td align="center"><%=ProductNum%></td>
				<td align="center"><%=productname%></td>
				<td align="center"><%=price%></td>
				<td align="center"><%=catecode%></td>
				<td align="center"><%=ID%></td>
				
				<td>
				<button type=button style=' float: right;' title="세부" onClick="location.href='view.jsp?ProductNum=<%=ProductNum%>'">세부</button></td>
			</td>
			
			
			</tr>
		
<% 
					}
				rs.close();
				pstmt.close();
				con.close();
			} catch(SQLException e) {
				out.println( e.toString() );
			}

%>

<body>
	
	
			</table>
			<!-- 글쓰기 버튼 생성 -->
			
			 <button onclick="location='ProductRegistration.jsp'">상품등록</button>
			 <button onclick="location='index.jsp'">홈으로 돌아가기</button>
			 <form action="./serchresult.jsp" method="post">
			 <select  name="catecode" size="1">
    		<option value="음식">식품</option>
         	<option value="도서">도서</option>
         	<option value="상품권">상품권</option>
        	<option value="가구">가구</option>
         	<option value="의류">의류</option>
         	<option value="전자제품">전자제품</option>
         	<option value="미용용품">미용용품</option>
         	<input type="submit" value="검색!!" >
         	
  			</form>
 	</select>
		</div>
	</div>
	
	
</body>
</html>