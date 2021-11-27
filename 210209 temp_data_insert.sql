-- 21.02.09 SQL �� 
-- cast���̺� Column ������ ��� ����
DELETE FROM cast; 

-- cast���̺� Column ������Ÿ�� ����(Column ������ Ÿ�� ������ ���ؼ��� Column�� �ִ� ��� ���� ������ ��) 
ALTER TABLE cast MODIFY cast_id NUMBER; 

-- product ���̺� ���� 
CREATE TABLE SCOTT.PRODUCT(
    product_id number not null,
    cast_id number not null,
    product_name varchar2(50) not null,
    discount number(3) not null,
    price number not null,
    CONSTRAINT pk_product primary key(product_id),
    CONSTRAINT fk_cast foreign key(cast_id) references cast(cast_id)
);

-- cast���̺� ���� ������ ����(INSERT) 
INSERT INTO cast(cast_ID, category, cast_date, cast_time, cast_name, cast_platform, seller, mem_id, shopping_link, hit)
SELECT 
40 + LEVEL, 
'��Ƽ',
'2021-02-08',
'10:00',
'���ι��' || LEVEL,  
'Ƽ���', 
'�Ǹ���', 
'������',
'https://shoppinglive.naver.com/home',
0
FROM dual
CONNECT BY LEVEL <=20;

SELECT * FROM cast;
COMMIT;



-- product���̺� ���� ������ ����(INSERT) 
INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (1, 1, '��ǰ��', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (2, 1, '��ǰ��', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (3, 1, '��ǰ��', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (4, 2, '��ǰ��', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (5, 2, '��ǰ��', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (6, 3, '��ǰ��', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (7, 4, '��ǰ��', 10, 10000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (8, 2, '��ǰ��', 10, 10000);

SELECT * FROM product;
COMMIT;

-- ��� ���̺� ���� 
CREATE TABLE comments ( -- comments���� comment�� ���̺�� ����
    comment_id number not null,
    mem_id varchar2(30) not null,
    cast_id number not null, -- cast_id ������ Ÿ�� ����(varchar2 >> number)
    content varchar2(500) not null,
    write_date date not null,
    CONSTRAINT pk_comment primary key(comment_id),
    CONSTRAINT fk_member_comments foreign key(mem_id) references member(mem_id),
    CONSTRAINT fk_cast_comments foreign key(cast_id) references cast(cast_id)
);

SELECT * FROM comments

--  comments ���̺� ���� ������ ����(INSERT) 
INSERT INTO comments(comment_id, mem_id, cast_id, content, write_date)
VALUES (3, 'admin', 1, '�������� �׽�Ʈ �ϱ� ��ư�~', TO_DATE(SYSDATE, 'YYYY-MM-DD hh24:mi:ss'))

select * from member
INSERT INTO member(mem_id, mem_pwd, mem_name, mem_email, mem_tel)
VALUES ('admin', 123, '������', '123@345', '010-1234-5678') 


SELECT mem_id, content, write_date
FROM comments
WHERE cast_id=1