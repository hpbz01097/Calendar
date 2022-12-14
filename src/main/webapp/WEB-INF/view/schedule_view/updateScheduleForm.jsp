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

	<jsp:include page="/WEB-INF/view/common_view/nav.jsp"></jsp:include>
	
	<div class="insert_container">
		<h1>근무시간 수정</h1>
	<form action="updateSchedule.do" method="post">
	<table>

		<tr>
			<td>근무자 번호</td>
			<td><input type="text" id="schedule_no" name="user_no" value="${scheduleVO.user_no}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>근무 번호</td>
			<td><input type="text" id="schedule_no" name="schedule_no" value="${scheduleVO.schedule_no}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${scheduleVO.name }" readonly="readonly"></td>
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
		<tr>
		<td>현재 근무요일</td>
		<td>
		${scheduleVO.checked_days }
		</td>
		</tr>
		<tr>
			<td>근무요일 변경</td>
			<td colspan="2">
			<input type="checkbox" name="checked_days" value="MONDAY">월
			<input type="checkbox" name="checked_days" value="TUESDAY">화
			<input type="checkbox" name="checked_days" value="WEDNESDAY">수
			<input type="checkbox" name="checked_days" value="THURSDAY">목
			<input type="checkbox" name="checked_days" value="FRIDAY">금
			<input type="checkbox" name="checked_days" value="SATURDAY">토
			<input type="checkbox" name="checked_days" value="SUNDAY">일
			</td>
		</tr>

	</table>
		<input type="submit" value="등록" class="inputBtn">
		<input type="button" value="삭제" onclick="deleteBtn(${scheduleVO.schedule_no});" class="inputBtn">
		<input type="button" value="취소" onclick="cancel()" class="inputBtn">
	</form>
	</div>
	<jsp:include page="/WEB-INF/view/common_view/footer.jsp"></jsp:include>
<script type="text/javascript">
function cancel() {
	if(confirm('작성을 취소하시겠습니까?')){
		location.href = "${contextPath}/main.do";
	}
}	
function deleteBtn(schedule_no) {
	if (confirm('삭제하시겠습니까?')) {
		location.href = "${contextPath}/deleteSchedule.do?schedule_no="+schedule_no;
	}
}
</script>
</body>
</html>