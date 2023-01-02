<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<form action="exUploadPost" method="POST" enctype="multipart/form-data">
<div>
<input type="file" name="files">
</div><div>
<input type="file" name="files">
</div><div>
<input type="file" name="files">
</div><div>
<input type="file" name="files">
</div><div>
<input type="file" name="files">
</div>
<button>전송</button>
</form>
</body>
</html>