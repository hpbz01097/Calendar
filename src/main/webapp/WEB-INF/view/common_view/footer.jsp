<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" ></c:set>
	<footer>
		<span> Maker : MyoungMoonShin</span><br>
		<span> Email : hpbz01097@naver.com </span><br>
		<span> Copyright 2022.11.18. All Rights Reserved.</span>
	</footer>
	
		
	<script type="text/javascript">
	
		function logout(user_no) {
			
			location.href="${contextPath}/logout.do?user_no="+user_no;
		}
		
		function workerInfo(user_no) {
			
			location.href="${contextPath}/workerInfo.do?user_no="+user_no;
		}
		
	
	</script>
	