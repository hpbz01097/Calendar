<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_회원가입</title>
<link href="css_design/index_design.css" rel="stylesheet">
<style type="text/css">
ul li {
	padding: 5px;
	list-style: none;
}
.section_container {
    height: 400px;
}
.header_container {
    padding-top: 20px;
}
</style>
</head>
<body>
<header>
<img class="logo" src="img/PayRoll_Logo.png" />
</header>
<div class="header_container">
<h1>PAYROLL.M</h1>
</div>
<div class="section_container">
	<form action="signUp.do" method="post">
	
		<ul>
		<li><h3>회원가입</h3></li>
		<li><b>ID</b>&nbsp;&nbsp;<input type="text" name="user_id" class="inputBox" required="required"></li>
		<li><b>PW</b> <input type="password" name="pwd" class="inputBox" required="required"> </li>
		<li><b>이름</b> <input type="text" id="name" name="name" class="inputBox" required="required"> </li>
		<li><b>H.P</b> <input type="text" id="phone" placeholder="-하이푼 없이 입력해주세요" name="phone" class="inputBox" required="required"> </li>
		<li><b>성별</b> 
			<input type="radio" name="gender" value="0" required="required">남
			<input type="radio" name="gender" value="1" required="required">여
		</li>
		<li><b>나이</b> <input type="text" id="age" name="age" class="inputBox" required="required"> </li>
		<li>
			<input type="submit" value="가입하기" class="inputBtn" >
			<input type="reset" value="다시입력" class="inputBtn">
			
		</li>
	</ul>	
	</form>
<a href='${contextPath}/'>뒤로가기</a>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>