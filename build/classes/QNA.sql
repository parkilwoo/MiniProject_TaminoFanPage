DROP TABLE STORE_QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE STORE_QNA_SEQ;

CREATE TABLE STORE_QNA(
	QNA_SEQ NUMBER(5) PRIMARY KEY,
	
	QNA_PRODUCT_SEQ NUMBER(5) NOT NULL,
	
	QNA_TITLE VARCHAR2(200) NOT NULL,
	QNA_CATEGORY VARCHAR2(50) NOT NULL,
	QNA_CONTENT VARCHAR2(2000) NOT NULL,
	QNA_WDATE DATE NOT NULL,
	QNA_EMAIL VARCHAR2(100) NOT NULL,
	
	QNA_DEL NUMBER(5) NOT NULL,
	
	QNA_REF NUMBER(8) NOT NULL,
	QNA_STEP NUMBER(8) NOT NULL,
	QNA_DEPTH NUMBER(8) NOT NULL,
	
	QNA_PARENT NUMBER(8) NOT NULL
);

CREATE SEQUENCE STORE_QNA_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE STORE_QNA
ADD CONSTRAINT FK_QNA_EMAIL FOREIGN KEY(QNA_EMAIL)
REFERENCES MEMBER(EMAIL);

ALTER TABLE STORE_QNA
ADD CONSTRAINT FK_QNA_PRODUCT_SEQ FOREIGN KEY(QNA_PRODUCT_SEQ)
REFERENCES SHOP(PRODUCT_SEQ);


SELECT * FROM STORE_QNA;

 SELECT QNA_SEQ, QNA_PRODUCT_SEQ, QNA_TITLE, QNA_CATEGORY, QNA_CONTENT, QNA_WDATE, QNA_EMAIL, QNA_DEL, 
 QNA_REF, QNA_STEP, QNA_DEPTH 
FROM ( SELECT ROW_NUMBER() OVER(ORDER BY QNA_WDATE DESC) AS RNUM, 
QNA_SEQ, QNA_PRODUCT_SEQ, QNA_TITLE, QNA_CATEGORY, QNA_CONTENT, QNA_WDATE, QNA_EMAIL, QNA_DEL,
QNA_REF, QNA_STEP, QNA_DEPTH
FROM STORE_QNA WHERE 1=1)
WHERE QNA_CATEGORY LIKE '%%' AND QNA_WDATE LIKE '%2019%'

