<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="STUDENT.UserDTO" %>
<%@ page import="STUDENT.UserLOG" %>
<%@ page import="STUDENT.UserDAO" %>  
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">

 
</head>
 
<body>
<!-- 로그아웃  -->
    <%
    
    session.invalidate();
    
   
   //로그아웃시에 main.jsp로 이동하게 해줌
  %>
 
  <script> location.href = "index.jsp" </script>


</body>
 
</html>
 