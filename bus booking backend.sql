create database bus_booking;
use bus_booking;
create table login_admin(name varchar(15),uname varchar(15),password varchar(15),phone varchar(15),gender varchar(15),email varchar(40),primary key(uname));
create table login_user(name varchar(15),uname varchar(15),password varchar(15),phone varchar(15),gender varchar(15),email varchar(40),primary key(uname));
create table route(r_id varchar(15),src varchar(15) ,distination varchar(15),primary key(r_id));
create table bus(b_id varchar(15),b_name varchar(15),scdl_srcarr time,scdl_destarr time,dep_date date,no_of_seat int,r_id varchar(15),date_ date,time_ time,primary key(b_id),foreign key(r_id) references route(r_id) on delete cascade);
create table passenger(uname varchar(15),p_name varchar(15),age int,contact varchar(15),gender varchar(15),address varchar(15),b_id varchar(15),seat_no int,t_id varchar(15),date_ date,time_ time,foreign key(b_id) references bus(b_id) on delete cascade,foreign key(uname) references login_user(uname) on delete cascade,primary key(t_id,b_id,uname));
create table ticket(tik_price varchar(15),b_id varchar(15),primary key(b_id),foreign key(b_id) references bus(b_id) on delete cascade);
create table revi(b_id varchar(15),uname varchar(15),ratings varchar(15),ticket_id varchar(15),foreign key(b_id) references bus(b_id) on delete cascade,foreign key(uname) references login_user(uname) on delete cascade,foreign key(ticket_id) references passenger(t_id) on delete cascade,primary key(ticket_id,b_id));
drop table ticket;
drop table revi;
drop table passenger;
delete from passenger where t_id='305';
create view d as(select * from login_admin);
select * from d;
drop view d;
drop table bus;
drop table route;
drop table login_admin;
drop table login_user;
select last_insert_id(r_id) from route;
select no_of_seat from bus where b_id='2';
select max(seat_no) from passenger;
select * from route;
select * from  bus where b_id='33'  ;
select * from revi ;
select * from passenger where b_id='10'; 
select p.p_name,r.b_id,r.ratings from  revi r,passenger p where p.t_id=r.ticket_id and r.uname='b' and r.b_id='1';
select p.p_name,r.b_id,r.ratings from revi r ,passenger p where p.t_id=r.ticket_id;
insert into revi values('4','b','5');
CREATE DEFINER=`root`@`localhost` PROCEDURE `display1`(in un varchar(15))
BEGIN
select t_id,p.b_id,b.b_name,p_name,gender,src,scdl_srcarr,distination,scdl_destarr,dep_date,seat_no,t.tik_price from passenger p,ticket t,bus b,route r where p.b_id=t.b_id and p.b_id=b.b_id and r.r_id=b.r_id and uname=un;
END$$
DELIMITER ;
re uname='b';
select * from route;
select * from ticket;
select * from bus ;
select * from revi;
insert into revi values('2','b','9','1086');
select * from login_admin;
select * from route;
select * from passenger where b_id='2';
truncate table passenger;
select p.uname,p.p_name,p.t_id,seat_no,t.tik_price,t.b_id,b.b_name from  passenger p,ticket t,bus b where p.b_id=t.b_id and p.uname='brijesh' and p.b_id='1' group by(p.uname);
select * from passenger where b_id='4'; 
insert into login values('b','b','b','b');
insert into route values('11','pune','agra');
insert into bus values('10','ksrtc travels','12:05','12:05','2019-01-18',8,'1',CURRENT_DATE(),CURRENT_TIME());
insert into  passenger(p_id,p_name,age,contact,gender,address,seat_no,b_id) values('3','brijesh',12,'749985','m','a-6',1,'1');
select * from bus where src='mangalore' and destination='mumbai' and dep_date='2019-02-19';
select b.b_id,b.b_name,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,b.r_id from bus b,route r where r.src='mumbai' and r.distination='mangalore' and b.dep_date='2019-01-19';
insert into ticket value('500','10');
drop table seat;
truncate table revi;
delete from  seat where t_id='1568';
select  * from passdlt;
select * from seat;
drop table passdlt;
create table seat(t_id varchar(15) unique,b_id varchar(15),seat_no int);
create table passdlt(uname varchar(15),p_name varchar(15),gender varchar(15),b_id varchar(15),seat_no int,t_id varchar(15),created_on date,time_ time);
desc seat;
truncate table passenger;
select * from revi;
DELIMITER $$
 create trigger seat_del 
 after delete on passenger
 for each row
 begin
 insert into seat values(old.t_id,old.b_id,old.seat_no);
 insert into passdlt values(old.uname,old.p_name,old.gender,old.b_id,old.seat_no,old.t_id,CURRENT_DATE(),CURRENT_TIME());
 end$$
 DELIMITER ;
 select b.b_id from route r,bus b where  r.r_id=b.r_id  and src='mumbai' and distination='nashik';
 drop trigger seat_del;
 select  b.b_id,b.b_name,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,t.tik_price,b.r_id from bus b,route r,ticket t where b.r_id=r.r_id and b.b_id=t.b_id and b.b_id in (select b.b_id from route r,bus b where  r.r_id=b.r_id  and src='mumbai' and distination='nashik');
 select b.b_id from route r,bus b where  r.r_id=b.r_id  and src='mumbai' and distination='nashik';
 select  b.b_id,b.b_name,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,t.tik_price,b.r_id from bus b,route r,ticket t where b.r_id=r.r_id and b.b_id=t.b_id and b.b_id='3';
(select b.b_id from route r,bus b where  r.r_id=b.r_id  and src='mumbai' and distination='nashik');
select  b.b_id,b.b_name,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,t.tik_price,b.r_id from bus b,route r,ticket t where b.r_id=r.r_id and b.b_id=t.b_id and b.b_id in (select b.b_id from route r,bus b where  r.r_id=b.r_id  and src='mumbai' and distination='nashik');
select  b.b_id,b.b_name,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,t.tik_price,b.r_id from bus b,route r,ticket t where b.r_id=r.r_id and b.b_id=t.b_id and b.b_id in (select b.b_id from route r,bus b where  r.r_id=b.r_id  and src='' and distination='mumbai' and b.dep_date='2019-01-17');