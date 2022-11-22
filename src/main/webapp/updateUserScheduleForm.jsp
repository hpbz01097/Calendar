<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_근무 시간 수정</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<div class="insert_container" style="padding: 60px;">
		<h1>근무 시간 수정</h1>
	<form action="updateWorker.do" method="post">
	<table>
		<tr>
			<td>근무자번호</td>
			<td><input type="text" id="user_no" name="user_no" value="${userVO.user_no}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" id="user_id" name="user_id" value="${userVO.user_id}"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="text" id="pwd" name="pwd" value="${userVO.pwd}"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${userVO.name}"></td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td><input type="text" id="phone" name="phone" value="${userVO.phone }" placeholder="숫자만 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="${userVO.gender}" id="genderMan">남 <input
				type="radio" name="gender" value="${userVO.gender }" id="genderWoman">여</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" id="age" value="${userVO.age}"></td>
		</tr>
		<tr>
			<td>근무시간</td>
			<td><input type="time" name="work_start_time" id="work_start_time" value="${work_start_time }"> <input
				type="time" name="work_end_time" id="work_end_time" value="${work_end_time }"></td>
		</tr>
		<tr>
			<td>계약기간</td>
			<td colspan="2"><input type="date" name="work_start_date" id="work_start_date" value="${work_start_date }">
			<input type="date" name="work_end_date" id="work_end_date" value="${work_end_date }">
			<input type="hidden" name="schedule_no" value="${schedule_no }">
			</td>

		</tr>

	</table>
		<input type="submit" value="등록" class="inputBtn">
		<input type="button" value="취소" onclick="cancel()" class="inputBtn">
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	
	let genderMan = $("#genderMan");
	let genderWoman = $("#genderWoman");
	
/* 	alert(genderMan.val()); */
 	
 	if(genderMan.val() == 0){
 		genderMan.attr("checked" , true);
 	}else{
 		genderWoman.attr("checked" , true);
 	}
	
});
function cancel() {
	if(confirm('작성을 취소하시겠습니까?')){
		location.href = "${contextPath}/main.do";
	}
}	

</script>
</html>