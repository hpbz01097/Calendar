package com.company.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;

@RestController
public class LoginController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ScheduleService scheduleService;
	
	UserVO userVO = new UserVO();
	
	// 회원가입 Form
	@RequestMapping(value = "/signUpForm.do" , method = RequestMethod.GET)
	public ModelAndView signUpForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		System.out.println("/signUpForm.do 도달");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login_view/signUpForm");
		return mav;
	}
	
	// 회원 가입
	@RequestMapping(value = "/signUp.do" , method = RequestMethod.POST)
	public ResponseEntity<String> singUp(HttpServletRequest req, HttpServletResponse resp , @ModelAttribute UserVO userVO) throws Exception {
		
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
		
		return new ResponseEntity<String>(message , responseHeaders , HttpStatus.OK);
	}

	// 아이디 찾기 Form
	@RequestMapping(value = "/findIDForm.do" , method = RequestMethod.GET)
	public ModelAndView findIDForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		
		System.out.println("/findIDForm.do");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login_view/findIDForm");
		
		return mav;
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/findID.do" , method = RequestMethod.POST)
	public ModelAndView findID(HttpServletRequest req , HttpServletResponse resp , @RequestParam String phone) throws Exception {
		
		System.out.println("/findID.do");
		
		String user_id = userService.selectIDbyPhone(phone);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login_view/findIDForm");
		mav.addObject("user_id", user_id);
		
		return mav;
	}
	
	// 비밀번호 찾기 Form
	@RequestMapping(value = "/findPWDForm.do" , method = RequestMethod.GET)
	public ModelAndView findPWDForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		
		System.out.println("/findPWDForm.do");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login_view/findPWDForm");
		
		return mav;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/findPWD.do" , method = RequestMethod.POST)
	public ModelAndView findPWD(HttpServletRequest req , HttpServletResponse resp , @RequestParam Map<String, Object> map) throws Exception {
		
		System.out.println("/findPWD.do");
		
		String pwd = userService.selectPWDbyPhoneAndUser_id(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login_view/findPWDForm");
		mav.addObject("pwd", pwd);
		
		return mav;
	}
	
	// 로그인
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
			mav.setViewName("login_view/signUpForm");
			return mav;
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.do" , method = RequestMethod.GET)
	public ResponseEntity<String> logout(HttpServletRequest req, HttpServletResponse resp, @RequestParam int user_no) throws Exception {
		
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
		
		return new ResponseEntity<String>(message,responseHeaders,HttpStatus.OK);
	}

	

}
