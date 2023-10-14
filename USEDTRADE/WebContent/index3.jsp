<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>

<html>

<head>

	<title>JSP Web page</title>

</head>

<body>
<%
//로그인 입력란 입니다.

%>
	
<% request.setCharacterEncoding("UTF-8"); %>
	<form action="./userLoginAction.jsp" method="post">

		<input type="text" name="ID" placeholder="id" >
		<input type="text" name="Password" placeholder="pw" >
		
		
		<input type="submit" value="로그인" >
 		
            
	</form>

</body>

</html>