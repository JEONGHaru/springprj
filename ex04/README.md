## 게시판 리스트
```sql
SELECT bno,title,content,writer,regDate,updateDate 
FROM tbl_board;
```

## 댓글 개수
```sql
SELECT COUNT(*) FROM tbl_reply
WHERE bno = 1;
```

## 서브쿼리를 이용해서 위에 것을 합친다
```sql
SELECT bno,title,content,writer,regDate,updateDate,
(
	SELECT COUNT(*) FROM tbl_reply r
	WHERE b.bno =r.bno 
) replyCnt
FROM tbl_board b;
```

## replyCnt 컬럼추가
### 데이터가 많아지면 처리 속도가 저하
### 해결방법: 서브쿼리를 컬럼으로 바꿔서 사용
```sql
ALTER TABLE tbl_board
ADD (replyCnt INT DEFAULT 0);
-- 댓글 데이터가 이미 있으면 데이터를 추가
UPDATE tbl_board b
SET replyCnt =(
	SELECT COUNT(rno) FROM tbl_reply r
	WHERE b.bno =r.bno
);
```

## 댓글 등록
### 댓글 테이블에 insert를 한다
```sql
INSERT INTO tbl_reply(bno,reply,replyer)
VALUES(1,"테스트","홍길동");
```

## 게시판 테이블에 update cnt-> replyCnt + 1(bno가 같은것)
```sql
UPDATE tbl_board 
SET replyCnt = replyCnt + 1
WHERE bno = 1;
```

## list(서브쿼리가 사라지고 속도가 빨라진다)
```sql
SELECT bno,title,content,writer,regDate,updateDate,replyCnt
FROM tbl_board b;
```

## 댓글을 delete를 한다
DELETE FROM tbl_reply
WHERE rno = 761;
```

## 게시판 테이블에 update cnt-> replyCnt - 1(bno가 같은것)
```sql
UPDATE tbl_board
SET replyCnt = replyCnt -1
WHERE bno = 1;
```