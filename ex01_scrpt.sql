/* 코드로 배우는 스프링 프로젝트 스크립트 */

create sequence seq_board;

create table tbl_board (
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_board add constraint pk_board
primary key (bno);

insert into tbl_board (
    bno
    , title
    , content
    , writer
) values (
    seq_board.nextval
    , 'test 제목'
    , 'test 내용'
    , 'user00'
);

commit;