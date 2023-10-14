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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JSP 게시판 웹 사이트</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
//물물교환에서 상대방의 물건과 교환할 나의 물건을 보여줍니다.
request.setCharacterEncoding("UTF-8");

Connection con = DatabaseUtil.getConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;
int ProductNum=0;
String catecode=null;
String catename=null;
String productname=null;
int sellerprice=0;
int buyerprice=0;
String sellerID=null;
String buyerID=null;

if(request.getParameter("sellerID") != null){
	sellerID = (String) request.getParameter("sellerID");
}

	buyerID = (String) session.getAttribute("ID");

if(request.getParameter("sellerprice") != null){
	sellerprice = Integer.parseInt(request.getParameter("sellerprice"));
}
if (request.getParameter("ProductNum") != null) {
	ProductNum = Integer.parseInt(request.getParameter("ProductNum"));
}


System.out.println(sellerID);
System.out.println(buyerID);
System.out.println(sellerprice);
System.out.println(buyerID);
System.out.println(ProductNum);

try {
 con = DatabaseUtil.getConnection();
	 String SQL="Select ProductNum,productname,price,catecode,id from productlist where price =? and ID=?";
	 pstmt = con.prepareStatement(SQL);
     
    
     pstmt.setInt(1,sellerprice);
     pstmt.setString(2,buyerID);
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
    	 
			int ProductNum2=rs.getInt("ProductNum");
			productname=rs.getString("ProductName");
			buyerprice=rs.getInt("Price");
			catecode=rs.getString("catecode");
			buyerID=rs.getString("ID");
			
		%>

			
			</tr>
			
				<td align="center"><%=ProductNum%></td>
				<td align="center"><%=productname%></td>
				<td align="center"><%=buyerprice%></td>
				<td align="center"><%=catecode%></td>
				<td align="center"><%=buyerID%></td>
				
				<td>
				<form action="barter2.jsp" method="post">
				<input type="hidden" name="ProductNum" value="<%=ProductNum%>" >
				<input type="hidden" name="ProductNum2" value="<%=ProductNum2%>" >
				<input type="hidden" name="sellerID" value="<%=sellerID%>" >
				<input type="hidden" name="ProductName" value="<%=productname%>" >
				<input type="hidden" name="buyerprice" value="<%=buyerprice%>" >
				<input type="hidden" name="sellerprice" value="<%=sellerprice%>" >
				<input type="hidden" name="productname" value="<%=productname%>" >
				<input type="hidden" name="catecode" value="<%=catecode%>" >
				<input type="hidden" name="buyerID" value="<%=buyerID%>" >
				<input type="submit" style='float: right;' value="교환">
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
			
			
			 <button onclick="location='index.jsp'">홈으로 돌아가기</button>
			 
         	
  			</form>
 	</select>
		</div>
	</div>
	
	
</body>
</html>