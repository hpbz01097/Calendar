<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" ></c:set>

	<header>
	<nav>
				<ul>
					<li class="logo_li"><a href="${contextPath }/main.do"><img class="logo" src="img/PayRoll_Logo.png" /></a></li>
					<li><a href="${contextPath }/main.do" class="bar">메인</a></li>
				<c:if test="${grade == 0 }">	
					<li><a href="${contextPath }/insertUserForm.do" class="bar">근무자 등록</a></li>
					<li><a href="${contextPath }/insertScheduleForm.do" class="bar">근무시간 등록</a></li>
				</c:if>
					<li><a href="${contextPath }/userListForm.do" class="bar">리스트 / 급여</a></li>
					<li><a href="${contextPath }/userSalaryList.do" class="bar">급여 내역서</a></li>
					<li><a href="${contextPath }/settingForm.do?user_no=${user_no}" class="bar">설정</a></li>
				</ul>
			<div class="user_name" id="user_name">
						<p> ${user_id } 님 </p>
						<button type="button" onclick="logout(${user_no});">로그아웃</button>
			</div>
	</nav>
	</header>
	<script type="text/javascript">
	
		function logout(user_no) {
			
			location.href="${contextPath}/logout.do?user_no="+user_no;
		}
	</script>