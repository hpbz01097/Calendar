<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYROLL.M_근무자 수정</title>
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
		<h3>근무자 수정</h3>
	<form action="updateWorker.do" method="post">
	<%-- <c:forEach var="schedule" items="${userVO}"> --%>
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

	</table>
	<input type="submit" value="등록" class="inputBtn">
<%-- 	</c:forEach> --%>
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

</script>
</html>