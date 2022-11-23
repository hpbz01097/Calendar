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
	<jsp:include page="/WEB-INF/view/common_view/nav.jsp"></jsp:include>
<div class="insert_container">
	<h1>설정</h1>
	<form action="updateUser.do" method="post">
	<table>
		<tr>
			<td>근무자번호</td>
			<td><input type="text" id="user_no" name="user_no" value="${userVO.user_no}" readonly="readonly" class="td_backcolor"></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" id="user_id" name="user_id" value="${userVO.user_id}" required="required"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="text" id="pwd" name="pwd" value="${userVO.pwd}" required="required"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${userVO.name}" readonly="readonly" class="td_backcolor"></td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td><input type="text" id="phone" name="phone" value="${userVO.phone }" readonly="readonly" class="td_backcolor">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="${userVO.gender}" id="genderMan" readonly="readonly"  class="td_backcolor">남 
				<input type="radio" name="gender" value="${userVO.gender }" id="genderWoman" readonly="readonly" class="td_backcolor">여
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" id="age" value="${userVO.age}" readonly="readonly" class="td_backcolor"></td>
		</tr>

	</table>
		<input type="submit" value="등록" class="inputBtn">
		<input type="button" value="취소" onclick="cancel()" class="inputBtn">
	</form>
</div>
<jsp:include page="/WEB-INF/view/common_view/footer.jsp"></jsp:include>
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