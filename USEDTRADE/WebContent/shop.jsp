<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>

<title>Insert title here</title>
</head>
<script type="text/javascript">

</script>
</head>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
	<h3> Login ID: <%=(String)session.getAttribute("ID") %></h3>    	  

<form action="./index.jsp" method="post">

		<input type="submit" value="메인화면으로 가기" >

</form>

<form
         action="./userLogOutAction.jsp" method="post">
		<input type="submit" value="로그아웃" >
</form>

</body>
</html>