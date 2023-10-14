<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="STUDENT.UserDTO" %>
<%@ page import="STUDENT.UserLOG" %> 
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String ID = null;
	String Password = null;
	
	
	
	ID =  request.getParameter("ID");
		
	
	if(session.getAttribute("ID")!=null)
	{
		ID=(String)session.getAttribute("ID");
	}
	
	
	Password = (String) request.getParameter("Password");
	
	
	
	UserLOG userLOG = new UserLOG();
	
	int result = userLOG.login(ID, Password);

	if( result == 1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공했습니다.');");
		session.setAttribute("ID",ID);
		script.println("location.href = 'shop.jsp';");
		script.println("</script>");
	}
	else
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 정보가 올바르지 않습니다.');");
		script.println("history.back();");
		script.println("</script>");
	}
	
%>

