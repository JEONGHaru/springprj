<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/images");
		String directory2 = request.getServletContext().getRealPath("/images");
	%>
	<%= directory %>
	<%= directory2 %>
</body>
</html>