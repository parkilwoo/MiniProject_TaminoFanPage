DROP TABLE ORDERLIST
CASCADE CONSTRAINT;

DROP SEQUENCE ORDERLIST_SEQ;

CREATE TABLE ORDERLIST(
	ORDERLIST_SEQ NUMBER(5) PRIMARY KEY,	/* 주문 SEQ */
	
	ORDER_DATE VARCHAR2(50) NOT NULL,	/* 구매 날짜 */
	ORDER_EMAIL VARCHAR2(100) NOT NULL,	/* 주문아이디*/
	ORDER_NAME VARCHAR2(50) NOT NULL,	/*주문 이름*/
	ORDER_ADDRESS VARCHAR2(500) NOT NULL,	/* 회원주소랑 다를 수 있음 */
	ORDER_PHONENUMBER VARCHAR2(50) NOT NULL, /*주문 핸드폰번호*/
	ORDER_REQUEST VARCHAR2(1000),	/* 배송 요청 사항 */
	
	ORDER_PRODUCT_SEQ NUMBER(5) NOT NULL,	/*상품seq*/
	ORDER_PRODUCT_NAME VARCHAR2(200) NOT NULL, /*상품명*/
	ORDER_PRODUCT_IMAGE VARCHAR2(100) NOT NULL,	/*상품이미지*/
	ORDER_PRODUCT_SIZE VARCHAR2(100),	/* 의류의 경우에만 기입 NULL 가능 */
	ORDER_PRODUCT_COUNT NUMBER(30) NOT NULL,	/* 제품 주문 수*/
	ORDER_PRODUCT_PRICE NUMBER(20) NOT NULL,	/*상품 가격*/
	
	ORDER_DELIVERYSTATUS NUMBER(5) NOT NULL	/* 배송중:1 , 배송완료:2 */
); 

CREATE SEQUENCE ORDERLIST_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE ORDERLIST
ADD CONSTRAINT FK_ORDER_EMAIL FOREIGN KEY(ORDER_EMAIL)
REFERENCES MEMBER(EMAIL);

ALTER TABLE ORDERLIST
ADD CONSTRAINT FK_PRODUCT_SEQ FOREIGN KEY(ORDER_PRODUCT_SEQ)
REFERENCES SHOP(PRODUCT_SEQ);

SELECT * FROM ORDERLIST;