<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="PRODUCTLIST.ProductDAO" %>
<%@ page import="PRODUCTLIST.ProductDTO" %> 
 
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="util.DatabaseUtil" %>




<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>

<head>

	


	<title>JSP Web page</title>

</head>

<body>

	<%//상품 등록을 할수있게 해 줍니다. %>

	<form action="./userProductRegistration.jsp" method="post">
		<% String ProductNum=request.getParameter("ProductNum"); %>
		
		<input type="hidden" name="ProductNum" value="ProductNum" >
		<input type="text" name="ProductName" placeholder="상품이름" >
		<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="price" placeholder="가격" >
		<input type="text" name="PhoneNumber" placeholder="연락할 전화번호" >
		
		<%
		String ID = null;
		String PhoneNumber=null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
		
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		
	%>
			
	  <select  name="catecode" size="1">
    		<option value="음식">음식</option>
         	<option value="도서">도서</option>
         	<option value="상품권">상품권</option>
        	<option value="가구">가구</option>
         	<option value="의류">의류</option>
         	<option value="전자제품">전자제품</option>
         	<option value="미용용품">미용용품</option>
  
 	</select>
			<select  name="productstate" size="1">
    		<option value="A">A</option>
         	<option value="B">B</option>
         	<option value="C">C</option>
        	<option value="D">D</option>
         	
  
 	</select>
			<tr>
    <td><textarea class="form-control" placeholder="상품 설명을 적어주세요" 
    name="content" maxlength="2048" style="height: 350px;">
    </textarea>
    </td>
					
			</tr>



		<input type="submit" value="등록!!" >

	</form>
<button onclick="location='mainshop.jsp'">돌아가기</button>
	

	

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

 

</body>

</html>