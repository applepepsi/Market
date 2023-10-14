<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="STUDENT.UserDTO" %>
<%@ page import="STUDENT.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
//회원가입에서 받은 정보를 보내줍니다.
	request.setCharacterEncoding("UTF-8");
	String ID = null;
	String Password = null;
	String Department=null;
	
	String PhoneNumber=null;
	String StudentName=null;
	String Grade=null;
	if(request.getParameter("ID") != null)
	{
		ID = (String) request.getParameter("ID");
	}
	if(request.getParameter("Password") != null)
	{
		Password = (String) request.getParameter("Password");
	}
	if(request.getParameter("Department") != null){
		Department = (String) request.getParameter("Department");
	}
	if(request.getParameter("PhoneNumber") != null){
		PhoneNumber = (String) request.getParameter("PhoneNumber");
	}
	if(request.getParameter("StudentName") != null){
		StudentName = (String) request.getParameter("StudentName");
	}
	if(request.getParameter("Grade") != null){
		Grade = (String) request.getParameter("Grade");
	}
	
	if(ID == null || Password == "" || Department==""||PhoneNumber==""
			||StudentName=="" || Grade=="")
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.join(ID, Password,Department,PhoneNumber,StudentName,Grade);
	int result2= userDAO.IDCheck(ID);
	if( result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.');");
		
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	if(result2==1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('학번이 중복되었습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>