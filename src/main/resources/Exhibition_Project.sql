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
-- 1. exhibitionData table 생성
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
DP_VIEWCHARGE varchar2(4000),
DP_ART_PART	varchar2(300),
DP_ART_CNT varchar2(300),
DP_ARTIST varchar2(4000),
DP_VIEWPOINT clob,
DP_INFO	clob,
DP_MAIN_IMG	varchar2(200),
DP_LNK varchar2(100)
);

-- 2. 잘 들어왔는지 확인
select * from exhibitionData; 

-- 3. 필요한 컬럼의 데이터 중 null 값인 부분 수정
-- (3-1. dp_viewtime, dp_viewcharge / 3-2. dp_sponsor, dp_viewpoint)
-- 3-1. 관람시간(운영시간) 정보 추가, 요금 정보 전부 '무료'로 수정 후 고유번호가 707인 전시회만 '유료'로 변경
UPDATE exhibitionData SET dp_viewtime = '[월요일 휴관]<br>
[하절기 (3월 ~ 10월)] 화~금 10:00~20:00 (토·일·공휴일 19:00까지)<br>
[동절기 (11월 ~ 2월)] 화~금 10:00~20:00 (토·일·공휴일 18:00까지)
' WHERE dp_viewtime is null ;

UPDATE exhibitionData SET dp_viewcharge = '유료' WHERE dp_viewcharge IS NULL;
UPDATE exhibitionData SET dp_viewcharge = '유료' WHERE dp_viewcharge = '무료';

-- 3-2. 주최 및 후원 null 값 '-'로 변경, 관람 포인트 null 값 '-' 로 변경
UPDATE exhibitionData SET dp_sponsor = '-' WHERE dp_sponsor is null ;
UPDATE exhibitionData SET dp_viewpoint = '-' WHERE dp_viewpoint is null ;

-- 4. 요금정보가 유료인 고유번호 707 전시회를 위해 기본이 0인 성인, 청소년, 아동 요금 컬럼 추가
ALTER TABLE exhibitionData ADD dp_charge_adult number(5) DEFAULT 17000 NOT NULL;
ALTER TABLE exhibitionData ADD dp_charge_teen number(5) DEFAULT 15000 NOT NULL;
ALTER TABLE exhibitionData ADD dp_charge_child number(5) DEFAULT 12000 NOT NULL;

-- 5. 2023-04-02 전시종료일자보다 늦는 전시회 정보 (우리가 사용하는 데이터) 조회.. 잘 들어왔는지 
-- (여기서 dp_subname, dp_hompage, dp_event, dp_art_cnt, dp_lnk 컬럼은 실질적으로 사용 안 하기 때문에, 
-- null값 있어도 상관 없으므로 신경 안써도 됨)

SELECT * from exhibitionData 
where TO_CHAR(dp_end, 'YYYYMMDD') >= '20230402'
order by dp_end desc;



--예약 테이블
CREATE TABLE book(
id number(32) UNIQUE, --회원 고유 번호
DP_SEQ number(6), --전시회 고유 번호
user_id varchar2(40) NOT NULL, --회원 아이디
name varchar2(20) NOT NULL , --회원 이름
phone  varchar2(20) NOT NULL , --회원 전화번호
email varchar2(45) NOT NULL , --회원 이메일
peopleCount int NOT NULL, --총 인원 수
bookDate date NOT NULL, --예약 날짜
price int NOT NULL, --가격
adult int NOT NULL,
teenager int NOT NULL,
child int NOT NULL
);



