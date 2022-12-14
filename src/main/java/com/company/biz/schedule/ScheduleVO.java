package com.company.biz.schedule;

public class ScheduleVO {
	private int user_no;
	private int schedule_no;
	private String name;
	private String work_start_date;
	private String work_end_date;
	private String work_start_time;
	private String work_end_time;
	private String checked_days;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWork_start_date() {
		return work_start_date;
	}
	public void setWork_start_date(String work_start_date) {
		this.work_start_date = work_start_date;
	}
	public String getWork_end_date() {
		return work_end_date;
	}
	public void setWork_end_date(String work_end_date) {
		this.work_end_date = work_end_date;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getWork_start_time() {
		return work_start_time;
	}
	public void setWork_start_time(String work_start_time) {
		this.work_start_time = work_start_time;
	}
	public String getWork_end_time() {
		return work_end_time;
	}
	public void setWork_end_time(String work_end_time) {
		this.work_end_time = work_end_time;
	}
	
	public String getChecked_days() {
		return checked_days;
	}
	public void setChecked_days(String checked_days) {
		this.checked_days = checked_days;
	}
	@Override
	public String toString() {
		return "ScheduleVO [user_no=" + user_no + ", schedule_no=" + schedule_no + ", name=" + name
				+ ", work_start_date=" + work_start_date + ", work_end_date=" + work_end_date + ", work_start_time="
				+ work_start_time + ", work_end_time=" + work_end_time + "]";
	}
	
	
}
