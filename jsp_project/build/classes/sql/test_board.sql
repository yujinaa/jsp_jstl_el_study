create table test_board(
id number(4) primary key,      --게시글 넘버링 (sequence를 얻어온다)
name varchar2(20),
title varchar2(100),
content varchar2(300),
savedate date default sysdate, --작성일( 따로 날자 지정하지 않아도 현재 시스템 날자를 자동적으로 얻어온다)
hit number(4) default 0,       --조회수(값을 넣지 않아도 자동적으로 0부터 들어오게한다)
idgroup number(4),             --댓글관련 : 원글 바로 밑에 댓글이 달리게 위치시킨다
step number(4),                -- 댓글관련 : 대댓글에 대한 처리(몇 번째 위치할건지)
indent number(4)               --댓글관련 : 들여쓰기
);
create sequence test_board_seq;   --sequence :가상의 넘버링을 붙일 수 있다. 글 번호값을  test_board_seq로 쓰겠다 