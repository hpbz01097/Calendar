package com.company.biz.user.impl;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.company.biz.user.UserVO;

@Repository
public class UserMyBatisDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	UserVO userVO = new UserVO();
	int count = 0;
	List<UserVO> userList;
	
	public int selectPhoneOverLap(String phone) throws Exception {
		count = mybatis.selectOne("UserDAO.selectPhoneOverLap", phone);
		return count;
	}
	
	public String selectIDbyPhone(String phone) throws Exception {
		String user_id = mybatis.selectOne("UserDAO.selectIDbyPhone", phone);
		return user_id;
	}
	
	public String selectPWDbyPhoneAndUser_id(Map<String,Object> map) throws Exception {
		String pwd = mybatis.selectOne("UserDAO.selectPWDbyPhoneAndUser_id", map);
		return pwd;
	}
	public int addAdmin(UserVO vo) {
		count = mybatis.insert("UserDAO.addAdmin", vo);
		return count;
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("mybatis getUser실행");
		return (UserVO)mybatis.selectOne("UserDAO.getUser", vo);
	}
	
	public int getMaxUser_no() throws Exception {
		count = mybatis.selectOne("UserDAO.getMaxUser_no");
		return count;
	}
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
		
	}
	
	public UserVO getUserByUser_no(int user_no) throws Exception {
		userVO = mybatis.selectOne("UserDAO.getUserByUser_no", user_no);
		return userVO;
	}
	
	public List<UserVO> getAdmin() throws Exception {
		userList = mybatis.selectList("UserDAO.getAdmin");
		return userList;
	}
	public void updateUser(Map<String,Object> map) throws Exception {
		mybatis.update("UserDAO.updateUser", map);
		
	}
	
	public List<Map<String, Object>> getUserList() throws Exception {
		List<Map<String, Object>> userList = mybatis.selectList("UserDAO.getUserList");
		return userList;
	}

	public List<Map<String, Object>> getUserSalary(int user_no){
		List<Map<String, Object>> userSalaryList = mybatis.selectList("UserDAO.getUserSalary",user_no);
		return userSalaryList;
	}

	public int deleteUser(int user_no) throws Exception {
		count = mybatis.delete("UserDAO.deleteUser", user_no);
		return count;
	}
}