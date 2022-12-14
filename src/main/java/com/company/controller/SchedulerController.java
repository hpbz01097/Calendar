package com.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;
import com.company.biz.user.UserService;
import com.company.calculator.CalcSalary;

@RestController
public class SchedulerController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ScheduleService scheduleService;
	
	ScheduleVO scheduleVO = new ScheduleVO();

	// 근무 시간 등록 Form
	@RequestMapping(value = "/insertScheduleForm.do",method = RequestMethod.GET )
	public ModelAndView insertScheduleForm() throws Exception{
		int count = scheduleService.getMaxSchedule_no();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("schedule_view/insertScheduleForm");
		
		mav.addObject("maxSchedule_no", count);
		return mav;
	}
	
//	// 근무 시간 등록
//	@RequestMapping(value = "/insertSchedule.do",method = RequestMethod.POST )
//	public ModelAndView insertSchedule(ScheduleVO schedule, CalcSalary2 salary) throws Exception{
//		ModelAndView mav = new ModelAndView();
//		
//		salary.calcSalary();
//		
//		mav.setViewName("redirect:main.do");
//		
//		return mav;
//	}

	// 근무 시간 등록
	@RequestMapping(value = "/insertSchedule.do",method = RequestMethod.POST )
	public ModelAndView insertSchedule(ScheduleVO schedule, CalcSalary salary) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		if(userService.getUserByUser_no(schedule.getUser_no())==null) {
			mav.setViewName("redirect:insertUserForm.do?requireInsertUser=1");
			return mav;
		}
		
		scheduleService.insertSchedule(schedule,salary);
		
		
		mav.setViewName("redirect:main.do");
		
		return mav;
	}
	
	// 근무 시간 수정 Form
	@RequestMapping(value = "/updateScheduleForm.do" , method = RequestMethod.GET)
	public ModelAndView updateScheduleForm(@ModelAttribute ScheduleVO scheduleVO) throws Exception {
		
		System.out.println("/updateScheduleForm.do 도달");
		ModelAndView mav = new ModelAndView();
		
		String ListWorkDays=CalcSalary.transDays(scheduleService.getChecked_days(scheduleVO.getSchedule_no()));
		scheduleVO.setChecked_days(ListWorkDays);
		mav.addObject("scheduleVO", scheduleVO);
		mav.setViewName("schedule_view/updateScheduleForm");
		
		return mav;
	}
	
	// 근무 시간 수정
	@SuppressWarnings("unused")
	@RequestMapping(value = "/updateSchedule.do" , method = RequestMethod.POST)
	public ModelAndView updateSchedule(ScheduleVO schedule, CalcSalary salary) throws Exception {
		
		System.out.println("/updateSchedule.do 도달");
		ModelAndView mav = new ModelAndView();
		
		scheduleService.updateSchedule(schedule,salary);
		
		mav.setViewName("redirect:main.do");
		
		return mav;
	}
	
	// 근무 시간 삭제 
	@RequestMapping(value = "/deleteSchedule.do")
	public ResponseEntity<String> deleteSchedule(@RequestParam int schedule_no, HttpServletRequest req , HttpServletResponse resp) throws Exception {
		System.out.println("/deleteSchedule.do 이동 완료");
		
		org.springframework.http.HttpHeaders responseHeaders = new org.springframework.http.HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message = "<script>";
		
		int count = scheduleService.deleteSchedule(schedule_no);
		
		if(count != 0) {
			System.out.println(count);
			message =  message + " alert('삭제 완료!'); ";
		}else {
			System.out.println(count);
			message = message + " alert('삭제 완료!'); ";
		}
		message = message + " location.href='"+req.getContextPath()+"/main.do'; ";
		message = message + " </script> ";
		
		System.out.println(message);
		
		return new ResponseEntity<String>(message,responseHeaders,HttpStatus.OK);
		
	}
	
	
}
