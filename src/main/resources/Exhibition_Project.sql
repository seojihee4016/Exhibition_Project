--memberInfo table 생성 쿼리
CREATE TABLE memberInfo(
id number(32) UNIQUE,
user_id varchar2(40) UNIQUE NOT NULL,
password varchar2(32) NOT NULL,
name varchar2(20) NOT NULL ,
phone  varchar2(20) NOT NULL ,
gender varchar2(2) CHECK(GENDER IN('m','f')) NOT NULL,
birthDate DATE NOT NULL ,
email varchar2(45) NOT NULL ,
 CONSTRAINT memberInfo PRIMARY KEY (user_id, email, phone)
);


