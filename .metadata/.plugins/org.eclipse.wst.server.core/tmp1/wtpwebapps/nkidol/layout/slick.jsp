<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
	integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
	integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://kit.fontawesome.com/462b5b874f.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/services.css" />
<title>1990年代韓IDOL</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light shadow-lg sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand " href="/main"><img src="/images/logo.png"
				alt="" /></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/main">ホーム</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-primary" 
						role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>
							韓アイドル </a>
						<ul class="dropdown-menu dropend">
							<li><a class="dropdown-item dropdown-toggle" role="button" >１９９０年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/korea?year=1990&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/korea?year=1990&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item dropdown-toggle" role="button">２０００年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/korea?year=2000&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/korea?year=2000&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item dropdown-toggle" role="button">２０１０年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/korea?year=2010&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/korea?year=2010&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item dropdown-toggle" role="button">２０２０年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/korea?year=2020&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/korea?year=2020&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-danger" disabled
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							日アイドル </a>
						<ul class="dropdown-menu dropend">
							<li><a class="dropdown-item dropdown-toggle" role="button">１９９０年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/japan?year=1990&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/japan?year=1990&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item dropdown-toggle" role="button">２０００年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/japan?year=2000&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/japan?year=2000&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item dropdown-toggle" role="button">２０１０年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/japan?year=2010&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/japan?year=2010&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item dropdown-toggle" role="button">２０２０年代</a>
								<ul class="dropdown-menu submenu">
									<li><a href="/album/japan?year=2020&gen=boy" class="dropdown-item">BoyGroup</a></li>
									<li><a href="/album/japan?year=2020&gen=girl" class="dropdown-item">GirlGroup</a></li>
								</ul>
							</li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">掲示板</a>
					</li>
				</ul>
				<c:if test="${empty principal}">
					<div class="nav-item dropdown pe-3">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">ログイン</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item text-start" role="button" data-bs-toggle="modal"
								data-bs-target="#myModal" aria-expanded="false">ログイン</a></li>
							<li><a class="dropdown-item text-start" href="/user/join_view">会員登録</a></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${not empty principal}">
					<div class="nav-item dropdown">
						<c:if test="${!isEmailCheck}">
							<a href="/user/emailSend" class="btn btn-danger" role="button"
								onclick="clickEmailSendMSG();">E-MAIL確認</a>
						</c:if>
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">会員管理</button>
						<ul class="dropdown-menu dropdown-menu-end">
							<li class="dropdown-divider"></li>

							<li><a class="dropdown-item text-start" href="/user/logout">ログアウト</a></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</nav>
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">ログイン</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form action="/user/login"
						onsubmit="loginFormSubmit(this); return false;" method="post">
						<div class="form-floating mb-3">
							<input type="text" autofocus
								class="form-control rounded-3 myInput" id="floatingInputLoginId"
								name="userID" placeholder="ID"> <label
								for="floatingInputLoginId">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								id="floatingLoginPassword" name="userPassword" placeholder="Password">
							<label for="floatingLoginPassword">PASSWORD</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">LOG IN</button>
						<hr class="my-4">
						<ul>
						<li><a class="text-primary" role="button" data-bs-target="#findById" data-bs-toggle="modal"
						>IDを忘れた方はこちら</a></li>
						<li><a class="text-primary" role="button" data-bs-target="#findByPw" data-bs-toggle="modal"
						>PASSWORDを忘れた方はこちら</a></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="findById"  tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">IDを忘れた方</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form action="/user/findById"
						onsubmit="findByIdFormSubmit(this); return false;" method="post">
						<div class="form-floating mb-3">
							<div class="form-floating mb-3 col">
							<input type="text" autofocus
								class="form-control rounded-3 myInput" id="floatingInputFirst"
								name="userFirstName" placeholder="FirstName"><label
								for="floatingInputFirst">FirstName</label>
								</div>
								<div class="form-floating col">
								<input type="text" autofocus
								class="form-control rounded-3 myInput" id="floatingInputLast"
								name="userLastName" placeholder="LastName"><label
								for="floatingInputLast">LastName</label>
								</div>
						</div>
						<div class="form-floating mb-3">
							<input type="email" class="form-control rounded-3"
								id="floatingEmail" name="userEmail" placeholder="E-mail">
							<label for="floatingEmail">E-mail</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">送信</button>
					</form>
						<hr class="my-4">
						<a class="text-primary" role="button" data-bs-target="#findByPw" data-bs-toggle="modal"
						>PASSWORDを忘れた方はこちら</a>
				</div>
			</div>
		</div>
	</div><div class="modal fade" id="findByPw"  tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">Passwordを忘れた方</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form action="/user/findByPw"
						onsubmit="findByPwFormSubmit(this); return false;" method="post">
						<div class="form-floating mb-3">
							<input type="text" autofocus
								class="form-control rounded-3 myInput" id="floatingInputFindPw"
								name="userID" placeholder="ID"> <label
								for="floatingInputFindPw">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="email" class="form-control rounded-3"
								id="floatingFindPwEmail" name="userEmail" placeholder="E-mail">
							<label for="floatingFindPwEmail">E-mail</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">送信</button>
					</form>
						<hr class="my-4">
						<a class="text-primary" role="button" data-bs-target="#findById" data-bs-toggle="modal"
						>IDを忘れた方はこちら</a>
				</div>
			</div>
		</div>
	</div>