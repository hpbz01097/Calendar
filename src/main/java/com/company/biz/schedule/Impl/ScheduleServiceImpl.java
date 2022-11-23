package com.company.biz.schedule.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;
import com.company.biz.schedule.UserScheduleVO;

@Service("ScheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private MyBatisScheduleDAO myBatisScheduleDAO;
	
	int count =0;
	
	@Override
	public List<ScheduleVO> getScheduleList() {
		return myBatisScheduleDAO.getScheduleList();
	}

	@Override
	public ScheduleVO getSchedule(ScheduleVO vo) {
		return myBatisScheduleDAO.getSchedule(vo);
	}
	
	@Override
	public int insertSchedule(Map<String,Object> map) throws Exception {
		return myBatisScheduleDAO.insertSchedule(map);
	}
	
	@Override
	public void updateSchedule(Map<String, Object> map) throws Exception {
		 myBatisScheduleDAO.updateSchedule(map);
	}
	@Override
	public int getMaxSchedule_no() throws Exception {
		return myBatisScheduleDAO.getMaxSchedule_no();
	}
	
	@Override
	public List<UserScheduleVO> getScheduleListByUser_no(int user_no) throws Exception {
		return myBatisScheduleDAO.getScheduleListByUser_no(user_no);
	}

	@Override
	public int deleteSchedule(int schedule_no) throws Exception {
		count =  myBatisScheduleDAO.getdeleteSchedule(schedule_no);
		return count;
	}
	
}
