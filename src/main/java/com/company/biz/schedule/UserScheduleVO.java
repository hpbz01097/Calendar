package com.company.biz.schedule;

public class UserScheduleVO {

	private int user_no;
	private String user_id; 
	private String pwd; 
	private String name; 
	private String phone; 
	private int gender;
	private int age; 
	private int grade;
	private int schedule_no;
	private String work_start_date;
	private String work_end_date;
	private String work_start_time;
	private String work_end_time;
	
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
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
	

	
}
