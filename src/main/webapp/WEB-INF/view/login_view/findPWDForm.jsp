<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_FindPW</title>
<link href="css_design/insert_design.css" rel="stylesheet">
<link href="css_design/index_design.css" rel="stylesheet">
</head>
<body>
<header>
	<img class="logo" src="img/PayRoll_Logo.png" />
</header>
<div class="header_container">
	<h1>PAYROLL.M</h1>
</div>
	<div class="section_container">
	<br>
		<h3>비밀번호 찾기</h3>
		 <c:if test="${pwd != null }">
		<br>
			<span style="background: gray;">찾으신 비밀번호는 '${pwd }' 입니다!</span>
		</c:if> 
		
	<form action="${contextPath }/findPWD.do" method="post" style="padding: 0px;">

		<ul>
			<li><b>아이디</b> <input type="text" id="user_id" name="user_id" class="inputBox" required="required"></li>
			<li><b>핸드폰번호</b> <input type="text" id="phone" name="phone" class="inputBox" placeholder="숫자만 입력해주세요" required="required"></li>
		</ul>

	<input type="submit" value="등록" class="inputBtn">
	<input type="button" value="뒤로가기" class="inputBtn" onclick="location.href='${contextPath}/'">
	</form>
	</div>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>