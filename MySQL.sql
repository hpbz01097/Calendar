-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE DATABASE cal default CHARACTER SET UTF8; 
CREATE DATABASE thuman0503 default CHARACTER SET UTF8; 

create table PAYSLIP_USER (
master_no int,
user_no int,
user_id varchar(20),
pwd varchar(20) not null,
name varchar(20) not null,
phone varchar(20) not null,
gender tinyint not null,
age smallint not null,
grade tinyint not null, 
CONSTRAINT PAYSLIP_USER PRIMARY KEY (user_no)
)

drop table PAYSLIP_USER

-- SQLINES LICENSE FOR EVALUATION USE ONLY
select * from PAYSLIP_USER

-- SQLINES LICENSE FOR EVALUATION USE ONLY
select * from PAYSLIP_USER 

insert into PAYSLIP_USER values (1.1, 'admin', '1234','사장님','01012345678', 0, 35, 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into PAYSLIP_USER values (1.4, 'aa', 'aa','명문','01000', 1, 32, 1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into PAYSLIP_USER values (1.3, 'test1', '123456','테스트','01087654321', 0, 29, 1)

--insert into PAYSLIP_USER values (5,1 '김연준2', '123456','김연준2','01087654321', 0, 29, 0)
--insert into PAYSLIP_USER values (5,2 '김연준2', '123456','김연준2','01087654321', 0, 29, 0)

update User set grade = 1 where user_no > 1



-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table SCHEDULE (
user_no int,
schedule_no int,
name varchar(20) not null,
work_start_time varchar(20) not null,
work_end_time varchar(20) not null,
work_start_date varchar(20) not null,
work_end_date varchar(20) not null,
salary int default 0
)

drop table SCHEDULE

-- SQLINES LICENSE FOR EVALUATION USE ONLY
select * from SCHEDULE
delete from SCHEDULE where schedule_no = 9

select u.user_no , u.name , u.phone , u.grade,s.salary from PAYSLIP_USER u,schedule s
where u.user_no=s.user_no

insert into SCHEDULE values (3, 1,'테스트','10:30:00', '18:30:00' ,'2022-11-01','2022-11-01',0);
insert into SCHEDULE values (2, 2,'신명문','09:00:00', '18:00:00','2022-11-04','2022-11-04',0);
insert into SCHEDULE values (3, 3,'테스트','10:30:00', '18:30:00','2022-11-07','2022-11-07',0);
insert into SCHEDULE values (2, 4,'신명문','10:30:00', '18:30:00','2022-11-07','2022-11-07',0);
insert into SCHEDULE values (1, 5,'사장님','09:00:00', '18:00:00','2022-11-12','2022-11-12',0);
insert into SCHEDULE values (2, 6,'신명문','09:00:00', '18:00:00','2022-11-13','2022-11-13',0);
insert into SCHEDULE values (2, 7,'신명문','10:30:00', '18:30:00','2022-11-17','2022-11-20',0);
insert into SCHEDULE values (1, 8,'사장님','09:00:00', '18:00:00','2022-11-19','2022-11-19',0);


update SCHEDULE set work_end_date = '2022-11-01T18:30:00' where user_no = 3 and work_start_date = '2022-11-01T10:30:00'
-- SQLINES LICENSE FOR EVALUATION USE ONLY
select max(User_NO) from SCHEDULE

update SCHEDULE set work_end_date = '2022-11-17T10:30:00' where user_no = 2 and work_start_date = '2022-11-17T10:30:00'

-- SQLINES LICENSE FOR EVALUATION USE ONLY
select A.user_no, name, B.work_start_date, B.work_end_date from PAYSLIP_USER A, SCHEDULE B WHERE A.user_no = B.user_no

-- 2021-07-13T07:00:00

--	select * from PAYSLIP_USER where user_no = 3

		select A.user_no, 
		         A.name, 
		       B.schedule_no,  
		       B.work_start_date, 
		       B.work_end_date, 
		       B.work_start_time, 
		       B.work_end_time 
		from PAYSLIP_USER A, SCHEDULE B 
		WHERE A.user_no = B.user_no
		order by schedule_no desc;
		
		select max(user_no) as user_no from PAYSLIP_USER
				select max(schedule_no) as schedule_no from SCHEDULE
				
				
				
				delete [T_name] from [PAYSLIP_USER] as [T_name] JOIN [SCHEDULE] on [user_no]  where [조건문]
				
				
						select u.user_no , u.name , u.phone , u.grade,SUM(s.salary) as salary 
		from PAYSLIP_USER u,schedule s
		where u.user_no=s.user_no
		group by u.user_no;

		
select u.user_no , u.name , u.phone , u.grade, ifnull(SUM(s.salary),0) as salary 
		from PAYSLIP_USER u LEFT OUTER JOIN schedule s
		on u.user_no=s.user_no
		group by u.user_no
		order by u.user_no asc;
