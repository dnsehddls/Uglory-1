-- PRODUCT 테이블 SEQUENCE
CREATE SEQUENCE SEQ_OPTION_NO NOCACHE;

CREATE SEQUENCE SEQ_P_ORDER_CD NOCACHE;

SELECT * FROM PRODUCT;
SELECT * FROM OPTION_TB;
SELECT * FROM OPTION_TYPE;

SELECT * FROM PRODUCT_ORDER;
select * from PRODUCT_PAY;

SELECT * FROM CART;
SELECT * FROM MEMBER;

SELECT * FROM REVIEW;

SELECT * FROM PRODUCT_ORDER
WHERE MEMBER_NO = 6;

SELECT P_CD, PRODUCT_NM, PRODUCT_PRICE, PRODUCT_INFO, PRODUCER, ORIGIN, NVL((SELECT ROUND(AVG(STAR_RATING/2),1) FROM REVIEW), 0 )
FROM PRODUCT
JOIN FARM USING(FARM_NO)
JOIN REVIEW USING(P_CD)
WHERE P_CD = 3;

SELECT P.P_CD, P.PRODUCT_NM, P.PRODUCT_PRICE, FARM.PRODUCER, FARM.ORIGIN, P.PRODUCT_INFO,
ROUND((((SELECT SUM(STAR_RATING) FROM REVIEW R4 WHERE R4.P_CD=P.P_CD) / (SELECT COUNT(*) FROM REVIEW R5 WHERE R5.P_CD=P.P_CD))/2),1),
COUNT(REVIEW.REVIEW_NO)
FROM PRODUCT P
JOIN FARM ON(FARM.FARM_NO = P.P_CD)
JOIN REVIEW ON(REVIEW.P_CD = P.P_CD)
WHERE P.P_CD = 1
GROUP BY P.P_CD, P.PRODUCT_NM, P.PRODUCT_PRICE, FARM.PRODUCER, FARM.ORIGIN, P.PRODUCT_INFO, REVIEW.STAR_RATING, REVIEW.REVIEW_NO

SELECT PRODUCT_NM, P_CD
FROM PRODUCT

SELECT ROUND((((SELECT SUM(STAR_RATING) FROM REVIEW R4 WHERE R4.P_CD=P.P_CD) / (SELECT COUNT(*) FROM REVIEW R5 WHERE R5.P_CD=P.P_CD))/2),1)
FROM PRODUCT P
WHERE P.P_CD = 1
--GROUP BY REVIEW.REVIEW_NO , REVIEW.STAR_RATING;

SELECT COUNT(*)
FROM REVIEW
WHERE P_CD = 1;

SELECT * FROM OPTION_TB;

SELECT OPTION_CD, OPTION_NM, OPTION_PRICE, PRODUCT_NM, P_CD, P_CATEGORY.P_CATEGORY_NO;

SELECT * FROM OPTION_TYPE;

select * from  product_pay;
select * from PRODUCT_ORDER;

select * from PRODUCT;

SELECT PRODUCT_NM
FROM OPTION_TB 
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE OPTION_NO IN (1,2,5,6);

		SELECT P.P_CD, PRODUCT_NM, PRODUCT_PRICE, PRODUCT_INFO, PRODUCER, ORIGIN, PRODUCT_ST, IMG_ROOT
		FROM PRODUCT P
		JOIN FARM USING(FARM_NO)
		LEFT JOIN PRODUCT_IMG I ON(P.P_CD = I.P_CD)
		WHERE P.P_CD = 2;

        SELECT IMG_ROOT
        FROM PRODUCT_IMG
        JOIN PRODUCT USING(P_CD)
        WHERE P_CD =2;



SELECT * FROM OPTION_TB
WHERE P_ORDER_CD = '20220722-002';

SELECT * FROM PRODUCT_PAY;
SELECT * FROM PRODUCT_ORDER;