<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_급여내역 리스트</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="/WEB-INF/view/common_view/nav.jsp"></jsp:include>

<div class="insert_container" style="width: 1000px;">
	<h1>급여내역 리스트</h1>
	<form>
		<table border="1" class="table">
					<tr>
						<th width="200">등록일</th>
						<th width="200">수정일</th>
						<th width="200">일일 근무시간</th>
						<th width="200">총근무시간</th>
						<th width="200">총근무일</th>
						<th width="200">시급</th>
						<th width="100">일급</th>
						<th width="100">총급여</th>
					</tr>
					<c:forEach var="userSalaryList" items="${userSalaryList }">
							<tr>
								<td>${userSalaryList.reg_date}</td>
								<td>${userSalaryList.update_date}</td>
								<td>${userSalaryList.workTime}</td>
								<td>${userSalaryList.totalWorktime}</td>
								<td>${userSalaryList.workDay}</td>
								<td>${userSalaryList.pay}</td>
								<td>${userSalaryList.dayPay}</td>
								<td>${userSalaryList.salary}</td>
							</tr>					
					</c:forEach>
					</table>
					<footer class="foot">
					<a href="javascript:void(window.open('https://www.alba.co.kr/rsc/inc/common/Calculator.asp', '급여 계산기','width=800, height=600'))" class="bar">급여 계산기</a>
					</footer>
	</form>
</div>
<jsp:include page="/WEB-INF/view/common_view/footer.jsp"></jsp:include>
</body>
</html>