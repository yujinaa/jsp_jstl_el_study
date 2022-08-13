create table test_board(
id number(4) primary key,      --�Խñ� �ѹ��� (sequence�� ���´�)
name varchar2(20),
title varchar2(100),
content varchar2(300),
savedate date default sysdate, --�ۼ���( ���� ���� �������� �ʾƵ� ���� �ý��� ���ڸ� �ڵ������� ���´�)
hit number(4) default 0,       --��ȸ��(���� ���� �ʾƵ� �ڵ������� 0���� �������Ѵ�)
idgroup number(4),             --��۰��� : ���� �ٷ� �ؿ� ����� �޸��� ��ġ��Ų��
step number(4),                -- ��۰��� : ���ۿ� ���� ó��(�� ��° ��ġ�Ұ���)
indent number(4)               --��۰��� : �鿩����
);
create sequence test_board_seq;   --sequence :������ �ѹ����� ���� �� �ִ�. �� ��ȣ����  test_board_seq�� ���ڴ� 