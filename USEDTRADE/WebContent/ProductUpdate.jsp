<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<% request.setCharacterEncoding("UTF-8"); %>
<title>Insert title here</title>
</head>
<body>
<form 
<%//상품을 수정할떄 사용합니다 %>
	
		action="./Update.jsp?" method="post">
		
		<h3> 상품번호:<%=request.getParameter("ProductNum")%></h3>  
		<input type="text" name="ProductName" placeholder="상품이름" >
		<input type="number" name="price" placeholder="가격" >
		<input type="text" name="PhoneNumber" placeholder="연락할 전화번호" >
		
		<%
		String ID = null;
		ID = (String)session.getAttribute("ID");
		String writerID=null;
		int ProductNum=0;
		if(request.getParameter("ProductNum") != null)
		{
			ProductNum = Integer.parseInt(request.getParameter("ProductNum"));

		}
		
		writerID = request.getParameter("writerID");
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		
		
	%>
	<input type="hidden" name="writerID" value="<%=writerID%>" >
	<input type="hidden" name="ProductNum" value="<%=ProductNum%>" >
	<input type="hidden" name="ID" value="<%=ID%>" >	
	  <select  name="catecode" size="1">
    		<option value="음식">식품</option>
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
</body>
</html>