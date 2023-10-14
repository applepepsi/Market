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
<% 
//최종적인 물물교환 입니다
	request.setCharacterEncoding("UTF-8");

	Connection con = DatabaseUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int ProductNum=0;
	String catecode=null;
	String sellerID=null;
	
	String ProductName=null;
	String buyerID=null;
	int sellerprice=0;
	int buyerprice=0;
	String ID=null;
	int ProductNum2=0;
	if(request.getParameter("ProductNum") != null){
		ProductNum = Integer.parseInt(request.getParameter("ProductNum"));
	}
	if(request.getParameter("ProductNum2") != null){
		ProductNum2 = Integer.parseInt(request.getParameter("ProductNum2"));
	}
	if(request.getParameter("ProductNum") != null){
		ProductNum = Integer.parseInt(request.getParameter("ProductNum"));
	}
	if(request.getParameter("sellerID") != null){
		sellerID = (String) request.getParameter("sellerID");
	}
	if(request.getParameter("buyerID") != null){
		buyerID = (String) request.getParameter("buyerID");
	}
	if(request.getParameter("ProductName") != null){
		ProductName = (String) request.getParameter("ProductName");
	}
	if(request.getParameter("buyerprice") != null){
		buyerprice = Integer.parseInt(request.getParameter("buyerprice"));
	}
	
	
	
	if(request.getParameter("sellerprice") != null){
		sellerprice = Integer.parseInt(request.getParameter("sellerprice"));
	}
	System.out.println(ProductNum);
	System.out.println(sellerID);
	System.out.println(ProductName);
	System.out.println(buyerprice);
	System.out.println(buyerID);
	System.out.println(sellerprice);
	
	
	
	if(sellerID.equals(buyerID))
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('혼자거래할수없습니다')");
		script.println("location.href='mainshop.jsp'");
		script.println("</script>");
	}
	else if(sellerprice != buyerprice)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가격이 같아야 합니다')");
		script.println("location.href='mainshop.jsp'");
		script.println("</script>");
	}
	else
	{
		
	%>
	 <table width="80%"  border="1">
     <th align="center" width="40">상품번호</th>
     <th align="center" width="100">상품이름</th>
     <th align="center" width="75">구매자가격</th>
     <th align="center" width="75">판매자가격</th>
     <th align="center" width="50">구매자학번</th>
	 <th align="center" width="50">판매자학번</th>
     </tr>
			    <td align="center"><%=ProductNum%></td>
				<td align="center"><%=ProductName%></td>
				<td align="center"><%=buyerprice%></td>
				<td align="center"><%=sellerprice%></td>
				<td align="center"><%=buyerID%></td>
				<td align="center"><%=sellerID%></td>
			<td>	
	<button type=button title="거래하기" onClick="location.href='tradeSuc.jsp?writerID=<%=sellerID%>&ProductNum=<%=ProductNum%>&ProductNum2=<%=ProductNum2%>&writerID2=<%=buyerID%>'">교환하기</button> 
	</td>
	<button onclick="location='mainshop.jsp'">거래취소</button>
	<% 
	}
	%>
	</tr>
	

</body>
</html>