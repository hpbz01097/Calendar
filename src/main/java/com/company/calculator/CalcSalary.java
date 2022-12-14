package com.company.calculator;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.format.annotation.DateTimeFormat;

import com.company.biz.schedule.SalaryVO;

public class CalcSalary {
	
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime work_start_time;
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime work_end_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate work_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate work_end_date;
	private String [] checked_days;
	private static int pay = 9160;
	
	public CalcSalary(LocalTime work_start_time, LocalTime work_end_time, LocalDate work_start_date,
			LocalDate work_end_date, String[] checked_days) {
		
		this.work_start_time = work_start_time;
		this.work_end_time = work_end_time;
		this.work_start_date = work_start_date;
		this.work_end_date = work_end_date;
		this.checked_days = checked_days;
	}
	
	

	public SalaryVO calcSalary() {

		SalaryVO salaryVO=new SalaryVO();
		
		int salary=0;
		int workDay=0;
		int workTime=0;
		int totalWorkTime=0;
		int contractDay=((int) ChronoUnit.DAYS.between(work_start_date, work_end_date))+1;
		int minute = work_end_time.getMinute() - work_start_time.getMinute();
		String fullChecked_days=calcChecked_days(checked_days);
		
		System.out.println("근무 시작 시간 : "+work_start_time);
		System.out.println("근무 종료 시간 : "+work_end_time);
		System.out.println("근무 시작 일자 : "+work_start_date);
		System.out.println("근무 종료 일자 : "+work_end_date);
		
		workDay = calcCheckedDays(contractDay);
		workTime= calcWorkTime();
		totalWorkTime = workTime * workDay;
		
		if (minute / 30 == 0) {
			salary += 0;
		} else {
			salary += (workDay*pay)/2;
		}
		
		salary += workDay * workTime * pay;
		
		System.out.println("총 근무 기간 : "+workDay+"일");
		System.out.println("총 근무 시간 : "+totalWorkTime+"시간");
		System.out.println("총 급여 : "+salary+"원");
		System.out.println("계약 기간 : "+contractDay+"일");
		System.out.println("일일 근무 시간 : "+workTime+"시간");
		System.out.println("잔여 근무 시간 : "+minute+"분");
		
		salaryVO.setSalary(salary);
		salaryVO.setTotalWorktime(totalWorkTime);
		salaryVO.setWorkDay(workDay);
		salaryVO.setWorkTime(workTime);
		salaryVO.setContractDay(contractDay);
		salaryVO.setChecked_days(fullChecked_days);
		
		return salaryVO;
	}


	private int calcCheckedDays(int contractDay) {
		
		int days=0;
		
		for(int i=0;i<contractDay;i++) {
			LocalDate checkDate= work_start_date.plusDays(i);
			for(int j=0;j<checked_days.length;j++) {
				if(checkDate.getDayOfWeek().toString().equals(checked_days[j])) {
				days++;
			}
			}
		}
		return days;
	}
	
	private int calcWorkTime() {
		
		int start_time=work_start_time.getHour();
		int end_time=work_end_time.getHour();
		
		int workTime = 24 - (start_time - end_time);
		if(work_start_date.getDayOfMonth()<work_end_date.getDayOfMonth()
				|| work_start_date.equals(work_end_date)
				|| work_start_date.getMonthValue()<work_end_date.getMonthValue()
				|| work_start_date.getYear()<work_end_date.getYear()){
				workTime = workTime % 24;
		}
		return workTime;
	}
	
	private String calcChecked_days(String[] checked_days) {
		
		StringBuilder full_days=new StringBuilder();
		for(int i=0;i<checked_days.length;i++) {
			
			if(i==checked_days.length-1) {
				full_days.append(checked_days[i]);
			}else {
				full_days.append(checked_days[i]+",");
			}
		}
		
		return full_days.toString();
	}
	
	public static String transDays(String checked_days) {
		StringBuilder complete=new StringBuilder();
		String[] transArr=checked_days.split(",");
		for (int i=0;i<transArr.length;i++) {
			transArr[i]=transArr[i].replace("MONDAY", "월");
			transArr[i]=transArr[i].replace("TUESDAY", "화");
			transArr[i]=transArr[i].replace("WEDNESDAY", "수");
			transArr[i]=transArr[i].replace("THURSDAY", "목");
			transArr[i]=transArr[i].replace("FRIDAY", "금");
			transArr[i]=transArr[i].replace("SATURDAY", "토");
			transArr[i]=transArr[i].replace("SUNDAY", "일");
		}
		for (int i=0;i<transArr.length;i++) {
			if(i==transArr.length-1) {
				complete.append(transArr[i]);
			}else {
				complete.append(transArr[i]+",");
			}
		}
		
		return complete.toString();
	}

}