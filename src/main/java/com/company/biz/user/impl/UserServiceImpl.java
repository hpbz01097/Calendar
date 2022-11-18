package com.company.biz.user.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

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
		// TODO Auto-generated method stub
		count = userMyBatisDAO.selectPhoneOverLap(phone);
		return count;
	}
	
	@Override
	public String selectIDbyPhone(String phone) throws Exception {
		// TODO Auto-generated method stub
		String user_id = userMyBatisDAO.selectIDbyPhone(phone);
		return user_id;
	}
	
@Override
	public String selectPWDbyPhoneAndUser_id(Map map) throws Exception {
		// TODO Auto-generated method stub
	String pwd = userMyBatisDAO.selectPWDbyPhoneAndUser_id(map);
	return pwd;
	}
	
	@Override
	public int addAdmin(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		count = userMyBatisDAO.addAdmin(vo);
		return count;
	}
	
	public UserVO getUser(UserVO vo) {
		return userMyBatisDAO.getUser(vo);
	}

	public void insertWorker(UserVO vo) {
		userMyBatisDAO.insertWorker(vo);
	}
	
	@Override
	public int getMaxUser_no() throws Exception {
		// TODO Auto-generated method stub
		count = userMyBatisDAO.getMaxUser_no();
		return count;
	}

	@Override
	public UserVO getUserByUser_no(int user_no) throws Exception {
		// TODO Auto-generated method stub
		userVO = userMyBatisDAO.getUserByUser_no(user_no);
		return userVO;
	}
	
	@Override
	public void updateUser(Map map) throws Exception {
		// TODO Auto-generated method stub
		userMyBatisDAO.updateUser(map);
		
	}
	
	@Override
	public List<UserVO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		List<UserVO> userList = userMyBatisDAO.getUserList();
		return userList;
	}
	
	@Override
	public List<UserVO> getAdmin() throws Exception {
		// TODO Auto-generated method stub
		List<UserVO> userList = userMyBatisDAO.getAdmin();
		return userList;
	}
	
	@Override
	public int deleteUser(int user_no) throws Exception {
		// TODO Auto-generated method stub
		count = userMyBatisDAO.deleteUser(user_no);
		return count;
	}
	
}
