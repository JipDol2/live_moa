-- 쇼핑방송 테이블 생성 
CREATE TABLE cast(
    cast_id number not null,
    category varchar2(20) not null,
    cast_date varchar2(20) not null, -- 방송일자
    cast_time varchar2(10) not null, -- 방송시간 
    cast_name varchar2(100) not null,
    cast_platform varchar2(20) not null,
    seller varchar2(20) not null,
    mem_id varchar2(30) not null, -- 회원 아이디를 로직으로 넣어주기
    shopping_link varchar2(200), -- 추가 : 쇼핑방송 링크 컬럼
    hit number default 0 not null, -- 추가 : 조회수 컬럼 
    CONSTRAINT pk_cast primary key(cast_id) 
);

-- 제품 테이블 생성 
CREATE TABLE product(
    product_id number not null,
    cast_id number not null,
    product_name varchar2(50) not null,
    discount number(3) not null,
    price number not null,
    CONSTRAINT pk_product primary key(product_id),
    CONSTRAINT fk_cast foreign key(cast_id) references cast(cast_id) on delete cascade
);

-- 회원 테이블 생성 
CREATE TABLE MEMBER( 
    mem_id varchar2(30) not null,
    mem_pwd varchar2(30) not null,
    mem_name varchar2(20) not null,
    mem_email varchar2(100) not null,
    mem_tel varchar2(20) not null,
    constraint pk_member primary key(mem_id)
);

-- 관심 테이블 생성
CREATE TABLE interest(
    mem_id varchar2(30) not null,
    cast_id number not null, -- cast_id 데이터 타입 변경(varchar2 >> number)
    CONSTRAINT pk_interest primary key(mem_id, cast_id),
    CONSTRAINT fk_member foreign key(mem_id) references member(mem_id) on delete cascade,
    CONSTRAINT fk_cast_interest foreign key(cast_id) references cast(cast_id) on delete cascade
);

-- 댓글 테이블 생성 
CREATE TABLE comments (
    comment_id number not null,
    mem_id varchar2(30) not null,
    cast_id number not null, -- cast_id 데이터 타입 변경(varchar2 >> number)
    content varchar2(500) not null,
    write_date date not null,
    CONSTRAINT pk_comment primary key(comment_id),
    CONSTRAINT fk_member_comments foreign key(mem_id) references member(mem_id) on delete cascade,
    CONSTRAINT fk_cast_comments foreign key(cast_id) references cast(cast_id) on delete cascade
);

-- 회원가입 페이지 : 회원 등록 
INSERT INTO member(id, pwd, name, email, tel) 
VALUES('temp_ID','1234','임시','temp@temp.com','01000000000');

-- Main페이지 : 쇼핑등록하기 버튼 
INSERT INTO shopping_broadcast(cast_ID, category, cast_date, cast_name, cast_platform, seller, writer, hit, shopping_link) 
VALUES('temp_cast_ID','뷰티','2021.02.01','예쁜 화장품 팔아요','네이버','관리자',0,'화장품','https://shoppinglive.naver.com/home');

-- Main페이지 : 관심쇼핑 추가 버튼
INSERT INTO interest(id, cast_ID) 
VALUES('temp_ID','temp_cast_ID');

-- Main페이지 : 관심쇼핑 삭제 버튼
DELETE FROM interest
WHERE (id='temp_ID' AND cast_ID='temp_cast_ID');


-- Main페이지 : 쇼핑방송 목록 
    -- 기본값 : cast_date(일자) 전체, category(카테고리) 전체SCOTT.INTEREST
    SELECT cast_date, cast_name, cast_platform, seller, writer, hit, shopping_link
    FROM cast;
     
    -- 필터링 : cast_date(일자) 기준
    SELECT cast_date, cast_name, cast_platform, seller, writer, hit, shopping_link
    FROM cast
    WHERE cast_date = '2021.02.01';
    
    -- 필터링 : category(카테고리) 기준
    SELECT cast_date, cast_name, cast_platform, seller, writer, hit, shopping_link
    FROM cast
    WHERE category = '뷰티';


-- 테이블 리셋순서(외래키때문에 테이블 리셋시 삭제 순서가 정해져 있음)
drop table product;
drop table comments;
drop table interest;
drop table member;
drop table cast; 
