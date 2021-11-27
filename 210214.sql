drop table product;
drop table comments;
drop table interest;

CREATE TABLE product(
    product_id number not null,
    cast_id number not null,
    product_name varchar2(50) not null,
    discount number(3) not null,
    price number not null,
    CONSTRAINT pk_product primary key(product_id),
    CONSTRAINT fk_cast foreign key(cast_id) references cast(cast_id) on delete cascade
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

commit

