<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	


</head>
<script type="text/javascript">

</script>
</head>
<body>
<%//내가 만약 로그인하지 않았다면 로그인과 회원가입 버튼만 보이고 로그인 했다면 로그아웃과 장터로가기 내 상품보기가 보입니다. %>
<% request.setCharacterEncoding("UTF-8"); %>
		<div align ="center">
		<table border="1" width="800" height="600">
		<tr height="10%">
		<td colspan="2" align="center">
		<%
		 if(session.getAttribute("ID") == null) {
            %>
            <h1> 로그인 페이지 </h1> 
           <button onclick="location='index3.jsp'">로그인</button>
           <button onclick="location='index2.jsp'">회원가입</button>
            <%
        } 
else
{%>
		
		<h3> 환영합니다: <%=(String)session.getAttribute("ID") %> 님!</h3>
  		<button onclick="location='userLogOutAction.jsp'">로그아웃</button>
  		<button onclick="location='mainshop.jsp'">장터로 가기</button>
  		<button onclick="location='myproduct.jsp'">내상품보기</button>
 <%
 }
 %>	
    
</body>
</html>