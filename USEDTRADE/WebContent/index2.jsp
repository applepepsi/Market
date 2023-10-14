<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>



</head>

<body>

	<%//회원가입 정보 입력란 입니다. %>
<% request.setCharacterEncoding("UTF-8"); %>
	<form action="./userJoinAction.jsp" method="post">

		<input type="text" name="ID" placeholder="학번" >

		<input type="text" name="Password" placeholder="비밀번호" >
		<input type="text" name="Department" placeholder="학과" >
		
		<input type="text" name="PhoneNumber" placeholder="전화번호" >
		<input type="text" name="StudentName" placeholder="이름" >
		<input type="text" name="Grade" placeholder="학년" >
		<input type="submit" value="회원가입" >

	</form>

	

	


 

</body>

</html>