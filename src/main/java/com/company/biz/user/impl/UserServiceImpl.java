package com.company.biz.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.biz.user.UserService;
import com.company.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMyBatisDAO userMyBatisDAO;
	
	UserVO userVO = new UserVO();
	int count = 0;
	
	@Override
	public int selectPhoneOverLap(String phone) throws Exception {
		count = userMyBatisDAO.selectPhoneOverLap(phone);
		return count;
	}
	
	@Override
	public String selectIDbyPhone(String phone) throws Exception {
		String user_id = userMyBatisDAO.selectIDbyPhone(phone);
		return user_id;
	}
	
	@Override
	public String selectPWDbyPhoneAndUser_id(Map<String,Object> map) throws Exception {
		String pwd = userMyBatisDAO.selectPWDbyPhoneAndUser_id(map);
		return pwd;
	}
	
	@Override
	public int addAdmin(UserVO vo) throws Exception {
		count = userMyBatisDAO.addAdmin(vo);
		return count;
	}
	
	public UserVO getUser(UserVO vo) {
		return userMyBatisDAO.getUser(vo);
	}
	
	public void insertUser(UserVO vo) {
		userMyBatisDAO.insertUser(vo);
	}
	
	@Override
	public int getMaxUser_no() throws Exception {
		count = userMyBatisDAO.getMaxUser_no();
		return count;
	}
	@Override
	public UserVO getUserByUser_no(int user_no) throws Exception {
		userVO = userMyBatisDAO.getUserByUser_no(user_no);
		return userVO;
	}
	
	@Override
	public void updateUser(Map<String,Object> map) throws Exception {
		userMyBatisDAO.updateUser(map);
		
	}
	
	@Override
	public List<Map<String, Object>> getUserList() throws Exception {
		List<Map<String, Object>> userList = userMyBatisDAO.getUserList();
		return userList;
	}
	
	@Override
	public List<UserVO> getAdmin() throws Exception {
		List<UserVO> userList = userMyBatisDAO.getAdmin();
		return userList;
	}
	
	@Override
	public int deleteUser(int user_no) throws Exception {
		count = userMyBatisDAO.deleteUser(user_no);
		return count;
	}

	@Override
	public List<Map<String, Object>> getUserSalary(int user_no) {
		List<Map<String, Object>> userSalaryList=userMyBatisDAO.getUserSalary(user_no);
		return userSalaryList;
	}




}