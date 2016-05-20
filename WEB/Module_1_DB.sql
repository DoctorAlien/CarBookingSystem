create database Module_1_DB
on
(
	name=Module_1_DB,
	filename='D:\database\Module_1_DB.mdf'
);
go
use Module_1_DB;
create table t_users_base
(
	uid int not null primary key identity(1,1),
	username_ varchar(20) not null unique,
	password_ varchar(64) not null,
	name_ varchar(10) not null,
	email_ varchar(20) not null,
	mobile_ varchar(11) not null,
	is_admin int not null default 0,
	reg_time datetime not null default getdate()
);
create table t_cars_base
(
	cid int not null primary key identity(1,1),
	code_ varchar(20) not null,
	brand_ varchar(20) not null,
	type_ varchar(20) not null,
	description_ text not null
);
go
create table t_cars_book
(
	id int not null primary key identity(1,1),
	uid int not null,
	cid int not null,
	start_time datetime not null,
	end_time datetime not null,
	description_ text not null,
	create_time datetime not null default getdate(),
	constraint fk_uid foreign key(uid) references t_users_base(uid),
	constraint fk_cid foreign key(cid) references t_cars_base(cid)
);

--select * from t_users_base where username_='admin'
select distinct(type_) as type from t_cars_base where brand_='奔驰'

insert into t_cars_base values
(1000,'奔驰','小','无描述'),
(1001,'奔驰','中','无描述'),
(1002,'奔驰','大','无描述'),
(1003,'宝马','小','无描述'),
(1004,'宝马','中','无描述'),
(1005,'宝马','大','无描述')

insert into t_users_base values
('admin','111111','admin','admin@admin.com','13592830495',1,'2016-5-8')

insert into t_users_base values
('test','111111','test','test@test.com','13592830495',0,'2016-5-8')

select * from t_users_base;
select * from t_cars_base;
select * from t_cars_book;

select * from t_cars_base as base,t_cars_book as book where base.cid!=book.cid

select * from t_cars_base as base where not exists(select * from t_cars_book as book where base.cid=book.cid)

select * from t_cars_base as base where brand_='奔驰' and type_='小' and not exists(select * from t_cars_book as book where base.cid=book.cid)

--update t_cars_base set code_ ='1000',brand_='',type_='',description_='' where cid=1;

--select * from t_cars_base where brand_ like '%奔%'
--select * from t_cars_base where brand_ like '%宝%' 

--delete from t_cars_base where cid=7

select * from t_users_base where username_='admin' and password_='111111' and is_admin=1