package com.company.view.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;
import com.company.biz.schedule.UserScheduleVO;
import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;
import com.company.calculator.CalcSalary;

@RestController
public class LoginController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ScheduleService scheduleService;
	
	UserVO userVO = new UserVO();
	
	@RequestMapping(value = "/signUpForm.do" , method = RequestMethod.GET)
	public ModelAndView signUpForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		System.out.println("/signUpForm.do 도달");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signUp");
		return mav;
		
	}
	
	@RequestMapping(value = "/signUp.do" , method = RequestMethod.POST)
	public ResponseEntity singUp(HttpServletRequest req, HttpServletResponse resp , @ModelAttribute UserVO userVO) throws Exception {
		
		System.out.println("/signUp.do 도달");
		int user_no =  userService.getMaxUser_no();

		userVO.setUser_no(user_no+1);
		userVO.setGrade(0);
	
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
	    int phoneOverLapCount = userService.selectPhoneOverLap(userVO.getPhone());
	    
	    String message = "<script>";
	    
	    if(phoneOverLapCount!=0) {
	    	message = message + " alert('회원가입 실패!'); ";
	    }else {
			int count = userService.addAdmin(userVO);
			if(count != 0) {
				message = message + " alert('회원가입 완료! 로그인 하세요'); ";
			}else {
				message = message + " alert('회원가입 실패!'); ";
			}
	    	
	    }
		
		message = message + " location.href='"+req.getContextPath()+"' ";
		message = message + " </script> ";
		
		return new ResponseEntity(message , responseHeaders , HttpStatus.OK);
		
	}
	

	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public ModelAndView login(UserVO vo, HttpSession session , HttpServletRequest req) {
		System.out.println("로그인 인증 요청." + vo.getUser_id() + "," + vo.getPwd());
		
		ModelAndView mav = new ModelAndView();
		
		if(vo.getUser_id()==null || vo.getUser_id().equals(""))
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		// 3. 화면 네비게이션
		if (userService.getUser(vo) != null) {
			session.setAttribute("name", userService.getUser(vo).getName());
			session.setAttribute("user_no", userService.getUser(vo).getUser_no());
			session.setAttribute("user_id", userService.getUser(vo).getUser_id());
			session.setAttribute("pwd", userService.getUser(vo).getPwd());
			session.setAttribute("phone", userService.getUser(vo).getPhone());			
			session.setAttribute("grade", userService.getUser(vo).getGrade());
			session.setAttribute("age", userService.getUser(vo).getAge());
			session.setAttribute("gender", userService.getUser(vo).getGender());
			
			mav.addObject("scheduleList",scheduleService.getScheduleList());
			mav.setViewName("redirect:main.do");
			
			return mav;
		} else {
			mav.setViewName("signUp");
			return mav;
		}

	}
	
	@RequestMapping(value = "/findIDForm.do" , method = RequestMethod.GET)
	public ModelAndView findIDForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		
		System.out.println("/findIDForm.do");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIDForm");
		
		return mav;
	}
	
	@RequestMapping(value = "/findID.do" , method = RequestMethod.POST)
	public ModelAndView findID(HttpServletRequest req , HttpServletResponse resp , @RequestParam String phone) throws Exception {
		
		System.out.println("/findID.do");
		
		String user_id = userService.selectIDbyPhone(phone);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIDForm");
		mav.addObject("user_id", user_id);
		
		return mav;
	}
	
	@RequestMapping(value = "/findPWDForm.do" , method = RequestMethod.GET)
	public ModelAndView findPWDForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		
		System.out.println("/findPWDForm.do");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findPWDForm");
		
		return mav;
	}
	
	@RequestMapping(value = "/findPWD.do" , method = RequestMethod.POST)
	public ModelAndView findPWD(HttpServletRequest req , HttpServletResponse resp , @RequestParam Map map) throws Exception {
		
		System.out.println("/findPWD.do");
		
		String pwd = userService.selectPWDbyPhoneAndUser_id(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findPWDForm");
		mav.addObject("pwd", pwd);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/main.do" , method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("scheduleList",scheduleService.getScheduleList());
		return mav;
		
	}
	@RequestMapping(value = "/main2.do" , method = RequestMethod.GET)
	public ModelAndView main2(HttpServletRequest req, @RequestParam int user_no) throws Exception {
		
		System.out.println("/main2.do 도달");
		System.out.println(user_no);
		
		ModelAndView mav = new ModelAndView();
		List<UserScheduleVO> userScheduleList = scheduleService.getScheduleListByUser_no(user_no);
		UserVO userVO = userService.getUserByUser_no(user_no);
		
		mav.addObject("scheduleList",userScheduleList);
		mav.addObject("user_name",userVO.getName());
		mav.setViewName("main2");
		return mav;
		
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("signUp");
		return mav;
	}

	@RequestMapping(value = "/insertWorkerForm.do",method = RequestMethod.GET )
	public ModelAndView insertWorkerForm(Model model) throws Exception{
		int count = userService.getMaxUser_no();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertWorker");
		
		mav.addObject("maxUser_no", count);
		return mav;
	}
	
	@RequestMapping(value = "/insertWorker.do",method = RequestMethod.POST )
	public ModelAndView insertWorker(UserVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:main.do");
		userService.insertWorker(vo);
		return mav;
	}
	
	@RequestMapping(value = "/insertScheduleForm.do",method = RequestMethod.GET )
	public ModelAndView insertScheduleForm() throws Exception{
		int count = scheduleService.getMaxSchedule_no();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertScheduler");
		
		mav.addObject("maxSchedule_no", count);
		return mav;
	}
	
	@RequestMapping(value = "/insertSchedule.do",method = RequestMethod.POST )
	public ModelAndView insertSchedule(@RequestParam Map map,CalcSalary salary) throws Exception{
		
		Map<String, Integer> salaryMap=salary.calc();
		Map<String, Object> maps=new HashMap();
		maps.put("salary", salaryMap);
		maps.put("map", map);
		scheduleService.insertSchedule(maps);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:main.do");

		return mav;
	}
	
	
	@RequestMapping(value = "/updateWorker.do",method = RequestMethod.POST )
	public ModelAndView updateWorker(@RequestParam Map map,CalcSalary salary) throws Exception{
		System.out.println("/updateWorker.do 도달");
		
		System.out.println(map.get("user_no"));
		System.out.println(map.get("user_id"));
		System.out.println(map.get("pwd"));
		System.out.println(map.get("name"));
		System.out.println(map.get("phone"));
		System.out.println(map.get("gender"));
		System.out.println(map.get("age"));
		System.out.println(map.get("work_start_time"));
		System.out.println(map.get("work_end_time"));
		System.out.println(map.get("work_start_date"));
		System.out.println(map.get("work_end_date"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:main.do");

		Map<String, Integer> salaryMap=salary.calc();
		Map<String, Object> maps=new HashMap();
		maps.put("salary", salaryMap);
		maps.put("map", map);
		scheduleService.updateSchedule(maps);
		userService.updateUser(map);

		return mav;
	}
	@RequestMapping(value = "/updateWorkerForm.do",method = RequestMethod.GET )
	public ModelAndView updateWorkerForm(@RequestParam("user_no") int user_no, @RequestParam Map<String, Object> map) throws Exception{
		System.out.println("/updateWorkerForm.do 도달");
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			userVO = userService.getUserByUser_no(user_no);
			if(userVO != null) {
				mav.addObject("userVO", userVO);
				mav.addObject("work_start_date", map.get("work_start_date"));
				mav.addObject("work_start_time", map.get("work_start_time"));
				mav.addObject("work_end_date", map.get("work_end_date"));
				mav.addObject("work_end_time", map.get("work_end_time"));
				mav.addObject("schedule_no", map.get("schedule_no"));
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.setViewName("updateWorker");
		
		return mav;
	}
	
	@RequestMapping(value = "/updateWorkerOnlyUserForm.do" , method = RequestMethod.GET)
	public ModelAndView updateWorkerOnlyUserForm(@RequestParam int user_no) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateWorkerOnlyUserForm");
		
		UserVO userVO = userService.getUserByUser_no(user_no);
		mav.addObject("userVO", userVO);
		
		return mav;
	}
	
	@RequestMapping(value = "/updateScheduleForm.do" , method = RequestMethod.GET)
	public ModelAndView updateScheduleForm(@ModelAttribute ScheduleVO scheduleVO) throws Exception {
		
		System.out.println("/updateScheduleForm.do 도달");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("scheduleVO", scheduleVO);
		mav.setViewName("updateScheduleForm");
		
		return mav;
	}
	
	@RequestMapping(value = "/updateSchedule.do" , method = RequestMethod.POST)
	public ModelAndView updateSchedule(@RequestParam Map map ,CalcSalary salary) throws Exception {
		
		System.out.println("/updateSchedule.do 도달");
		ModelAndView mav = new ModelAndView();
		
		Map<String, Integer> salaryMap=salary.calc();
		Map<String, Object> maps=new HashMap();
		maps.put("salary", salaryMap);
		maps.put("map", map);
		
		
		scheduleService.updateSchedule(maps);
		
		String user_no  = (String) map.get("user_no");
		String user_name =  (String) map.get("user_name");
		
		System.out.println(map.get("schedule_no"));
		System.out.println(map.get("work_start_time"));
		System.out.println(map.get("work_end_time"));
		System.out.println(map.get("work_start_date"));
		System.out.println(map.get("work_start_date"));

		mav.setViewName("redirect:main2.do?user_no="+user_no);
		
		return mav;
	}
	
	@RequestMapping(value = "/listForm.do" , method = RequestMethod.GET)
	public ModelAndView listForm(Model model) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		List<UserVO> userList = userService.getUserList();
		for (UserVO userVO : userList) {
			System.out.println(userVO.getSalary());
		}
		mav.addObject("userList", userList);
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping(value = "/deleteWorker.do" , method = RequestMethod.GET)
	public ResponseEntity deleteUser(@RequestParam int user_no , HttpServletRequest req , HttpServletResponse resp) throws Exception {
		
		System.out.println("/deleteWorker.do 이동 완료");
		
		org.springframework.http.HttpHeaders responseHeaders = new org.springframework.http.HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message = "<script>";
		
		int count = userService.deleteUser(user_no);
		
		if(count != 0) {
			System.out.println(count);
			message =  message + " alert('삭제 완료!'); ";
			
		}else {
			System.out.println(count);
			message = message + " alert('삭제 불가!'); ";
		}
		message = message + " location.href='"+req.getContextPath()+"/listForm.do'; ";
		message = message + " </script> ";
		
		System.out.println(message);
		
		return new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/settingForm.do" , method = RequestMethod.GET)
	public ModelAndView settingForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("settingForm");
		
		mav.addObject("adminList", userService.getAdmin());
		
		return mav;
	}
	
	@RequestMapping(value = "/logout.do" , method = RequestMethod.GET)
	public ResponseEntity logout(HttpServletRequest req, HttpServletResponse resp, @RequestParam int user_no) throws Exception {
		
		System.out.println("/logout.do 도달");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=UTF-8");
		
		String message = "<script>";
		
		HttpSession session = req.getSession();
		int user_no_Origin = (int)session.getAttribute("user_no");
		if(user_no_Origin == user_no) {
			System.out.println(user_no+"님 로그아웃 완료");
			message = message + " alert('"+session.getAttribute("user_id")+"님 로그아웃 완료했습니다!'); ";
			message = message + " location.href='"+req.getContextPath()+"' ";
			session.invalidate();
		}else {
			System.out.println(user_no+"님 로그아웃 실패");
			message = message + " alert("+session.getAttribute("user_id")+"님 로그아웃 실패!); ";
			message = message + " location.href='"+req.getContextPath()+"/main.do' ";
		}
		
		message = message + " </script> ";
		
		System.out.println(message);
		
		return new ResponseEntity(message,responseHeaders,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/workerInfo.do" , method = RequestMethod.GET)
	public ModelAndView workerInfo(HttpServletRequest req, HttpServletResponse resp , @RequestParam int user_no) throws Exception{
		
		UserVO userVO = userService.getUserByUser_no(user_no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("workerInfo");
		mav.addObject("userVO", userVO);
		
		return mav;
		
	}

	
	

}
