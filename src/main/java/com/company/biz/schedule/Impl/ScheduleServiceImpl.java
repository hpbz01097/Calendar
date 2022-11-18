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

	@Override
	public List<ScheduleVO> getScheduleList() {
		return myBatisScheduleDAO.getScheduleList();
	}

	@Override
	public ScheduleVO getSchedule(ScheduleVO vo) {
		return myBatisScheduleDAO.getSchedule(vo);
	}
	
	@Override
	public int insertSchedule(Map map) throws Exception {
		// TODO Auto-generated method stub
		return myBatisScheduleDAO.insertSchedule(map);
	}
	
	@Override
	public void updateSchedule(Map map) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println(map.get("work_start_time"));
//		System.out.println(map.get("work_end_time"));
//		System.out.println(map.get("work_start_date"));
//		System.out.println(map.get("work_start_date"));
		 myBatisScheduleDAO.updateSchedule(map);
	}
	@Override
	public int getMaxSchedule_no() throws Exception {
		// TODO Auto-generated method stub
		return myBatisScheduleDAO.getMaxSchedule_no();
	}
	
	@Override
	public List<UserScheduleVO> getScheduleListByUser_no(int user_no) throws Exception {
		// TODO Auto-generated method stub
		return myBatisScheduleDAO.getScheduleListByUser_no(user_no);
	}
	
//	@Override
//	public int deleteSchedule(int user_no) throws Exception {
//		// TODO Auto-generated method stub
//		return myBatisScheduleDAO.deleteSchedule(user_no);
//	}
	
}
