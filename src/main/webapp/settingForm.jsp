<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_설정창</title>
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
	<h1>설정</h1>
	<form action="getScheduleList.do" method="post">
		<table border="1" class="table">
					<tr>
						<th width="200">근무자 번호</th>
						<th width="200"> 이름 </th>
						<th width="200">전화번호</th>
						<th width="200">근무일 조정</th>
						<th width="100">삭제</th>
					</tr>
					<c:forEach var="userList" items="${adminList }">
						<c:choose>
							<c:when test="${grade == 0 }">
							<tr>
								<td>${userList.user_no }</td>
								<td><a href="javascript:void(0);" onclick="updateUser('${userList.user_no }');" class="aTag"> ${userList.name}  </a> </td>
								<td>${userList.phone}</td>
								<td> <a href="javascript:void(0);" onclick="updateSchedule('${userList.user_no }','${userList.name}');" class="aTag">근무일 조정</a> </td>
								<td> <a href="javascript:void(0);" onclick="deleteUser('${userList.user_no }');" class="aTag">삭제</a> </td>		
							</tr>					
							</c:when>
							<c:otherwise>
							<tr>
								<td>${userList.user_no }</td>
								<td> ${userList.name} </td>
								<td>${userList.phone}</td>
								<td>근무일 조정 </td>
								<td>삭제 </td>		
							</tr>	
							</c:otherwise>
						</c:choose>			
					</c:forEach>
					</table>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

function updateUser(user_no) {
	 
	if(confirm('수정하시겠습니까?')){
		location.href = "${contextPath}/updateWorkerUserForm.do?user_no="+user_no;
	}
}
function deleteUser(user_no) {
	 
	if(confirm('삭제하시겠습니까?')){
		location.href = "${contextPath}/deleteWorker.do?user_no="+user_no;
	}
}
function updateSchedule(user_no,user_name) {
	 
	if(confirm('근무일을 조정하시겠습니까?')){
		location.href = "${contextPath}/main2.do?user_no="+user_no+"&user_name="+user_name;
	}
}

</script>
</html>