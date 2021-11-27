select * FROM cast;

INSERT INTO cast(cast_ID, category, cast_date, cast_time, cast_name, cast_platform, seller, mem_id, shopping_link, hit)
SELECT 
101 + LEVEL, 
'카테고리'|| LEVEL, 
'2021-02-04',
'10:00',
'쇼핑방송' || LEVEL, 
'플랫폼'|| LEVEL,
'판매자', 
'관리자',
'https://shoppinglive.naver.com/home',
0
FROM dual
CONNECT BY LEVEL <=300;

COMMIT;