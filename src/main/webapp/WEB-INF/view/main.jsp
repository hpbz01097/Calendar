<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" ></c:set>

<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <title>PAYROLL.M_메인화면</title>
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <link href="css_design/header_design.css" rel="stylesheet">
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js'></script>
    <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
//         navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
          console.log("단 한번만 이벤트 실행1");
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
          console.log("단 한번만 이벤트 실행2");
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
          console.log("단 한번만 이벤트 실행3");
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.	
//          	var eventTarget = $(".fc-daygrid-day");
//          	var title=location.href='insertWorker.jsp#'	+eventTarget.attr("data-date");
         	var title;
         	<c:forEach var="schedule" items="${scheduleList}">
         	location.href='${contextPath }/insertScheduleForm.do#${schedule.work_start_date}&${schedule.work_end_date}';
         	</c:forEach>
        	//안해도 될거같음 주소만 옮기고 insert에서 시간을 직접 주기
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        // 이벤트 
        events: [
        	<c:forEach var="schedule" items="${scheduleList}">
        	  {
                title: "${schedule.name} - " + "${schedule.work_start_time}".substring(0,2) +"시 ~ "+ "${schedule.work_end_time}".substring(0,2)+"시",
                url : '${contextPath}/updateScheduleForm.do?user_no=${schedule.user_no}&schedule_no=${schedule.schedule_no}&name=${schedule.name}&work_start_date=${schedule.work_start_date}&work_end_date=${schedule.work_end_date}&work_start_time=${schedule.work_start_time}&work_end_time=${schedule.work_end_time}&schedule_no=${schedule.schedule_no}',
                start: "${schedule.work_start_date}T${schedule.work_start_time}",
                end: "${schedule.work_end_date}T${schedule.work_end_time}",
                backgroundColor : "yellow",
                borderColor : "yellow",
                textColor : "black",
              }, 
        	</c:forEach>
        ],
        eventColor:"yellow"
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/common_view/nav.jsp"></jsp:include>
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
<jsp:include page="/WEB-INF/view/common_view/footer.jsp"></jsp:include>
</body>
</html>