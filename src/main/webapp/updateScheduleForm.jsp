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
		<h1>근무시간 수정</h1>
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