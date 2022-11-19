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
	<jsp:include page="nav.jsp"></jsp:include>
	
	<div class="insert_container">
		<h1>근무자 등록</h1>
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
		<input type="button" value="취소" onclick="cancel()" class="inputBtn">
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
function cancel() {
	if(confirm('작성을 취소하시겠습니까?')){
		location.href = "${contextPath}/main.do";
	}
}	
</script>
</body>
</html>