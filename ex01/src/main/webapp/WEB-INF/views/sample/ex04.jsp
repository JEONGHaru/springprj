<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${not empty msg }">
<script type="text/javascript">
	alert("${msg}");
</script>
</c:if>
</head>
<body>
sampleDTO : ${sampleDTO}<br/>
<div>
	page : ${page}
</div>

</body>
</html>