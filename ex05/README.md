## 파일 이미지 테이블 작성
```sql
CREATE TABLE tbl_attach(
	fno INT PRIMARY KEY AUTO_INCREMENT,
	uuid VARCHAR(100),
    uploadPath VARCHAR(200) NOT NULL,
    fileName VARCHAR(100) NOT NULL,
    fileType TINYINT DEFAULT 0,
    bno INT NOT NULL
);
```
## 제약 조건
```sql
ALTER TABLE tbl_attach
ADD CONSTRAINT fk_board_attach
FOREIGN KEY (bno) REFERENCES tbl_board(bno);
```
## 하루전 추가된 파일 불러오기
```sql
SELECT * FROM tbl_attach 
WHERE uploadPath = 
DATE_FORMAT(ADDDATE(NOW(), INTERVAL -1 DAY),'%Y/%m/%d');
```