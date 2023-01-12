<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<table class="table table-bordered"
				style="text-align: center; border: #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;"><c:out
								value="${board.title}"></c:out></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>作成者</td>
						<td colspan="2">${board.userID}</td>
					</tr>
					<tr>
						<td>日付</td>
						<td colspan="2">${board.regDate}</td>
					</tr>
					<tr>
						<td>内容</td>
						<td colspan="2" style="height: 200px; text-align: left;">${board.content}</td>
					</tr>
				</tbody>
			</table>
			<div class="container d-flex">
				<a href="list" class="btn btn-primary">トップページ</a>
				<div class="ms-auto">
				<c:if test="${principal != null && principal.userID == board.userID}">
					<a href="update_view?bbsID=${board.id}" class="btn btn-warning">修正</a>
					<a onclick="return confirm('本当に 削除しますか?')"
						href="delete?bbsID=${board.id}" class="btn btn-danger">削除</a>
				</c:if>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		<script src="/js/app.js"></script>
		<script src="/js/modalFocus.js"></script>
</body>
</html>