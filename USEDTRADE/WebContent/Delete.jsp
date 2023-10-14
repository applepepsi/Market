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

<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
//상품 목록을 삭제할때 사용합니다.

String ID=null;

String writerID=null;
if(request.getParameter("writerID") != null)
{
	writerID = (String) request.getParameter("writerID");
}



	int ProductNum=0;
	ID = (String)session.getAttribute("ID");

	System.out.println(ID);
	
	if(request.getParameter("ProductNum") != null)
	{
		ProductNum = Integer.parseInt(request.getParameter("ProductNum"));

	}
	
	System.out.println(writerID);
	System.out.println(ProductNum);
	if(!ID.equals(writerID))
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href='mainshop.jsp'");
		script.println("</script>");
	}
	else
	{
		ProductDAO productDAO = new ProductDAO();
		int result=productDAO.delete(ProductNum);
		if( result == 1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제를 성공했습니다.');");
			script.println("location.href = 'mainshop.jsp';");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제를 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
		}
	}
		
	
	
%>


			
</body>
</html>