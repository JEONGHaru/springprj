<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 페이지</title>
</head>
<body>
<h4>${exception.message}</h4>
<ul>
	<c:forEach var="stack" items="${exception.stackTrace }">
		<li><c:out value="${stack }"></c:out> </li>
	</c:forEach>
</ul>
</body>
</html>