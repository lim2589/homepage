DROP TABLE person PURGE; 

CREATE TABLE person ( 
    id       VARCHAR(10) NOT NULL,		 -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   VARCHAR(20) NOT NULL,		 -- 패스워드, 영숫자 조합 
    name    VARCHAR(20) NOT NULL, 		-- 성명, 한글 10자 저장 가능 
    phone    VARCHAR(14)     NULL, 			-- 전화번호 
    email    VARCHAR(50) NOT NULL UNIQUE,  -- 전자우편 주소, 중복 안됨 -> UNIQUE //pk와 마찬가지로 중복될수없지만 다른점은 pk는 인덱스값이있다.
    zipcode  VARCHAR(7)      NULL, -- 우편번호, 101-101 
    address1 VARCHAR(150)     NULL, -- 주소 1 
    address2 VARCHAR(50)     NULL, -- 주소 2 
    mdate    DATE        NOT NULL, -- 가입일     
    filename    VARCHAR(50) DEFAULT 'member.jpg', -- 회원 사진
    grade    CHAR(1)     DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 

create table person(

	id varchar(10) not null,
	passwd varchar(20) not null,
	name	varchar(20) not null,
	phone	varchar(20)	not null,
	email	varchar(50)




)

select * from person 





