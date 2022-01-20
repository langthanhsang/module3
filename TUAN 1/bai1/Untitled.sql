create database Quanly;
create table Quanly.student_manager(
 id  int auto_increment primary key,
 student_name varchar(50) not null,
 address varchar(50) not null,
 sex int not null default 1,
 age int not null check(age > 18 and age <50),
 email varchar(50) not null unique,
 phone varchar(10) not null
 );
 create table Quanly.classes(
 id_class int auto_increment primary key,
 class_name varchar(50) not null unique
 );
 
 alter table student_manager
add column classId int,
add constraint foreign key (classId) references classes(id_class);
 -- thêm cột và ràng buộc khoá ngoại-- 
insert into classes (`class_name`) value('C0821H1');
insert into classes(`class_name`) value('C0821H2');
insert into classes(`class_name`) value('C0821I1');
insert into classes(`class_name`) value('C0821I2');
insert into classes(`class_name`) value('C1021H1');
-- thêm dữ liêị của bảng student , rạng nhiều value--  
insert into `Quanly`.`student_manager` (`student_name`, `address`, `sex`, `age`, `email`, `phone`, `classId`)
 values('Luân', 'HN', '1', '28', 'luan@codegym.vn', '0326198727', '5');
insert into `Quanly`.`student_manager` (`student_name`, `address`, `age`, `email`, `phone`, `classId`) values 
('A Thanh', 'BN', 35, 'thanh@codegym.vn', '0657165727', '1');
update `Quanly`.`student_manager` set `sex`= 0 where id = 73;
update `Quanly`.`student_manager` set `sex`= 1 where age >10 and age < 23;
select * from
`Quanly`.`student_manager`;
select * from student_manager where age <28;
select `student_name`,`address` from Quanly.student_manager where age <28;
select * from student_manager where address = 'HN';
select * from student_manager where not address like 'HN';
select * from student_manager where student_name =('A%');
select * from student_manager where student_name = "Anh";
-- select * from student_manager where student_name like "% Anh";
select * from classes where class_name like "C0821H2";
delete from `Quanly`.`student_manager` where (`id` = '1');
update `Quanly`.`student_manager` set `address` = 'hello' where (`id` = 7);
UPDATE `Quanly`.`student_manager` SET `address` = 'Hello' WHERE (`id` = '7');
select * from student_manager order by student_name desc;
select * from student_manager order by age;