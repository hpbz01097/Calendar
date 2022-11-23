package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.UserScheduleVO;
import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;

@RestController
public class MainController {

	@Autowired
	private UserService userService;
	@Autowired
	private ScheduleService scheduleService;
	
	// 메인 화면
	@RequestMapping(value = "/main.do" , method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("scheduleList",scheduleService.getScheduleList());
		return mav;
		
	}
	
	// 사원별 근무일 출력 화면
	@RequestMapping(value = "/scheduleListForm.do" , method = RequestMethod.GET)
	public ModelAndView scheduleListForm(HttpServletRequest req, @RequestParam int user_no) throws Exception {
		
		System.out.println("/scheduleListForm.do 도달");
		System.out.println(user_no);
		
		ModelAndView mav = new ModelAndView();
		List<UserScheduleVO> userScheduleList = scheduleService.getScheduleListByUser_no(user_no);
		UserVO userVO = userService.getUserByUser_no(user_no);
		
		mav.addObject("scheduleList",userScheduleList);
		mav.addObject("user_name",userVO.getName());
		mav.setViewName("schedule_view/scheduleListForm");
		return mav;
		
	}
	
	// 설정 화면 Form
	@RequestMapping(value = "/settingForm.do" , method = RequestMethod.GET)
	public ModelAndView settingForm(HttpServletRequest req, HttpServletResponse resp , @RequestParam int user_no) throws Exception {
		
		UserVO userVO = userService.getUserByUser_no(user_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user_view/settingForm");
		
		mav.addObject("adminList", userService.getAdmin());
		mav.addObject("userVO", userVO);
		
		
		return mav;
	}
	

}
