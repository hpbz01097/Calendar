-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE DATABASE cal default CHARACTER SET UTF8; 
CREATE DATABASE thuman0503 default CHARACTER SET UTF8; 


create table PAYROLL_USER (
user_no int,
user_id varchar(20),
pwd varchar(20) not null,
name varchar(20) not null,
phone varchar(20) not null,
gender tinyint not null,
age smallint not null,
grade tinyint not null, 
CONSTRAINT PAYROLL_USER PRIMARY KEY (user_no)
)

-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table PAYROLL_SCHEDULE (
user_no int,
schedule_no int,
name varchar(20) not null,
work_start_time varchar(20) not null,
work_end_time varchar(20) not null,
work_start_date varchar(20) not null,
work_end_date varchar(20) not null,
reg_date datetime,
update_date datetime,
constraint PAYROLL_USER foreign key(user_no) references PAYROLL_USER(user_no),
PRIMARY KEY (user_no, schedule_no, work_start_time, work_end_time, work_start_date, work_end_date)
)

create table PAYROLL_SALARY(
user_no int,
schedule_no int,
worktime int,
totalWorktime int,
workDay int,
salary int default 0,
pay int default 9160,
CONSTRAINT PAYROLL_SCHUDULE foreign key(user_no,schedule_no) references PAYROLL_SCHEDULE(user_no,schedule_no),
PRIMARY KEY (user_no, schedule_no)
)



