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
<meta charset="EUC-KR">

</head>
<body>
<%


request.setCharacterEncoding("UTF-8");
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String buyerID=null;
int ProductNum=0;
buyerID=(String)session.getAttribute("ID");
System.out.println(buyerID);
if(request.getParameter("ProductNum") != null){
	ProductNum = Integer.parseInt(request.getParameter("ProductNum"));
	
}


try {
 con = DatabaseUtil.getConnection();
 String SQL="Select productnum,productname,price,catecode,productstate,content,ID,phonenumber from productlist where productnum="+ProductNum;
	 pstmt = con.prepareStatement(SQL);
     rs = pstmt.executeQuery();
    %> 
     <table width="100%"  border="1">
     <th align="center" width="40">상품번호</th>
     <th align="center" width="100">상품이름</th>
     <th align="center" width="75">가격</th>
     <th align="center" width="50">상품종류</th>
     <th align="center" width="20">상태</th>
     <th align="center" width="100">내용</th>
     <th align="center" width="50">학번</th>
     <th align="center" width="50">전화번호</th>
      <th align="center" width="30">거래</th>
      <th align="center" width="30">거래</th>
     <% 
     if(rs.next()) {
			
    	    ProductNum= rs.getInt(1);
			String productname = rs.getString(2);
			String price = rs.getString(3);
			String catecode = rs.getString(4);
			String productstate = rs.getString(5);
			String content = rs.getString(6);
			String ID=rs.getString("ID");
			String PhoneNumber=rs.getString("PhoneNumber");
			
  %>
			
			</tr>
			    <td align="center"><%=ProductNum%></td>
				<td align="center"><%=productname %></td>
				<td align="center"><%=price %></td>
				<td align="center"><%=catecode %></td>
				<td align="center"><%=productstate %></td>
				<td align="center"><%=content %></td>
				<td align="center"><%=ID%></td>
				<td align="center"><%=PhoneNumber%></td>
				<td>
				<form action="cashtrade.jsp" method="post">
				<input type="hidden" name="ProductNum" value="<%=ProductNum%>" >
				<input type="hidden" name="sellerID" value="<%=ID%>" >
				<input type="hidden" name="ProductName" value="<%=productname%>" >
				<input type="hidden" name="price" value="<%=price%>" >
				<input type="submit" style='float: right;' value="현금">
			<td>
				</form>
				
				<form action="bartermaterial.jsp" method="post">
				<input type="hidden" name="ProductNum" value="<%=ProductNum%>" >
				<input type="hidden" name="sellerID" value="<%=ID%>" >
				<input type="hidden" name="ProductName" value="<%=productname%>" >
				<input type="hidden" name="sellerprice" value="<%=price%>" >
				<input type="hidden" name="buyerID" value="<%=buyerID%>" >
				<input type="submit" style='float: right;' value="교환">
			</td>
			</tr>
			</form>
			 <form action="doWrite" method="POST" class="write-form form1">
			<button type=button title="수정하기" onClick="location.href='ProductUpdate.jsp?writerID=<%=ID%>&ProductNum=<%=ProductNum%>'">수정하기</button> 
			<button type=button title="삭제하기" onClick="location.href='Delete.jsp?writerID=<%=ID%>&ProductNum=<%=ProductNum%>'">삭제하기</button> 
			</form>
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
			<button onclick="location='mainshop.jsp'">목록으로 돌아가기</button>
			
			
			
</body>
</html>