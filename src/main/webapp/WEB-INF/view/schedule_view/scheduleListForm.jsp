<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>PAYROLL.M_메인화면</title>
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css'
	rel='stylesheet' />
<link href="css_design/header_design.css" rel="stylesheet">
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js'></script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/common_view/nav.jsp"></jsp:include>
	<!-- calendar 태그 -->
	<div id="calendar-container">
		<div id="calendar"
			class="fc fc-media-screen fc-direction-ltr fc-theme-standard"
			style="height: 700px;">
			<div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
				<div class="fc-toolbar-chunk"></div>
				<div class="fc-toolbar-chunk">
					<h2 class="fc-toolbar-title" id="fc-dom-1">${user_name}</h2>
				</div>
				<div class="fc-toolbar-chunk">
					<div class="fc-button-group"></div>
				</div>
			</div>
			<div aria-labelledby="fc-dom-1"
				class="fc-view-harness fc-view-harness-active">
				<div class="fc-list  fc-list-sticky fc-listWeek-view fc-view">
					<div class="fc-scroller fc-scroller-liquid"
						style="overflow: hidden auto;">
						<table class="fc-list-table ">
							<tbody>
							
							
							<c:forEach items="${scheduleList }" var="scheduleList">
							
								<tr class="fc-list-day fc-day fc-day-sun fc-day-past">
									<th scope="colgroup" colspan="3" id="fc-dom-88-2022-11-13"
										aria-labelledby="fc-dom-89"><div
											class="fc-list-day-cushion fc-cell-shaded">
<%-- 										<a id="fc-dom-89" class="fc-list-day-text" 
												title="2022년 11월 13일" data-navlink="" tabindex="0">${scheduleList.work_start_date } &nbsp;&nbsp;~&nbsp;&nbsp;${scheduleList.work_end_date }
											</a> --%>
											<p class="fc-list-day-text">
												${scheduleList.work_start_date } &nbsp;&nbsp;~&nbsp;&nbsp;${scheduleList.work_end_date }
											</p>
<!-- 											<a
												aria-hidden="true" class="fc-list-day-side-text"
												title="2022년 11월 13일" data-navlink="">2022년 11월 13일
											</a> -->
										</div></th>
								</tr>
								<tr
									class="fc-list-event fc-event-forced-url fc-event fc-event-start fc-event-end fc-event-past">
									<%-- <td class="fc-list-event-time">${scheduleList.work_start_time } &nbsp;&nbsp;~&nbsp;&nbsp;${scheduleList.work_end_time }</td> --%>
									<td aria-hidden="true" class="fc-list-event-graphic"><span
										class="fc-list-event-dot"></span></td>
									<td headers="fc-dom-87 fc-dom-88-2022-11-13"
										class="fc-list-event-title"><a
										href="javascript:void(0);" onclick="updateSchedule('${scheduleList.user_no }','${scheduleList.schedule_no }','${scheduleList.name }','${scheduleList.work_start_date }','${scheduleList.work_end_date }','${scheduleList.work_start_time }','${scheduleList.work_end_time }');">
										${scheduleList.name } &nbsp;&nbsp;-&nbsp;&nbsp; ${scheduleList.work_start_time }시 &nbsp;&nbsp;~&nbsp;&nbsp;${scheduleList.work_end_time }시</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/common_view/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

	function updateSchedule(user_no , schedule_no ,name , start_date , end_date , start_time , end_time) {
		
		location.href="${contextPath}/updateScheduleForm.do?user_no="+user_no+"&schedule_no="+schedule_no+"&name="+name+"&work_start_date="+start_date+"&work_end_date="+end_date+"&work_start_time="+start_time+"&work_end_time="+end_time;
		
	}
</script>
</html>