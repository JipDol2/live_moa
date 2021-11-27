-- 21.02.09 SQL 작 
-- cast테이블 Column 데이터 모두 삭제
DELETE FROM cast; 

-- cast테이블 Column 데이터타입 변경(Column 데이터 타입 변경을 위해서는 Column에 있는 모든 값을 지워야 함) 
ALTER TABLE cast MODIFY cast_id NUMBER; 

-- product 테이블 생성 
CREATE TABLE SCOTT.PRODUCT(
    product_id number not null,
    cast_id number not null,
    product_name varchar2(50) not null,
    discount number(3) not null,
    price number not null,
    CONSTRAINT pk_product primary key(product_id),
    CONSTRAINT fk_cast foreign key(cast_id) references cast(cast_id)
);

-- cast테이블 더미 데이터 생성(INSERT) 
INSERT INTO cast(cast_ID, category, cast_date, cast_time, cast_name, cast_platform, seller, mem_id, shopping_link, hit)
SELECT 
40 + LEVEL, 
'뷰티',
'2021-02-08',
'10:00',
'쇼핑방송' || LEVEL,  
'티비온', 
'판매자', 
'관리자',
'https://shoppinglive.naver.com/home',
0
FROM dual
CONNECT BY LEVEL <=20;

SELECT * FROM cast;
COMMIT;



-- product테이블 더미 데이터 생성(INSERT) 
INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (1, 1, '제품명', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (2, 1, '제품명', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (3, 1, '제품명', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (4, 2, '제품명', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (5, 2, '제품명', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (6, 3, '제품명', 10, 20000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (7, 4, '제품명', 10, 10000)

INSERT INTO product(product_ID, cast_ID, product_name, discount, price)
VALUES (8, 2, '제품명', 10, 10000);

SELECT * FROM product;
COMMIT;

-- 댓글 테이블 생성 
CREATE TABLE comments ( -- comments에서 comment로 테이블명 수정
    comment_id number not null,
    mem_id varchar2(30) not null,
    cast_id number not null, -- cast_id 데이터 타입 변경(varchar2 >> number)
    content varchar2(500) not null,
    write_date date not null,
    CONSTRAINT pk_comment primary key(comment_id),
    CONSTRAINT fk_member_comments foreign key(mem_id) references member(mem_id),
    CONSTRAINT fk_cast_comments foreign key(cast_id) references cast(cast_id)
);

SELECT * FROM comments

--  comments 테이블 더미 데이터 생성(INSERT) 
INSERT INTO comments(comment_id, mem_id, cast_id, content, write_date)
VALUES (3, 'admin', 1, '정말이지 테스트 하기 어렵고만~', TO_DATE(SYSDATE, 'YYYY-MM-DD hh24:mi:ss'))

select * from member
INSERT INTO member(mem_id, mem_pwd, mem_name, mem_email, mem_tel)
VALUES ('admin', 123, '관리자', '123@345', '010-1234-5678') 


SELECT mem_id, content, write_date
FROM comments
WHERE cast_id=1