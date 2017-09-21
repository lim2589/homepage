drop table guest

CREATE TABLE guest( 
  gno  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  name	  varchar(50)	not null,
  email   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  comments VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  PRIMARY KEY(gno)              -- 고유한 값, 중복 안됨    
); 

select * from guest
 
  grpno	  number		default 0,
  indent  number		default 0,
  ansnum  number		default 0,
  refnum  number		default 0
--테이블 추가
alter table guest
add (grpno number default 0,
	 indent number default 0,
	 ansnum number default 0
	)
	
	
	
	alter table memoperson
add(name varchar(50) null)


alter table guest
add (refnum number default 0)

select gno,email,grpno,indent,ansnum
from guest
order by grpno desc , ansnum

delete from memo
where indent>0





-- SEQUENCE 객체 생성 

CREATE SEQUENCE guest_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; -- create //100개까지 채워졌을때

SELECT LAST_NUMBER 
  FROM USER_SEQUENCES 
 WHERE SEQUENCE_NAME = 'guest_seq';




ALTER SEQUENCE guest_seq INCREMENT BY -103;

SELECT guest_seq.NEXTVAL FROM DUAL;


ALTER SEQUENCE guest_seq INCREMENT BY 1;




-- memo_seq.nextval: 일련번호 자동 생성하여 할당 //시퀀스객체를 이용해 일련번호 자동으로생성
--                   (MySQL은 컬럼명을 명시하지 않음). 
-- sysdate: 현재 날짜와 시간(MySQL: now()) 
--컬럼명 gno명시(mysql은 명시하지않아도된다.)
INSERT INTO guest(gno,name, email, comments, wdate) 
VALUES(guest_seq.nextval,'김길동', '오늘의 메모', '이전주 토익 시험 준비', sysdate)
 
-- select list, 자주 읽는 메모 먼저 출력  
-- DESC: Descending, ASC: Ascending 

SELECT gno, email, wdate, viewcnt, grpno, indent, ansnum
FROM memoperson  
ORDER BY gno ASC; 
 
INSERT INTO guest(gno,name, email, comments, wdate,grpno) 
VALUES(guest_seq.nextval,'정길동', '읽을 도서', '가메출판사 오라클 11g', sysdate,(select nvl(max(grpno),0) + 1 from guest)); 
 
INSERT INTO guest(gno,name, email, comments, wdate,grpno) 
VALUES(guest_seq.nextval,'박길동', '수업 복습', '메모 제작', sysdate,(select nvl(max(grpno),0) + 1 from guest)); 
 
INSERT INTO guest(gno,name, email, comments, wdate,grpno)  
VALUES(guest_seq.nextval,'임길동', '도서구입', 'JSP Web Programming', sysdate,(select nvl(max(grpno),0) + 1 from guest));  


--read

select gno,email,comments,
to_char(wdate,'yyyy-mm-dd')wdate,viewcnt
from guest
where gno = 1


--update

update memo
set 
email ='제목변경',
comments = '내용변경'
where gno = 1

delete from guest
 

select * from guest
ORDER BY gno ASC;








