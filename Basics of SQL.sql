create database gl;

use gl;

show databases;

create table dataofcustomer
(
custid varchar(6) primary key,
fname varchar(30),
mname varchar(30),
ltname varchar(30),
city varchar(15),
age int(10),
mobileno varchar(12),
occupation varchar(10),
dob date
);

show tables;

select * from dataofcustomer;

insert into dataofcustomer values('C00001','Ramesh','Cahndra','Sharma','Delhi',45,'9543198345','Service','1976-12-06');
insert into dataofcustomer values('C00002','Avinash','Sunder','Minha','Delhi',32,'9876532109','Service','1974-10-16');
insert into dataofcustomer values('C00003','Rahul',null,'Rastogi','Delhi',24,'9765178901','Student','1981-09-26');
insert into dataofcustomer values('C00004','Parul',null,'Gandhi','Delhi',46,'9876532109','Housewife','1976-11-03');
insert into dataofcustomer values('C00005','Naveen','Cahndra','Aedekar','Delhi',23,'8976523190','Service','1976-09-19');
insert into dataofcustomer values('C00006','Chitresh',null,'Barwe','Mumbai',18,'7651298321','Student','1992-11-06');
insert into dataofcustomer values('C00007','Amit','Kumar','Borkar','Mumbai',76,'9875189761','Service','1981-09-06');
insert into dataofcustomer values('C00008','Nisha',null,'Damle','Mumbai',43,'7954198761','Service','1975-12-03');
insert into dataofcustomer values('C00009','Abhishek',null,'Dutta','Kolkata',67,'9856198761','Service','1973-05-22');
insert into dataofcustomer values('C00010','Shankar',null,'Nair','Chennai',90,'8765489076','Service','1976-07-12');

select min(age),fname as MinimumAge from dataofcustomer;
select count(age) as CountAge from dataofcustomer;
select max(age) as MaximumAge from dataofcustomer;

select fname from dataofcustomer where age = 18;
select fname from dataofcustomer where age = 90;

select count(*) from dataofcustomer;

select count(fname) from dataofcustomer group by city;
select count(fname),city from dataofcustomer group by city;

create table account
(
acnumber varchar(6),
custid varchar(6),
bid varchar(6),
opening_balance int(7),
aod date,
atype varchar(12),
astatus varchar(10),
constraint account_number_pk primary key(acnumber),
constraint account_custid_fk foreign key(custid) references	dataofcustomer(custid)
);

show tables;

show table status;

insert into account values('A00001','C00001','B00001','1000','2012-12-15','Saving','Active');
insert into account values('A00002','C00002','B00001','1000','2012-06-12','Saving','Active');
insert into account values('A00003','C00003','B00002','1000','2012-05-17','Saving','Active');
insert into account values('A00004','C00002','B00005','1000','2013-01-25','Saving','Active');
insert into account values('A00005','C00006','B00006','1000','2012-12-17','Saving','Active');
insert into account values('A00006','C00007','B00007','1000','2010-08-12','Saving','Suspended');
insert into account values('A00007','C00007','B00001','1000','2012-10-02','Saving','Active');
insert into account values('A00008','C00001','B00003','1000','2009-11-09','Saving','Terminated');
insert into account values('A00009','C00003','B00007','1000','2008-12-15','Saving','Terminated');
insert into account values('A00010','C00004','B00002','1000','2013-03-01','Saving','Active');

select * from account;

select count(*) from account;

select count(*),astatus from account group by astatus;

select count(fname),city from dataofcustomer group by city;
select count(fname),city from dataofcustomer group by city having count(fname)>2;
select count(fname),city from dataofcustomer group by city having count(fname)= 1|4;##  they add up 1+4 is 5
select count(fname),city from dataofcustomer group by city having count(fname)<2;
select count(fname),city from dataofcustomer group by city having count(fname)!=1;

select * from account;
select count(*),astatus from account group by astatus having count(atype)=2;
select count(*),astatus from account group by astatus having count(atype)=7;
select count(*),astatus from account group by astatus having count(atype)>=2;

##aliases in sql not change in acutal data 
SELECT custid AS CustomerId, bid AS BranchId FROM account;

#### Joins ###############################################################

create table customer
(
custid varchar(6),
fname varchar(30),
mname varchar(30),
ltname varchar(30),
city varchar(15),
mobileno varchar(12),
occupation varchar(10),
dob date,
constraint cutsomer_custid_pk primary key(custid)
);

insert into customer values('C00001','Ramesh','Cahndra','Sharma','Delhi','9543198345','Service','1976-12-06');
insert into customer values('C00002','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16');
insert into customer values('C00003','Rahul',null,'Rastogi','Delhi','9765178901','Student','1981-09-26');
insert into customer values('C00004','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03');
insert into customer values('C00005','Naveen','Cahndra','Aedekar','Mumbai','8976523190','Service','1976-09-19');
insert into customer values('C00006','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06');
insert into customer values('C00007','Amit','Kumar','Borkar','Mumbai','9875189761','Service','1981-09-06');
insert into customer values('C00008','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03');
insert into customer values('C00009','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22');
insert into customer values('C00010','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12');


create table acc
(
acnumber varchar(6),
custid varchar(6),
bid varchar(6),
opening_balance int(7),
aod date,
atype varchar(12),
astatus varchar(10),
constraint account_acnumber_pk primary key(acnumber),
constraint account_accustid_fk foreign key(custid) references	customer(custid)
);

