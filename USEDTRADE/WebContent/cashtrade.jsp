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
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
//현금거래를 하는 코드입니다
	request.setCharacterEncoding("UTF-8");

	Connection con = DatabaseUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int ProductNum=0;
	String catecode=null;
	String sellerID=null;
	String ProductName=null;
	String buyerID=null;
	int price=0;
	String ID=null;
	
	if(request.getParameter("ProductNum") != null){
		ProductNum = Integer.parseInt(request.getParameter("ProductNum"));
	}
	if(request.getParameter("price") != null){
		price = Integer.parseInt(request.getParameter("price"));
	}
	if(request.getParameter("sellerID") != null){
		sellerID = (String) request.getParameter("sellerID");
	}
	if(request.getParameter("ProductName") != null){
		ProductName = (String) request.getParameter("ProductName");
	}
	buyerID=(String)session.getAttribute("ID");
	System.out.println(sellerID);
	System.out.println(buyerID);
	System.out.println(ProductNum);
	System.out.println(price);
	System.out.println(ProductName);
	if(sellerID.equals(buyerID))
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('혼자거래할수없습니다')");
		script.println("location.href='mainshop.jsp'");
		script.println("</script>");
	}
	else
	{
		
	%>
	 <table width="80%"  border="1">
     <th align="center" width="40">상품번호</th>
     <th align="center" width="100">상품이름</th>
     <th align="center" width="75">가격</th>
     <th align="center" width="50">구매자학번</th>
	 <th align="center" width="50">판매자학번</th>
     </tr>
			    <td align="center"><%=ProductNum%></td>
				<td align="center"><%=ProductName%></td>
				<td align="center"><%=price%></td>
				<td align="center"><%=buyerID%></td>
				<td align="center"><%=sellerID%></td>
				
	<button type=button title="거래하기" onClick="location.href='tradeSuc.jsp?writerID=<%=ID%>&ProductNum=<%=ProductNum%>'">거래하기</button> 
	<button onclick="location='mainshop.jsp'">거래취소</button>
	<% 
	}
	%>
	</tr>
	

</body>
</html>