select * FROM cast;

INSERT INTO cast(cast_ID, category, cast_date, cast_time, cast_name, cast_platform, seller, mem_id, shopping_link, hit)
SELECT 
101 + LEVEL, 
'ī�װ�'|| LEVEL, 
'2021-02-04',
'10:00',
'���ι��' || LEVEL, 
'�÷���'|| LEVEL,
'�Ǹ���', 
'������',
'https://shoppinglive.naver.com/home',
0
FROM dual
CONNECT BY LEVEL <=300;

COMMIT;