select *
from interest

SELECT *
FROM cast

INSERT INTO interest(mem_id, cast_id)
VALUES ('test01', 3)

-- I.mem_id, C.cast_id, C.category, C.cast_date, C.cast_time, C.cast_name, C.cast_platform, C.seller, C.mem_id, C.shopping_link, P.product_name, P.price, P.product_id
SELECT I.mem_id, C.cast_id, C.category, C.cast_date, C.cast_time, C.cast_name, C.cast_platform, C.seller, C.mem_id, C.shopping_link, P.product_name, P.price, P.product_id
FROM interest I 
    INNER JOIN cast C ON I.cast_id = C.cast_id 
    INNER JOIN product P ON ( C.cast_id = P.cast_id )
WHERE I.mem_id = 'admin'



SELECT *
FROM cast

SELECT MAX(product_id)
FROM product



SELECT MAX(cast_id) as cast_id
FROM cast
WHERE mem_id='admin' 

commit