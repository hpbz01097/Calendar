package com.company.view.schedule;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;

@Controller
public class SchedulerController {
	
	
//	@Autowired
//	private ScheduleService scheduleService;
//	
//	@RequestMapping("getScheduleList.do")
//	public String getScheduleList(ScheduleVO vo, Model model, HttpSession session) {
//		System.out.println("getScheduleList");
////		model.addAttribute("scheduleList", scheduleService.getScheduleList(vo));
//		session.setAttribute("scheduleList",scheduleService.getScheduleList(vo));
//		session.setAttribute("max_user_no", scheduleService.getSchedule(vo).getUser_no());
//		return "main";
//	}
}