drop table PAYROLL_USER
-- SQLINES LICENSE FOR EVALUATION USE ONLY
select * from PAYROLL_USER
-- SQLINES LICENSE FOR EVALUATION USE ONLY
select * from PAYROLL_USER 
insert into PAYROLL_USER values (1, 'admin', '1234','사장님','01012345678', 0, 35, 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into PAYROLL_USER values (4, 'aa', 'aa','명문','01000', 1, 32, 1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into PAYROLL_USER values (3, 'test1', '123456','테스트','01087654321', 0, 29, 1)

--insert into PAYROLL_USER values (5,1 '김연준2', '123456','김연준2','01087654321', 0, 29, 0)
--insert into PAYROLL_USER values (5,2 '김연준2', '123456','김연준2','01087654321', 0, 29, 0)

update User set grade = 1 where user_no > 1



insert into PAYROLL_SCHEDULE values (3, 1,'테스트','10:30:00', '18:30:00' ,
'2022-11-01','2022-11-01',now(),now());
select now() from dual
select sysdate() from dual



insert into PAYROLL_SALARY values (1,1,1,1,1,9160,9160);
insert into PAYROLL_SALARY values (1,2,1,1,1,9160,9160);
insert into PAYROLL_SALARY values (1,3,1,1,1,9160,9160);
insert into PAYROLL_SALARY values (1,3,2,3,4,9160,9160);

update PAYROLL_SCHEDULE set update_date = sysdate() where user_no=4 and schedule=

drop table PAYROLL_SCHEDULE
drop table PAYROLL_SALARY
drop table PAYROLL_USER

select * from PAYROLL_SCHEDULE
select * from PAYROLL_SALARY
select * from PAYROLL_USER 
--사원 급여 리스트(일괄)
select u.user_no as user_no, u.name as name, u.phone as phone,
ifnull(FORMAT(SUM(sal.salary), 0),0) as salary,
concat(ifnull(SUM(sal.totalWorktime), 0),'시간') as totalWorktime,
concat(ifnull(SUM(sal.workday),0),'일') as workDay
		from PAYROLL_USER u 
		LEFT OUTER JOIN PAYROLL_SCHEDULE s
		on u.user_no=s.user_no
		LEFT OUTER JOIN PAYROLL_SALARY sal
		on s.schedule_no=sal.schedule_no
		group by u.user_no
		order by u.user_no asc;
--사원 급여 리스트(상세)
select sal.user_no as user_no, u.name as name,
	DATE_FORMAT(sche.reg_date, "%Y-%m-%d %T") as reg_date,
	DATE_FORMAT(sche.update_date, "%Y-%m-%d %T") as update_date,
	concat(ifnull(sal.worktime,0),'시간') as workTime, concat(ifnull(sal.totalWorktime, 0),'시간') as totalWorktime,
	concat(ifnull(sal.workDay,0),'일') as workDay, concat(FORMAT(ifnull(sal.salary,0), 0),'원') as salary,concat(FORMAT(sal.pay,0),'원') as pay,
	concat(FORMAT(sal.pay*sal.workTime, 0),'원') as dayPay
	from PAYROLL_SCHEDULE sche,PAYROLL_SALARY sal,PAYROLL_USER u
	where sche.user_no=sal.user_no and sche.schedule_no=sal.schedule_no
	and sal.user_no=4
	group by sal.schedule_no
	order by sal.schedule_no

	select sal.user_no as user_no, u.name as name,
	DATE_FORMAT(sche.reg_date, "%Y-%m-%d %T") as reg_date,
	DATE_FORMAT(sche.update_date, "%Y-%m-%d %T") as update_date,
	concat(ifnull(sal.worktime,0),'시간') as workTime, concat(ifnull(sal.totalWorktime, 0),'시간') as totalWorktime,
	concat(ifnull(sal.workDay,0),'일') as workDay, concat(FORMAT(ifnull(sal.salary,0), 0),'원') as salary,concat(FORMAT(sal.pay,0),'원') as pay,
	concat(FORMAT(sal.pay*sal.workTime, 0),'원') as dayPay
	from PAYROLL_SCHEDULE sche,PAYROLL_SALARY sal,PAYROLL_USER u
	where sche.user_no=sal.user_no and sche.schedule_no=sal.schedule_no
	and sal.user_no=4
	group by sal.schedule_no
	order by sal.schedule_no


delete from PAYROLL_SCHEDULE where user_no=3
delete from PAYROLL_SALARY
delete from PAYROLL_SALARY where schedule_no=3
drop table PAYROLL_SCHEDULE
insert INTO    PAYROLL_SALARY   VALUES (3, 5,6,100000,default)
-- SQLINES LICENSE FOR EVALUATION USE ONLY
select * from PAYROLL_SCHEDULE
delete from PAYROLL_SCHEDULE where user_no = 3

select u.user_no , u.name , u.phone , u.grade,s.salary from PAYROLL_USER u,PAYROLL_SCHEDULE s
where u.user_no=s.user_no

insert into PAYROLL_SCHEDULE values (3, 1,'테스트','10:30:00', '18:30:00' ,'2022-11-01','2022-11-01',now(),sysdate());
insert into PAYROLL_SCHEDULE values (2, 2,'신명문','09:00:00', '18:00:00','2022-11-04','2022-11-04');
insert into PAYROLL_SCHEDULE values (3, 3,'테스트','10:30:00', '18:30:00','2022-11-07','2022-11-07',0);
insert into PAYROLL_SCHEDULE values (2, 4,'신명문','10:30:00', '18:30:00','2022-11-07','2022-11-07',0);
insert into PAYROLL_SCHEDULE values (1, 5,'사장님','09:00:00', '18:00:00','2022-11-12','2022-11-12',0);
insert into PAYROLL_SCHEDULE values (2, 6,'신명문','09:00:00', '18:00:00','2022-11-13','2022-11-13',0);
insert into PAYROLL_SCHEDULE values (2, 7,'신명문','10:30:00', '18:30:00','2022-11-17','2022-11-20',0);
insert into PAYROLL_SCHEDULE values (1, 8,'사장님','09:00:00', '18:00:00','2022-11-19','2022-11-19',0);
update PAYROLL_SCHEDULE set work_end_date = '2022-11-01T18:30:00' where user_no = 3 and work_start_date = '2022-11-01T10:30:00'
-- SQLINES LICENSE FOR EVALUATION USE ONLY
select max(User_NO) from PAYROLL_SCHEDULE
update PAYROLL_SCHEDULE set work_end_date = '2022-11-17T10:30:00' where user_no = 2 and work_start_date = '2022-11-17T10:30:00'
-- SQLINES LICENSE FOR EVALUATION USE ONLY
select A.user_no, name, B.work_start_date, B.work_end_date from PAYROLL_USER A, PAYROLL_SCHEDULE B WHERE A.user_no = B.user_no
-- 2021-07-13T07:00:00
--	select * from PAYROLL_USER where user_no = 3
		select A.user_no, 
		         A.name, 
		       B.schedule_no,  
		       B.work_start_date, 
		       B.work_end_date, 
		       B.work_start_time, 
		       B.work_end_time 
		from PAYROLL_USER A, PAYROLL_SCHEDULE B 
		WHERE A.user_no = B.user_no
		order by PAYROLL_SCHEDULE_no desc;
		
		select max(user_no) as user_no from PAYROLL_USER
				select max(schedule_no) as schedule_no from PAYROLL_SCHEDULE
				
				
				
				delete [T_name] from [PAYROLL_USER] as [T_name] JOIN [PAYROLL_SCHEBULE] on [user_no]  where [조건문]
				
				
						select u.user_no , u.name , u.phone , u.grade,SUM(s.salary) as salary 
		from PAYROLL_USER u,PAYROLL_SCHEDULE s
		where u.user_no=s.user_no
		group by u.user_no;
		
select u.user_no , u.name , u.phone , u.grade, ifnull(SUM(s.salary),0) as salary 
		from PAYROLL_USER u LEFT OUTER JOIN PAYROLL_SCHEDULE s
		on u.user_no=s.user_no
		group by u.user_no
		order by u.user_no asc;
		
insert into PAYROLL_USER values (1, 'admin', '1234','사장님','01012345678', 0, 35, 0);
insert into PAYROLL_USER values (2, '정영윤', '1234','정영윤','01012345678', 0, 35, 1);
insert into PAYROLL_USER values (3, 'test1', '123456','테스트','01087654321', 0, 29, 1)
		
select * from PAYROLL_USER
select * from PAYROLL_SCHEDULE		


create table PAYROLL_SALARY(
user_no int,
schedule_no int,
worktime int,
totalWorktime int,
workDay int,
salary int default 0,
pay int default 9160,
constraint PAYROLL_SALARY primary key(user_no,schecule_no)
 )
 
create table PAYROLL_SALARY(
schedule_no int primary key,
worktime int,
totalWorktime int,
workDay int,
salary int default 0,
pay int default 9160,
user_no int,
constraint PAYROLL_USER foreign key(user_no) references PAYROLL_USER(user_no),
constraint PAYROLL_SCHEDULE foreign key(schedule_no) references PAYROLL_SCHEDULE(schedule_no)
 )
