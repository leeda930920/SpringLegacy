conn system/1234;

--게시판 번호(board_info_idx)	number
--게시판 이름(board_info_name) varchar2(500)

create table board_info_table(
    board_info_idx	number constraint BOARD_INFO_PK primary key,
    board_info_name varchar2(500) not null
);
insert into board_info_table VALUES (1, '자유게시판');
insert into board_info_table(board_info_idx, board_info_name) VALUES (2, '유머게시판');
insert into board_info_table VALUES (3, '정치게시판');
insert into board_info_table VALUES (4, '스포츠게시판');

select * from board_info_table;
desc board_info_table;

select board_info_idx, board_info_name
    from board_info_table
order by board_info_idx;

commit;
create table user_table(	
 user_idx number constraint USER_PK primary key,
 user_name	varchar2(50) not null,
 user_id	varchar2(100) not null,
 user_pw	varchar2(100) not null
);

select * from user_table;
commit;

/*
    Foreign key
    content_writer_idx <-- user_table(user_idx)
    content_board_idx <-- board_info_table(board_info_idx)
    
    외래키 생성
	create table 테이블명(컬럼명  타입,.... constraint 외래키명 foreign key(컬럼명) references 참조테이블명 (참조할컬럼명));
	외래키 추가
	alter table 테이블명 add constraint  외래키명 foreign key(컬럼명) references 참조테이블명 (참조할컬럼명);
*/

create table content_table(
 content_idx number constraint CONTENT_PK primary key,
 content_subject varchar2(500) not null,
 content_text long not null,
 content_file varchar2(500),
 content_writer_idx number not null
                    constraint CONTENT_FK1 references user_table(user_idx),
 content_board_idx	number not null
                    constraint CONTENT_FK2 references board_info_table(board_info_idx),
 content_date date not null
);

--sequence
create sequence user_seq
start with 0
increment by 1
minvalue 0;

create sequence content_seq
start with 0
increment by 1
minvalue 0;

SELECT user_name
FROM user_table
WHERE user_id = 'springMVC';

/*user_idx, user_name, user_id, user_pw */
INSERT INTO user_table(user_idx, user_name, user_id, user_pw)
       VALUES(user_seq.nextval, '더조은', 'spring', '1234');
INSERT INTO user_table(user_idx, user_name, user_id, user_pw)
       VALUES(user_seq.nextval, '아카데미', 'java', '3456');
INSERT INTO user_table(user_idx, user_name, user_id, user_pw)
       VALUES(user_seq.nextval, '학원', 'python', '1111');

drop sequence user_seq;
select * from user_table;
commit;

SELECT * FROM user_table
WHERE user_id = 'JAVA';

SELECT user_idx, user_name FROM user_table
WHERE user_id = 'JAVA' and user_pw='123456';

SELECT user_id, user_name FROM user_table
WHERE user_idx = 5;

UPDATE user_table
   SET user_pw = '3333'
 WHERE user_idx = '4';

select * from content_table;
commit;

INSERT INTO
content_table(content_idx, content_subject, content_text, content_file, content_writer_index, content_board_idx, content_date)
VALUES(content_seq.nextval, #{content_idx}, #{content_subject}, #{content_text}, #{content_file}, #{content_writer_index}, #{content_board_idx}, sysdate);

SELECT board_info_name
  FROM board_info_table
 WHERE board_info_idx=1;
 
SELECT board_info_name
  FROM board_info_table
 WHERE board_info_idx=2;
 
SELECT board_info_name
  FROM board_info_table
 WHERE board_info_idx=3;

SELECT board_info_name
  FROM board_info_table
 WHERE board_info_idx=4;

/*
-- 글번호           제목           작성자         작성날짜
  content_idx   content_subject  user_name   content_date
*/

SELECT c.content_idx, c.content_subject, u.user_name content_writer_name, 
TO_CHAR(c.content_date, 'YYYY-MM-DD') content_date
  FROM content_table c, user_table u
 WHERE c.content_writer_idx = u.user_idx
   AND c.content_board_idx = 1
ORDER BY c.content_idx desc;

-- 현재 sequence 값
SELECT content_seq.nextval FROM DUAL;
SELECT * FROM user_table;

-- 게시글 업데이트
SELECT * FROM content_table
 WHERE content_idx = 7;
 
UPDATE content_table 
   SET content_subject = '유머', content_text='유머유머유머', content_file='image01.jpg'
 WHERE content_idx = 7;
 
-- 게시글 삭제하기
DELETE FROM content_table
 WHERE content_idx = 38;

-- 페이징 처리
SELECT count(*) FROM content_table
 WHERE content_board_idx = 1;














