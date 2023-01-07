#MySQL
## 게시판 댓글 테이블
```sql
CREATE TABLE tbl_reply(
	rno int PRIMARY KEY AUTO_INCREMENT, -- PK
    bno int NOT NULL, -- 보고있는 글번호(FK)
    reply varchar(1000) NOT NULL, -- 댓글 내용(content)
    replyer varchar(50) NOT NULL, -- 댓글 작성자(writer)
    replyDate TIMESTAMP DEFAULT NOW(),
    updateDate TIMESTAMP DEFAULT NOW()
);
```
## 제약 조건 추가 설정
```sql
-- table_col_const -> tbl_reply_rno_pk

ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_board 
FOREIGN KEY(bno) REFERENCES tbl_board(bno);
```

## 페이징 처리를 위한 인덱스 생성성
```sql
CREATE INDEX idx_reply ON tbl_reply(bno DESC,rno DESC);
```

## 페이징 처리를 위한 완성 Query
```sql
SELECT rno,bno,reply,replyer,replyDate,updateDate
FROM(
-- 페이징 처리를 위한 Query(원본 데이터)
	SELECT /*+INDEX(tbl_reply idx_reply)*/
    rno,bno,reply,replyer,replyDate,updateDate
	FROM tbl_reply WHERE bno = 390 AND rno > 0
    LIMIT 0,10
    )reply_paging;    
```
## 댓글 데이터 늘리기
```sql
INSERT INTO tbl_reply(bno,reply,replyer)
(SELECT bno,reply,replyer FROM tbl_reply);
SELECT COUNT(*) count FROM tbl_reply;
````

## 인덱스 삭제
```sql
ALTER TABLE tbl_reply DROP INDEX idx_reply;
```