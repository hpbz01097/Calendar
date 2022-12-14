package com.company.biz.schedule;

import java.util.List;

import com.company.calculator.CalcSalary;

public interface ScheduleService {
	List<ScheduleVO> getScheduleList();

	ScheduleVO getSchedule(ScheduleVO vo);
	
	public void updateSchedule(ScheduleVO schedule,CalcSalary salary) throws Exception;
	
	public int getMaxSchedule_no() throws Exception;
	
	public int insertSchedule(ScheduleVO schedule,CalcSalary salary) throws Exception;

	List<UserScheduleVO> getScheduleListByUser_no(int user_no) throws Exception;

	public int deleteSchedule(int schedule_no) throws Exception;
	
	public String getChecked_days(int schedule_no) throws Exception;
	
}
