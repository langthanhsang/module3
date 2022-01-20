create database traval;
create table traval.loaitua(
id_loaitour int auto_increment,
maloai varchar(10),
tenloajtour varchar(50),
constraint pk_loaitour primary key (id_loaitour,maloai)
);
create table thanhpho(
id_thanhpho int auto_increment primary key,
tenthanhpho varchar(50));

create table khachhang(
id_tenkhachhang int auto_increment primary key,
ten_khachhhang varchar (50) not null,
socancuoc varchar(10) not null,
namsinh date,
id_thanhpho int,
foreign key (id_diemden) references diemden(id_diemden));

create table diemden(
id_diemden int auto_increment primary key,
tendiemden varchar(50) not null,
mota varchar(255) not null,
giatrungbinh double,
id_thanhpho int,
foreign key (id_thanhpho) references thanhpho(id_thanhpho));

set foreign_key_checks =0;
create table tour(
id_tour int auto_increment primary key,
gia_diem_den double,
ngaybatdau date,
ngayketthuc date,
maloai varchar(10),
id_loaitour int,
foreign key (id_loaitour) references loaitua(id_loaitour),
foreign key(maloai) references loaitua(maloai));

create table hoadondattour(
id_hoadon int auto_increment primary key,
trangthai varchar(50) not null,
id_tour int,
id_khachhang int,
foreign key (id_tour) references tour(id_tour),
foreign key(id_tenkhachhang) references khachhang(id_tenkhachhang));

insert into `traval`.`loaitua`(`maloai`,`tenloajtour`)
value('loai1','motngay'),
	('loai2','haingay');
    
    insert into thanhpho(tenthanhpho)values('HA NOI');
    insert into thanhpho(tenthanhpho)values('HAI PHONG');
    insert into thanhpho(tenthanhpho)values('SAPA');
    insert into thanhpho(tenthanhpho)values('DA NANG');
    insert into thanhpho(tenthanhpho)values('HCM');
    
   -- insert into khachhang(ten_khachhang,socancuoc,namsinh,id_thanhpho)
--    values(
--     
    insert into diemden(tendiemden,mota,giatrungbinh,id_thanhpho)
    values('HANOI','dep',5000000.0,1);
    
    insert into diemden(tendiemden,mota,giatrungbinh,id_thanhpho)
    values('danang','binh thuong',6000000.0,2);
    insert into diemden(tendiemden,mota,giatrungbinh,id_thanhpho)
    values('hcm','dep',7000000.0,3);
    insert into diemden(tendiemden,mota,giatrungbinh,id_thanhpho)
    values('lao cai','xau',3000000.0,4);
    
    
    insert into tour(gia_diem_den ,ngaybatdau ,ngayketthuc,maloai)
    values
    ('1000000','2015-01-01','2015-01-02',1),
    ('2000000','2015-01-03','2015-01-05',1),
    ('3000000','2015-01-02','2015-01-04',1),
    ('4000000','2015-01-04','2015-01-05',1),
    ('5000000','2015-01-03','2015-01-03',1),
    ('6000000','2015-01-02','2015-01-03',1),
    ('7000000','2015-01-04','2015-01-06',1),
    ('8000000','2015-01-03','2015-01-04',1),
    ('9000000','2015-01-03','2015-01-03',1),
    ('10000000','2015-01-01','2015-01-02',1);
    
    