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

<title>Insert title here</title>
</head>
<body>

<%

//상품을 수정할수 있습니다.

String ID=null;
String ProductName=null;
int price=0;
String catecode=null;
String productstate=null;
String content=null;
String PhoneNumber=null;
String writerID=null;
if(request.getParameter("writerID") != null)
{
	writerID = (String) request.getParameter("writerID");
}

if(request.getParameter("ProductName") != null)
{
	ProductName = (String) request.getParameter("ProductName");
}

if(request.getParameter("price") != null)
{
	price = Integer.parseInt(request.getParameter("price"));

}
if(request.getParameter("catecode") != null){
	catecode = (String) request.getParameter("catecode");
}
if(request.getParameter("productstate") != null){
	productstate = (String) request.getParameter("productstate");
}
if(request.getParameter("content") != null){
	content = (String) request.getParameter("content");
}
if(request.getParameter("PhoneNumber") != null){
	PhoneNumber = (String) request.getParameter("PhoneNumber");
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
		int result=productDAO.update(ProductNum,ProductName,
				price,catecode,productstate,content,ID,PhoneNumber);
		if( result == 1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정에 성공했습니다.');");
			script.println("location.href = 'mainshop.jsp';");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
		}
	}
		
	
	
%>


			
</body>
</html>