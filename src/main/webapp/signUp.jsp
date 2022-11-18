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
</head>
<body>
<div class="index_container">

	<form action="signUp.do" method="post">
			<table>
		<!-- <tr>
			<td>회원번호</td>
			<td> <input type="text" id="user_no"> </td>
		</tr> -->
		<tr>
			<td><h3>회원가입</h3></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td> <input type="text" id="user_id" name="user_id" required="required"> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" id="pwd" name="pwd" required="required"> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td>  <input type="text" id="name" name="name" required="required"> </td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td>  <input type="text" id="phone" placeholder="-하이푼 없이 입력해주세요" name="phone" required="required"> </td>
		</tr>
		<tr>
			<td>성별</td>
			<td> <input type="radio" name="gender" value="0" required="required">남
				<input type="radio" name="gender" value="1" required="required">여
			 </td>
		</tr>
		<tr>
			<td>나이</td>
			<td>  <input type="text" id="age" name="age" required="required"> </td>
		</tr>
		<tr>
			<td colspan='2'><input type="submit" value="가입하기" >
			<input type="reset" value="다시입력">
			<button type="button" class="inputBtn" onclick="location.href='${contextPath}/'">뒤로가기</button>
			</td>
		</tr>
		</table>
	
	</form>

</div>

</body>
</html>