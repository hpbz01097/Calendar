<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_근무시간 수정</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	<div class="insert_container">
		<h3>근무시간 수정</h3>
	<form action="updateSchedule.do" method="post">
	<table>

		<tr>
			<td>근무자 번호</td>
			<td><input type="text" id="schedule_no" name="user_no" value="${scheduleVO.user_no}" readonly="readonly"></td>
	<!-- 		<td><input type="hidden" id="user_id" name="user_id"></td> -->
		</tr>
		<tr>
			<td>근무 번호</td>
			<td><input type="text" id="schedule_no" name="schedule_no" value="${scheduleVO.schedule_no}" readonly="readonly"></td>
	<!-- 		<td><input type="hidden" id="user_id" name="user_id"></td> -->
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${scheduleVO.name }" readonly="readonly"></td>
<!-- 			<td><input type="hidden" id="pwd" name="pwd"></td>-->
		</tr>
		<tr>
			<td>근무시간</td>
			<td><input type="time" id="work_start_time" name="work_start_time" value="${scheduleVO.work_start_time }"> <input
				type="time" id="work_end_time" name="work_end_time" value="${scheduleVO.work_end_time }"></td>
		</tr>
		<tr>
			<td>계약기간</td>
			<td colspan="2"><input type="date" id="work_start_date" name="work_start_date" value="${scheduleVO.work_start_date }">
			<input type="date" id="work_end_date" name="work_end_date" value="${scheduleVO.work_end_date }"></td>

		</tr>
<!-- <!-- 		<tr>
		<td>근무요일
		<td colspan="7">
			월<input type="checkbox" >
			화<input type="checkbox">
			수<input type="checkbox">
			목<input type="checkbox">
			금<input type="checkbox">
			토<input type="checkbox">
			일<input type="checkbox">
		</tr>
		<tr>
			<td>옵션</td>
			<td colspan="2"><select id="work_day_option" style="width: 200px;">
					<option id="0">없음</option>
					<option id="0">월,수,금</option>
					<option id="0">화,목</option>
					<option id="0">토,일</option>
			</select></td>
		</tr> --> 

	</table>
	<input type="submit" value="등록" class="inputBtn">
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>