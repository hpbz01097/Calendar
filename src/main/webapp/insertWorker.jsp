<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_근무자 등록</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>
<body>
<%-- 	<header>
	<nav>
			<ul>
				<li><a href="${contextPath }/main.do" class="bar">메인</a></li>
				<li><a href="${contextPath }/insertWorkerForm.do" class="bar">근무자 등록</a></li>
				<li><a href="${contextPath }/insertScheduleForm.do" class="bar">근무시간 등록</a></li>
				<li><a href="${contextPath }/listForm.do" class="bar">리스트</a></li>
				<li><a href="#" class="bar">지급 내역서</a></li>
				<li><a href="${contextPath }/settingForm.do" class="bar">설정</a></li>
				<li><a href="#" class="bar">로그아웃</a></li>
			</ul>
	</nav>
	</header> --%>
	
	<jsp:include page="nav.jsp"></jsp:include>
	
	<div class="insert_container">
		<h3>근무자 등록</h3>
	<form action="insertWorker.do" method="post">
	<table>
		<tr>
			<td>근무자번호</td>
			<td><input type="text" id="user_no" name="user_no" value="${maxUser_no + 1}" readonly="readonly"></td>
			<td><input type="hidden" id="user_id" name="user_id"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
			<td><input type="hidden" id="pwd" name="pwd"></td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td><input type="text" id="phone" name="phone" placeholder="숫자만 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="0">남 <input
				type="radio" name="gender" value="1">여</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" id="age" name="age"></td>
		</tr>

	</table>
	<input type="submit" value="등록" class="inputBtn">
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>