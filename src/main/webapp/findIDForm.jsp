<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_FindID</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>
<body>

	
	<%-- <jsp:include page="nav.jsp"></jsp:include> --%>
	
	<div class="insert_container">
		<h3>아이디 찾기</h3>
		
		<h4> <c:if test="${user_id != null }">
			찾으신 아이디는 ${user_id } 입니다!
		</c:if> 
		</h4>
		
	<form action="${contextPath }/findID.do" method="post">
	<table>

		<tr>
			<td>핸드폰번호</td>
			<td><input type="text" id="phone" name="phone" placeholder="숫자만 입력해주세요">
			</td>
		</tr>


	</table>
	<input type="submit" value="등록" class="inputBtn">
	<input type="button" value="뒤로가기" class="inputBtn" onclick="location.href='${contextPath}/'">
	</form>
	</div>
</body>
</html>