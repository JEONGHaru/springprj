<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm</title>
</head>
<body>
<form action="uploadFormAction" method="POST" enctype="multipart/form-data">
	<!-- multiple : 파일 여러개를 선택하게 해준다 controller에서 List나 배열로 받는다 -->
		<input type="file" name="uploadFile" multiple>
		<button>Submit</button>
	</form>
</body>
</html>