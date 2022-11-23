<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_근무자 리스트</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="/WEB-INF/view/common_view/nav.jsp"></jsp:include>

<div class="insert_container" style="width: 1000px;">
	<h1>근무자 리스트</h1>
	<form action="getScheduleList.do" method="post">
		<table border="1" class="table">
					<tr>
						<th width="200">근무자 번호</th>
						<th width="200"> 이름 </th>
						<th width="200">전화번호</th>
						<th width="200">총지급액</th>
						<th width="200">총근무일</th>
						<th width="200">총근무시간</th>
						<th width="200">근무일 조정</th>
						<th width="100">삭제</th>
					</tr>
					<c:forEach var="userList" items="${userList }">
						<c:choose>
							<c:when test="${grade == 0 }">
							<tr>
								<td class="user_no_td">${userList.user_no }</td>
								<td><a href="javascript:void(0);" onclick="updateUser('${userList.user_no }');" class="aTag"> ${userList.name}  </a> </td>
								<c:set var="tel" value="${userList.phone }" />
								<td>${fn:substring(tel,0,3)}-${fn:substring(tel,3,7)}-${fn:substring(tel,7,11)}</td>
								<td>${userList.salary}원</td>
								<td>${userList.workDay}</td>
								<td>${userList.totalWorktime}</td>
								<td> <a href="javascript:void(0);"  onclick="updateSchedule('${userList.user_no }','${userList.name}');" class="aTag">근무일 조정</a> </td>
								<td> <a href="javascript:void(0);" onclick="deleteUser('${userList.user_no }');" class="aTag">삭제</a> </td>		
							</tr>					
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${userList.user_no == user_no }">
										<tr>
											<td>${userList.user_no }</td>
											<td><a href="javascript:void(0);" onclick="settingUser('${userList.user_no }');" class="aTag"> ${userList.name}  </a> </td>
											<c:set var="tel" value="${userList.phone }" />
											<td>${fn:substring(tel,0,3)}-${fn:substring(tel,3,7)}-${fn:substring(tel,7,11)}</td>
											<td>${userList.salary }원</td>
											<td>${userList.workDay}</td>
											<td>${userList.totalWorktime}</td>
											<td> - </td>
											<td> - </td>			
										</tr>											
									</c:when>
									<c:otherwise>
										<tr>
											<td>${userList.user_no }</td>
											<td> ${userList.name} </td>
											<c:set var="tel" value="${userList.phone }" />
											<td>${fn:substring(tel,0,3)}-${fn:substring(tel,3,7)}-${fn:substring(tel,7,11)}</td>
											<td> - </td>
											<td> - </td>
											<td> - </td>
											<td> - </td>
											<td> - </td>		
										</tr>	
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>		
					</c:forEach>
					</table>
					<footer class="foot">
					<a href="javascript:void(window.open('https://www.alba.co.kr/rsc/inc/common/Calculator.asp', '급여 계산기','width=800, height=600'))" class="bar">급여 계산기</a>
					</footer>
	</form>
</div>
<jsp:include page="/WEB-INF/view/common_view/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

function updateUser(user_no) {
	 
	if(confirm('수정하시겠습니까?')){
		location.href = "${contextPath}/updateUserForm.do?user_no="+user_no;
	}
}
function settingUser(user_no) {
	 
	if(confirm('수정하시겠습니까?')){
		location.href = "${contextPath}/settingForm.do?user_no="+user_no;
	}
}
function deleteUser(user_no) {
	 
	if(confirm('삭제하시겠습니까?')){
		location.href = "${contextPath}/deleteUser.do?user_no="+user_no;
	}
}
function updateSchedule(user_no,user_name) {
	 
	if(confirm('근무일을 조정하시겠습니까?')){
		location.href = "${contextPath}/scheduleListForm.do?user_no="+user_no+"&user_name="+user_name;
	}
}

</script>
</html>