<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M</title>
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
<form action="login.do" method="post">

	<ul>
		<li><h3>LOGIN</h3></li>
		<li><b>ID</b>&nbsp;&nbsp;<input type="text" name="user_id" class="inputBox" required="required"></li>
		<li><b>PW</b> <input type="password" name="pwd" class="inputBox" required="required"> </li>
		<li><input type="submit" value="로그인" class="inputBtn">
		<button  type="button" value="회원가입" onclick="location.href='${contextPath}/signUpForm.do'" class="inputBtn" >회원가입</button>
		</li>
	</ul>	
</form>
</div>
<div class="bottom_container">
<a href="${contextPath}/findIDForm.do">아이디 찾기</a>&nbsp;&nbsp;/&nbsp;&nbsp;
<a href="${contextPath}/findPWDForm.do">비밀번호 찾기</a>
</div>
<footer>
<span> Maker : MyoungMoonShin</span><br>
<span> Email : hpbz01097@naver.com </span><br>
<span> Copyright 2022.11.18. All Rights Reserved.</span>
</footer>
</body>
</html>
