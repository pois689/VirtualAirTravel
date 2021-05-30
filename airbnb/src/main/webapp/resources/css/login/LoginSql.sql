CREATE TABLE TBL_USER (
    uno number(10) default seq_user,
    id varchar2(50) not null,
    pwd varchar2(100) not null,
    name varchar2(20) not null,
    email varchar2(50) not null,
    tel varchar2(50) not null,
    enabled char(1) default 1,
    primary key (uno)
   )
   
CREATE SEQUENCE seq_user;

CREATE USER VirtualAirTravel IDENTIFIED BY 1234;
GRANT connect, resource, dba TO VirtualAirTravel;