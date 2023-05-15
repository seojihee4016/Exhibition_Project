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


-- exhibitionData table 생성 쿼리 (서울시립미술관 전시현황 전체 데이터 삽입용)
create table exhibitionData (
DP_SEQ number(6) PRIMARY KEY,
DP_NAME varchar2(200),
DP_SUBNAME varchar2(500),
DP_PLACE varchar2(80),
DP_START date,
DP_END date,
DP_HOMEPAGE varchar2(150),
DP_EVENT varchar2(150),
DP_SPONSOR varchar2(1000),
DP_VIEWTIME	varchar2(1000),
DP_VIEWCHARGE varchar2(2000),
DP_ART_PART	varchar2(300),
DP_ART_CNT varchar2(300),
DP_ARTIST varchar2(4000),
DP_VIEWPOINT clob,
DP_INFO	clob,
DP_MAIN_IMG	varchar2(200),
DP_LNK varchar2(100)
);