insert into acc values('A00001','C00001','B00001','1000','2012-12-15','Saving','Active');
insert into acc values('A00002','C00002','B00001','1000','2012-06-12','Saving','Active');
insert into acc values('A00003','C00003','B00002','1000','2012-05-17','Saving','Active');
insert into acc values('A00004','C00002','B00005','1000','2013-01-25','Saving','Active');
insert into acc values('A00005','C00006','B00006','1000','2012-12-17','Saving','Active');
insert into acc values('A00006','C00007','B00007','1000','2010-08-12','Saving','Suspended');
insert into acc values('A00007','C00007','B00001','1000','2012-10-02','Saving','Active');
insert into acc values('A00008','C00001','B00003','1000','2009-11-09','Saving','Terminated');
insert into acc values('A00009','C00003','B00007','1000','2008-12-15','Saving','Terminated');
insert into acc values('A00010','C00004','B00002','1000','2013-03-01','Saving','Active');

show tables;
select * from customer;
select * from acc;

select count(*) from customer;
select count(*) from acc;
##### inner join
select fname,acnumber from customer inner join acc on customer.custid = acc.custid;


#### left join (customer from above)
create table branch
(
bid varchar(6),
bname varchar(30),
bcity varchar(30),
constraint branch_bid_pk primary key(bid)
);

insert into branch values('B00001','Asaf Ali Road','Delhi');
insert into branch values('B00002','New Delhi main branch','Delhi');
insert into branch values('B00003','Delhi cantt','Delhi');
insert into branch values('B00004','Jasola','Delhi');
insert into branch values('B00005','Mahim','Mumbai');
insert into branch values('B00006','Vile parle ','Mumbai');
insert into branch values('B00007','Mandvi','Mumbai');
insert into branch values('B00008','Jadavpur','Kolkata');
insert into branch values('B00009','Kodambakkam','Chennai');


create table acc1
(
acnumber varchar(6),
custid varchar(6),
bid varchar(6),
opening_balance int(7),
aod date,
atype varchar(12),
astatus varchar(10),
constraint account_acnumber_pk primary key(acnumber),
constraint account_accustidL_fk foreign key(custid) references customer(custid),
constraint account_bid_fk foreign key(bid) references branch(bid)
);

insert into acc1 values('A00001','C00001','B00001','1000','2012-12-15','Saving','Active');
insert into acc1 values('A00002','C00002','B00001','1000','2012-06-12','Saving','Active');
insert into acc1 values('A00003','C00003','B00002','1000','2012-05-17','Saving','Active');
insert into acc1 values('A00004','C00002','B00005','1000','2013-01-25','Saving','Active');
insert into acc1 values('A00005','C00006','B00006','1000','2012-12-17','Saving','Active');
insert into acc1 values('A00006','C00007','B00007','1000','2010-08-12','Saving','Suspended');
insert into acc1 values('A00007','C00007','B00001','1000','2012-10-02','Saving','Active');
insert into acc1 values('A00008','C00001','B00003','1000','2009-11-09','Saving','Terminated');
insert into acc1 values('A00009','C00003','B00007','1000','2008-12-15','Saving','Terminated');
insert into acc1 values('A00010','C00004','B00002','1000','2013-03-01','Saving','Active');


select * from customer ### customer along with not having account
left join acc1
on customer.custid = acc1.custid;

select * from acc1 ### customer along with having account
left join customer
on acc1.custid = customer.custid;

#### Right join (customer,acc1,branch from above)
select * from acc1# all customer without acc
right join customer
on customer.custid = acc1.custid;

select * from customer ### customer along with having account
right join acc1
on acc1.custid = customer.custid;

#### Full join (customer,acc1,branch from above) not support full join directly 
select * from acc1 
full join customer 
on acc1.custid = customer.custid;
####### can use union function to run the full join concept (not having account)
select * from acc1 
left join customer 
on acc1.custid = customer.custid
union 
select * from acc1 
right join customer 
on acc1.custid = customer.custid;


#self join (create table student)
create table student
(
student_id varchar(6),
name varchar(30),
course_id varchar(30),
duration int(4)
);

insert into student values('1','Asif','2','4');
insert into student values('2','Atul','1','4');
insert into student values('1','Asif','1','4');
insert into student values('2','Atul','3','4');
insert into student values('5','Jasmin','1','4');
insert into student values('6','Adhiti','1','4');

select * from student;

# identify how many student who had done the repeated courses
select s1.student_id , s1.name 
from student as s1, student s2
where s1.student_id = s2.student_id and s1.course_id<>s2.course_id; ## <> use for not equal to sign


select s1.student_id , s1.name, s1.course_id
from student as s1, student s2
where s1.student_id = s2.student_id and s1.course_id<>s2.course_id; ## <> use for not equal to sign

### subquery (dataofcustomer) from first ..
show tables;
select * from dataofcustomer;
# create a new table and add the age which is greater than 45 from table dataofcustomers
create table dataofcustomer_for_subquery
(
custid varchar(6) primary key,
fname varchar(30),
mname varchar(30),
ltname varchar(30),
city varchar(15),
age int(10),
mobileno varchar(12),
occupation varchar(10),
dob date
);

insert into dataofcustomer_for_subquery
select * from dataofcustomer
where age>=45;

select * from dataofcustomer_for_subquery;

update dataofcustomer_for_subquery
set age = age+2
where age in (select age from dataofcustomer where age>=55) # if age above 55 just add +2 

delete from dataofcustomer_for_subquery #not working 
where age in (select age from dataofcustomer where age >= 60);

select * from dataofcustomer_for_subquery; 

select * from dataofcustomer_for_subquery
where custid in (select distinct custid from customer where age >45)