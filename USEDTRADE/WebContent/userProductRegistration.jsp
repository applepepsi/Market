<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="PRODUCTLIST.ProductDAO" %>
<%@ page import="PRODUCTLIST.ProductDTO" %> 

<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="util.DatabaseUtil" %>
<%
	request.setCharacterEncoding("UTF-8");
	int ProductNum=0;
	String ProductName=null;
	int price=0;
	String catecode=null;
	String productstate=null;
	String content=null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String ID = null;
	String PhoneNumber=null;
	if (session.getAttribute("ID") != null) {
		ID = (String) session.getAttribute("ID");
	}
	 con = DatabaseUtil.getConnection();
		String sql = "select productnum from productlist order by productnum desc";
//카테코드를 찾아서 카테네임을 불러옴

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next()) 
		{
			ProductNum = rs.getInt("ProductNum")+1;
		}
		else
		{
			ProductNum=1;
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
	if(ProductName == "" || price== 0||catecode==""|| productstate=="" ||content=="")
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	ProductDAO productDAO = new ProductDAO();
	
	int result = productDAO.productenrollment(ProductNum,ProductName,price,catecode,productstate,content,ID,PhoneNumber);
	if( result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품등록에 성공하였습니다..');");
		script.println("location.href = 'mainshop.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	
%>