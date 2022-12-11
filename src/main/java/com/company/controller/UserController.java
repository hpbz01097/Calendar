package com.company.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;

@RestController
public class UserController {
	
	@Autowired
	private UserService userService;
	
	UserVO userVO = new UserVO();
	
	// 근무자 리스트 화면
	@RequestMapping(value = "/userListForm.do" , method = RequestMethod.GET)
	public ModelAndView userlistForm(Model model) throws Exception{
		
		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> userList = userService.getUserList();

		mav.addObject("userList", userList);
		mav.setViewName("user_view/userListForm");
		return mav;
	}
	
	// 근무자 급여
	@RequestMapping(value = "/userSalaryList.do")
	public ModelAndView userSalaryList(ModelAndView mav,HttpSession session) {
		mav.addObject("userSalaryList", userService.getUserSalary((int) session.getAttribute("user_no")));
		mav.setViewName("user_view/userSalaryList");
		return mav;
	}
	
	// 근무자 등록 Form
	@RequestMapping(value = "/insertUserForm.do",method = RequestMethod.GET )
	public ModelAndView insertUserForm(@RequestParam(name = "requireInsertUser",defaultValue = "0") String requireInsertUser) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		int count = userService.getMaxUser_no();
		if(requireInsertUser.equals("1") ) {
			mav.setViewName("user_view/insertUserForm");
			mav.addObject("maxUser_no", count);
			mav.addObject("requireInsertUser", requireInsertUser);
			return mav;
		}else {
		mav.setViewName("user_view/insertUserForm");

		mav.addObject("maxUser_no", count);
		return mav;
		}
	}
	
	// 근무자 등록
	@RequestMapping(value = "/insertUser.do",method = RequestMethod.POST )
	public ModelAndView insertUser(UserVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:main.do");
		userService.insertUser(vo);
		return mav;
	}

	// 근무자 수정 Form
	@RequestMapping(value = "/updateUserForm.do" , method = RequestMethod.GET)
	public ModelAndView updateUserForm(@RequestParam int user_no) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user_view/updateUserForm");
		
		UserVO userVO = userService.getUserByUser_no(user_no);
		mav.addObject("userVO", userVO);
		
		return mav;
	}
	
	// 근무자 수정
	@RequestMapping(value = "/updateUser.do",method = RequestMethod.POST )
	public ModelAndView updateUser(@RequestParam Map<String,Object> map) throws Exception{
		System.out.println("/updateUser.do 도달");
		
		System.out.println(map.get("user_no"));
		System.out.println(map.get("user_id"));
		System.out.println(map.get("pwd"));
		System.out.println(map.get("name"));
		System.out.println(map.get("phone"));
		System.out.println(map.get("gender"));
		System.out.println(map.get("age"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:main.do");
		Map<String, Object> maps=new HashMap<String, Object>();
		maps.put("map", map);
		userService.updateUser(map);
		
		return mav;
	}

	// 근무자 삭제
	@RequestMapping(value = "/deleteUser.do" , method = RequestMethod.GET)
	public ResponseEntity<String> deleteUser(@RequestParam int user_no, HttpServletRequest req , HttpServletResponse resp) throws Exception {
		System.out.println("/deleteUser.do 이동 완료");
		
		org.springframework.http.HttpHeaders responseHeaders = new org.springframework.http.HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message = "<script>";
		
		int count = userService.deleteUser(user_no);
		
		if(count != 0) {
			System.out.println(count);
			message =  message + " alert('삭제 완료!'); ";
		}else {
			System.out.println(count);
			message = message + " alert('삭제 완료!'); ";
		}
		message = message + " location.href='"+req.getContextPath()+"/userListForm.do'; ";
		message = message + " </script> ";
		
		System.out.println(message);
		
		return new ResponseEntity<String>(message,responseHeaders,HttpStatus.OK);
		
	}
	
	

}
