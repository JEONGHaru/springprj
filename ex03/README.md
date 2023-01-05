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