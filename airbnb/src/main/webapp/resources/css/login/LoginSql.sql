SELECT * FROM tbl_user order by uno DESC;

SELECT ROWNUM, tbl_user.* FROM tbl_user;

SELECT ROWNUM, tbl_user.* FROM tbl_user ORDER BY uno DESC; --�ֽż�

SELECT ROWNUM, t_user.*
FROM (SELECT * FROM tbl_user order by uno DESC) t_user
WHERE ROWNUM BETWEEN 6 AND 10;

SELECT * FROM(
    SELECT ROWNUM num, tbl_user.*
    FROM (SELECT * FROM  tbl_user ORDER BY uno DESC) tbl_user
    )
WHERE num BETWEEN 6 AND 10;

SELECT * FROM(SELECT ROWNUM num, TBL_USER.* FROM
(SELECT id as a, id from TBL_USER group by id ORDER BY a DESC) TBL_USER)
WHERE num BETWEEN 1 AND 10;

CREATE TABLE TBL_USER (
    uno number(10) ,
    id varchar2(50) not null,
    pwd varchar2(100) not null,
    name varchar2(20) not null,
    email varchar2(50) not null,
    tel varchar2(50) not null,
    enabled char(1) default '1',
    sessionkey varchar(50),
    sessionlimit date,
    jip varchar(50),
    address varchar(100),
    dtaddress varchar(100),
    primary key (uno)
   );

CREATE SEQUENCE seq_USER;

create table TBL_USER_ROLE (
    UNO       number(10) NOT NULL,  --�Ϲ� �����
    ROLE_UNO  varchar(50) NOT NULL,  --���� �����
    constraint fk_USER_ROLE FOREIGN KEY ( UNO ) REFERENCES TBL_USER ( UNO )
    ON DELETE CASCADE ENABLE,
    constraint pk_USER_ROLE PRIMARY KEY (UNO, ROLE_UNO) --2����� pk
);

ALTER TABLE TBL_USER_ROLE
ADD CONSTRAINT FK_USER_ROLE FOREIGN KEY(UNO)
REFERENCES TBL_USER(UNO)
ON DELETE CASCADE ENABLE;

CREATE USER VirtualAirTravel IDENTIFIED BY 1234;
GRANT connect, resource, dba TO VirtualAirTravel;

DROP TABLE TBL_USER_ROLE;

---------------------------------------


insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'admin', '1234', '1', '����', 'leehjcap1@gmail.com', '010-1234-5678');

insert into TBL_USER_ROLE (UNO, ROLE_UNO) values (1, 'ROLE_USER');
insert into TBL_USER_ROLE (UNO, ROLE_UNO) values (1, 'ROLE_ADMIN');

insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'guest1', '1234', '1', '�Խ�Ʈ1', 'leehjcap2@gmail.com', '010-5555-5678');
insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'guest2', '1234', '1', '�Խ�Ʈ2', 'leehjcap3@gmail.com', '010-6666-5678');
insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'guest3', '1234', '1', '�Խ�Ʈ3', 'leehjcap5@gmail.com', '010-7777-5678');
insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'guest4', '1234', '1', '�Խ�Ʈ4', 'leehjcap6@gmail.com', '010-8888-5678');
insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'guest5', '1234', '1', '�Խ�Ʈ5', 'leehjcap7@gmail.com', '010-9999-5678');
insert into TBL_USER_ROLE (UNO, ROLE_UNO) values (2, 'ROLE_USER');


select * from TBL_USER where name='�̸�' AND enabled != '0';

select id from TBL_USER where name = '����' and email = 'leehjcap1@gmail.com' and enabled != '0';


alter table TBL_USER add sessionkey varchar(50);
alter table TBL_USER add sessionlimit date;

alter table TBL_USER add jip varchar(50);
alter table TBL_USER add address varchar(100);
alter table TBL_USER add dtaddress varchar(100);
