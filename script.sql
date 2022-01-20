/* 사용자 생성 */
create user book_ex identified by book_ex
default tablespace users
temporary tablespace temp;

/* 권한 부여 */
grant connect, dba to book_ex;