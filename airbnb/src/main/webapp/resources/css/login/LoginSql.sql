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
    primary key (uno)
   );

CREATE SEQUENCE seq_USER;

create table TBL_USER_ROLE (
    UNO       number(10) NOT NULL,  --일반 사용자
    ROLE_UNO  varchar(50) NOT NULL,  --권한 사용자
    constraint fk_USER_ROLE FOREIGN KEY ( UNO ) REFERENCES TBL_USER ( UNO ),
    constraint pk_USER_ROLE PRIMARY KEY (UNO, ROLE_UNO) --2개모두 pk
);

CREATE USER VirtualAirTravel IDENTIFIED BY 1234;
GRANT connect, resource, dba TO VirtualAirTravel;


---------------------------------------


insert into TBL_USER (uno ,id, pwd, enabled, name, email, tel)
values (SEQ_USER.nextval, 'user01', '1234', 1, '일번', 'leehjcap1@gmail.com', '010-1234-5678');

insert into TBL_USER_ROLE (UNO, ROLE_UNO) values (SEQ_ROLE.nextval, 'ROLE_USER');
insert into TBL_USER_ROLE (UNO, ROLE_UNO) values (1, 'ROLE_ADMIN');
alter table TBL_USER add sessionkey varchar(50);
alter table TBL_USER add sessionlimit date;
