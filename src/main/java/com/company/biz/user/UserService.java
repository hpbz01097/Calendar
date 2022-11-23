package com.company.biz.user;

import java.util.List;
import java.util.Map;

public interface UserService {

	UserVO getUser(UserVO vo);

	void insertUser(UserVO vo);
	
	public UserVO getUserByUser_no(int user_no) throws Exception;
	
	public List<UserVO> getAdmin() throws Exception;
	
	public void updateUser(Map<String,Object> map) throws Exception;
	
	public int getMaxUser_no() throws Exception;
	
	public List<Map<String, Object>> getUserList() throws Exception;

	public List<Map<String, Object>> getUserSalary(int user_no);
	
	public int deleteUser(int user_no) throws Exception;

	int selectPhoneOverLap(String phone) throws Exception;

	int addAdmin(UserVO userVO) throws Exception;

	String selectIDbyPhone(String phone) throws Exception;

	String selectPWDbyPhoneAndUser_id(Map<String,Object> map) throws Exception;



	

}