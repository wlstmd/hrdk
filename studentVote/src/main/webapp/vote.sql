create table TBL_REGISTER (
NO char(1) Primary key,
Name varchar2(20) not null,
Code char(2),
School char(1),
Jumin char(13),
Major varchar2(20)
);

insert into TBL_REGISTER values ('1','강감찬','P1','1','0403153111111','전기3-1');
insert into TBL_REGISTER values ('2','유관순','P2','3','0405084222222','디자인3-4');
insert into TBL_REGISTER values ('3','이율곡','P3','2','0408243333333','전자3-6');
insert into TBL_REGISTER values ('4','이순신','P4','4','0410023444444','자동차3-7');
insert into TBL_REGISTER values ('5','김연아','P5','4','0411054555555','건축3-9');

create table TBL_PARTNER (
P_CODE char(2) Primary key,
P_CLASS varchar2(10),
P_RDATE date,
P_PARTNER varchar2(20) not null,
P_TEL1 char(3),
P_TEL2 char(4),
P_TEL3 char(4)
);

insert into TBL_PARTNER values ('P1','1반','2021-06-01','김명희','010','1111','1111');
insert into TBL_PARTNER values ('P2','4반','2021-06-01','김선희','010','2222','2222');
insert into TBL_PARTNER values ('P3','6반','2021-06-02','이명석','010','3333','3333');
insert into TBL_PARTNER values ('P4','7반','2021-06-02','서한솔','010','4444','4444');
insert into TBL_PARTNER values ('P5','9반','2021-06-02','정미경','010','5555','5555');

create table tbl_vote (
v_jumin char(13) Primary key,
v_name varchar2(20) not null,
choice_no char(1),
v_time char(4),
v_area varchar2(30),
v_confirm char(1)
);

insert into tbl_vote values ('0301013000001','김길동','1','0930','제1투표소','N');
insert into tbl_vote values ('0301014000002','이미희','2','0930','제1투표소','N');
insert into tbl_vote values ('0401013000003','박한길','3','0940','제1투표소','Y');
insert into tbl_vote values ('0401013000004','홍미화','4','0940','제1투표소','Y');
insert into tbl_vote values ('0301013000005','조민규','5','0950','제1투표소','Y');
insert into tbl_vote values ('0403014000006','최미자','4','0950','제2투표소','Y');
insert into tbl_vote values ('0504013000007','지창호','1','1000','제2투표소','Y');
insert into tbl_vote values ('0501014000008','장미라','3','1030','제2투표소','Y');
insert into tbl_vote values ('0501013000009','정문호','3','1030','제2투표소','Y');
insert into tbl_vote values ('0401014000010','강찬희','4','1100','제2투표소','Y');