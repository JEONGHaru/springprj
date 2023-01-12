<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/summernote.jsp"%>
<div class="container">
	<div class="row">
		<form action="update?bbsID=${board.id}" method="post"
			onsubmit="listFormSubmit(this); return false;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;"></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control"
							placeholder="글 제목" name="title" maxlength="50"
							value="${board.title}" /></td>
					</tr>
					<tr>
						<td><textarea id="summernote" class="form-control"
								name="content">${board.content }</textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="修正" />
		</form>
	</div>
</div>
<script>
      $('#summernote').summernote({
    	placeholder:'内容を入力してください',
        tabsize: 2,
        height: 400
        
      });
    </script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="/js/app.js"></script>
<script src="js/modalFocus.js"></script>
</body>
</html>