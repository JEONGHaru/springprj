<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/navbar.jsp"%>
<div class="container">
	<div class="row justify-content-md-center">
		<div class="col-md-6">
			<form action="/user/join" method="post"
				onsubmit="joinFormSubmit(this); return false;">
				<h3 style="text-align: center; margin: 50px">会員登録</h3>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="userID"
						placeholder="IDを入力してください" maxlength="15" name="userID"> <label
						for="floatingInput">ID</label>
					<button class="btn btn-primary mt-3" type="button" onclick="userIDCheck();">IDCHECK</button>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword"
						placeholder="PASSWORDを入力してください" name="userPassword"> <label
						for="floatingInput">PASSWORD</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword"
						placeholder="PASSWORDをもう一度入力してください" name="userPassword2">
					<label for="floatingInput">PASSWORD確認</label>
				</div>
				<div class="form-floating mb-3 d-flex">
					<div class="form-floating me-3 col">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="名字を入力してください" name="userFirstName"> <label
							for="floatingInput mb-0">FirstName</label>
					</div>
					<div class="form-floating col">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="名前を入力してください" name="userLastName"><label
							for="floatingInput">LastName</label>
					</div>
				</div>
				<div class="form-floating mb-3">
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="userGender"
							id="btnradio1" autocomplete="off" value="男性" checked> <label
							class="btn btn-outline-primary" for="btnradio1">男性</label> <input
							type="radio" class="btn-check" name="userGender" id="btnradio2"
							autocomplete="off" value="女性"> <label
							class="btn btn-outline-primary" for="btnradio2">女性</label>
					</div>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="EMAILを入力してください" name="userEmail"> <label
						for="floatingInput">EMAIL</label>
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="会員登録" />
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="/js/app.js"></script>
<script src="/js/modalFocus.js"></script>
</body>
</html>