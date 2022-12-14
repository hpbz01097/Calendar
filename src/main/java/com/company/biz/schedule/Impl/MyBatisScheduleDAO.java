package com.company.biz.schedule.Impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.biz.schedule.ScheduleVO;
import com.company.biz.schedule.UserScheduleVO;

@Repository
public class MyBatisScheduleDAO {
	@Autowired
	private SqlSessionTemplate myBatis;
	
	List<UserScheduleVO> userScheduleList;
	int count =0;
	
	public List<ScheduleVO> getScheduleList() {
		System.out.println("mybatis getScheduleList 실행");
		return myBatis.selectList("ScheduleDAO.getScheduleList");
	}

	public ScheduleVO getSchedule(ScheduleVO vo) {
		System.out.println("mybatis getSchedule 실행");
		return myBatis.selectOne("ScheduleDAO.getSchedule",vo);
	}
	
	public int insertSchedule(Map<String, Object> map) throws Exception {
		System.out.println("mybatis진입");
		int count = myBatis.insert("ScheduleDAO.insertSchedule", map);
		return count;
	}
	
	public int updateSchedule(Map<String, Object> map) throws Exception {
		int count = myBatis.update("ScheduleDAO.updateSchedule", map);
		return count;
	}
	
	public int getMaxSchedule_no() throws Exception {
		int count = myBatis.selectOne("ScheduleDAO.getMaxSchedule_no");
		return count;
	}
	
	public List<UserScheduleVO> getScheduleListByUser_no(int user_no) throws Exception {
		userScheduleList = myBatis.selectList("ScheduleDAO.getScheduleListByUser_no",user_no);
		return userScheduleList;
	}

	public int getdeleteSchedule(int schedule_no) throws Exception {
		count = myBatis.delete("ScheduleDAO.deleteSchedule", schedule_no);
		return count;
	}
	
	public String getChecked_days(int schedule_no) {
		String checked_days=myBatis.selectOne("ScheduleDAO.getChecked_days",schedule_no);
		return checked_days;
	}
	
}
