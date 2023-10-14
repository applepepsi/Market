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
<% request.setCharacterEncoding("UTF-8"); %>
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
//상품등록에 성공했을시 상품을 지웁니다

String ID=null;

String writerID=null;
if(request.getParameter("writerID") != null)
{
	writerID = (String) request.getParameter("writerID");
}
String writerID2=null;
{
	writerID2 = (String) request.getParameter("writerID2");
}


	int ProductNum=0;
	int ProductNum2=0;
	ID = (String)session.getAttribute("ID");

	System.out.println(ID);
	
	if(request.getParameter("ProductNum") != null)
	{
		ProductNum = Integer.parseInt(request.getParameter("ProductNum"));

	}if(request.getParameter("ProductNum2") != null)
	{
		ProductNum2 = Integer.parseInt(request.getParameter("ProductNum2"));

	}
	
		ProductDAO productDAO = new ProductDAO();
		int result=productDAO.delete(ProductNum);
		if( result == 1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('거래를 성공했습니다.');");
			script.println("location.href = 'mainshop.jsp';");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('거래를 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
		}
		int result2=productDAO.delete(ProductNum2);
		if( result == 2)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('거래를 성공했습니다.');");
			script.println("location.href = 'mainshop.jsp';");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('거래를 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
		}
	
%>


</body>
</html>	
