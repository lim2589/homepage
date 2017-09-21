CREATE TABLE img_hp ( 
  imgno   NUMBER(7)     NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  wname   VARCHAR(20)   NOT NULL,  -- 글쓴이 
  title   VARCHAR(100)  NOT NULL,  -- 제목(*) 
  content VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)   NOT NULL,  -- 비밀 번호 
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  fname	varchar(50)		default 'member.jpg',
  PRIMARY KEY (imgno)  
)
 

INSERT INTO img_hp(imgno, wname, title, content, passwd, wdate,fname)  
VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img_hp), 
'왕눈이', '제목', '내용', '123', sysdate,'member.jpg'); 

select * from img_hp