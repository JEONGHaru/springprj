<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<h2>일반 게시판 > 글수정'</h2>
<form action="update" method="POST">

<table>
	<tr>
		<th>번호</th>
		<td><input name="boardId" value="10" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input name="title" value="공지 입니다"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="5" style="width: 600px;" name="content">공지입니다</textarea></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input name="userID" value="하루"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button>수정</button>
			<button type="reset">새로입력</button>
			<button type="button" onclick="history.back()">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>