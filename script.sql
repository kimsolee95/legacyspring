/* ����� ���� */
create user book_ex identified by book_ex
default tablespace users
temporary tablespace temp;

/* ���� �ο� */
grant connect, dba to book_ex;