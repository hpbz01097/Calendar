package com.company.biz.schedule.Impl;

import java.util.HashMap;
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
	private SqlSessionTemplate myBatisScheduleDAO;
	
	List<UserScheduleVO> userScheduleList;
	
	public List<ScheduleVO> getScheduleList() {
		System.out.println("mybatis getScheduleList 실행");
		return myBatisScheduleDAO.selectList("myBatisScheduleDAO.getScheduleList");
	}

	public ScheduleVO getSchedule(ScheduleVO vo) {
		System.out.println("mybatis getSchedule 실행");
		return myBatisScheduleDAO.selectOne("myBatisScheduleDAO.getSchedule",vo);
	}
	
	public int insertSchedule(Map map) throws Exception {
		System.out.println("mybatis진입");
//		System.out.println(salary.get("salary"));
//		Map<String, Object> maps=new HashMap();
//		maps.put("salary", salary);
//		maps.put("map", map);
		
		int count = myBatisScheduleDAO.insert("myBatisScheduleDAO.insertSchedule", map);
		return count;
	}
	
	public int updateSchedule(Map map) throws Exception {
//		System.out.println(map.get("work_start_time"));
//		System.out.println(map.get("work_end_time"));
//		System.out.println(map.get("work_start_date"));
//		System.out.println(map.get("work_start_date"));
		int count = myBatisScheduleDAO.update("myBatisScheduleDAO.updateSchedule", map);
		return count;
	}
	
	public int getMaxSchedule_no() throws Exception {
		int count = myBatisScheduleDAO.selectOne("myBatisScheduleDAO.getMaxSchedule_no");
		return count;
	}
	
	public List<UserScheduleVO> getScheduleListByUser_no(int user_no) throws Exception {
		userScheduleList = myBatisScheduleDAO.selectList("myBatisScheduleDAO.getScheduleListByUser_no",user_no);
		return userScheduleList;
	}
	
	
	
//	public int deleteSchedule(int user_no) throws Exception {
//		int count = myBatisScheduleDAO.delete("myBatisScheduleDAO.deleteSchedule", user_no);
//		return count;
//	}
	
	
}
