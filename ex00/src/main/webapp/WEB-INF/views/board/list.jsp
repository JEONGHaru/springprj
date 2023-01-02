<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>일반 게시판 > 리스트</h2>

<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<tr onclick="location='detail?boardId=10'">
		<th>10</th>
		<th>스프링</th>
		<th>하루</th>
		<th>2023-01-01</th>
		<th>9</th>
	</tr>
</table>
<br />
<a href="write">글쓰기</a>
</body>
</html>