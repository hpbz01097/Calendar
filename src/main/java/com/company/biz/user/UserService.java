package com.company.biz.user;

import java.util.List;
import java.util.Map;

public interface UserService {

	UserVO getUser(UserVO vo);

	void insertWorker(UserVO vo);
	
	public UserVO getUserByUser_no(int user_no) throws Exception;
	
	public List<UserVO> getAdmin() throws Exception;
	
	public void updateUser(Map map) throws Exception;
	
	public int getMaxUser_no() throws Exception;
	
	public List<UserVO> getUserList() throws Exception;
	
	public int deleteUser(int user_no) throws Exception;

	int selectPhoneOverLap(String phone) throws Exception;

	int addAdmin(UserVO userVO) throws Exception;

	String selectIDbyPhone(String phone) throws Exception;

	String selectPWDbyPhoneAndUser_id(Map map) throws Exception;
	

}