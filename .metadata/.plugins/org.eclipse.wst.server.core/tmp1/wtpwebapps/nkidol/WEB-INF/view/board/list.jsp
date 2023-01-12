<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/layout/navbar.jsp"%>


<div class="container subnav mt-4">
	<div class="row">
		<div class="col-md-3 sm-12">
			<div class="pe-5 bg-white">
				<span class="fs-5 fw-semibold">HOME</span>
				<div class="border-top my-3"></div>
				<ul class="list-unstyled ps-0">
					<li class="mb-1 pb-3">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed 
							text-primary krButton"
							data-bs-toggle="collapse" data-bs-target="#idolkr-collapse"
							aria-expanded="false">韓アイドル</button>
						<div class="collapse" id="idolkr-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender1990-collapse" aria-expanded="false">1990年代</button>
									<div class="collapse" id="gender1990-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/korea/year1990/boy">BoyGroup</a></li>
											<li><a href="/album/korea/year1990/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender2000-collapse" aria-expanded="false">2000年代</button>
									<div class="collapse" id="gender2000-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/korea/year2000/boy">BoyGroup</a></li>
											<li><a href="/album/korea/year2000/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender2010-collapse" aria-expanded="false">2010年代</button>
									<div class="collapse" id="gender2010-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/korea/year2010/boy">BoyGroup</a></li>
											<li><a href="/album/korea/year2010/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender2020-collapse" aria-expanded="false">2020年代</button>
									<div class="collapse" id="gender2020-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/korea/year2020/boy">BoyGroup</a></li>
											<li><a href="/album/korea/year2020/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
							</ul>
						</div>
					</li>
					<li class="mb-1 pb-3">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed 
							text-danger jpButton"
							data-bs-toggle="collapse" data-bs-target="#idoljp-collapse"
							aria-expanded="false">日アイドル</button>
						<div class="collapse" id="idoljp-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender1990-collapse" aria-expanded="false">1990年代</button>
									<div class="collapse" id="gender1990-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/japan/year1990/boy">BoyGroup</a></li>
											<li><a href="/album/japan/year1990/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender2000-collapse" aria-expanded="false">2000年代</button>
									<div class="collapse" id="gender2000-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/japan/year2000/boy">BoyGroup</a></li>
											<li><a href="/album/japan/year2000/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender2010-collapse" aria-expanded="false">2010年代</button>
									<div class="collapse" id="gender2010-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/japan/year2010/boy">BoyGroup</a></li>
											<li><a href="/album/japan/year2010/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
								<li class="p-1"><button
										class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
										data-bs-toggle="collapse"
										data-bs-target="#gender2020-collapse" aria-expanded="false">2020年代</button>
									<div class="collapse" id="gender2020-collapse">
										<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
											<li><a href="/album/japan/year2020/boy">BoyGroup</a></li>
											<li><a href="/album/japan/year2020/girl">GrilGroup</a></li>
											<li></li>
										</ul>
									</div></li>
							</ul>
						</div>
					</li>
					<li class="border-top my-3"></li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed
							text-success"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false">アクセス</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<c:if test="${empty principal }">
								<li class="p-1"><a href="#"
									data-bs-toggle="modal"
								data-bs-target="#myModal" aria-expanded="false">ログイン</a></li>
								<li class="p-1"><a href="/user/join_view">会員登録</a></li>
								</c:if>
								<c:if test="${!empty principal }">
								<li class="p-1"><a href="/user/logout">ログアウト</a></li>
									</c:if>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="col">
			<form class="d-flex m-2 justify-content-end" role="search">
				<fieldset class="d-flex">
					<legend hidden="hidden">検索フィールド</legend>
					<label hidden="hideen">検索分類</label> <select
						class="form-select form-select-sm me-2"
						aria-label="Default select example" name="field">
						<option ${(param.field == "title")?"selected":""} value="title">タイトル</option>
						<option ${(param.field == "userID")?"selected":""} value="userID">作成者</option>
					</select> <label hidden="hidden">検索</label> <input class="form-control me-2"
						type="search" name="query" value="${param.query}" />
					<button class="btn btn-outline-primary mysearch" type="submit">検索</button>
				</fieldset>
			</form>

			<table class="col-md-4 table table-striped table-hover"
				style="text-align: center; border: #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">番号</th>
						<th style="background-color: #eeeeee; text-align: center;">タイトル</th>
						<th style="background-color: #eeeeee; text-align: center;">作成者</th>
						<th style="background-color: #eeeeee; text-align: center;">日付</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="n" items="${list}">
						<tr>
							<td>${n.id}</td>
							<td><a href="detail?bbsID=${n.id }"><c:out
										value="${n.title}"></c:out></a></td>
							<td>${n.userID }</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd hh:mm:ss"
									value="${n.regDate }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="row gx-0">

				<div class="col">
					<a href="?p=1" class="btn btn-success btn-arraw-left float-start">トップページ</a>
				</div>

				<div class="col">
					<c:set var="page" value="${(empty param.p)?1:param.p }" />
					<c:set var="startNum" value="${page-(page-1)%5}" />
					<c:set var="lastNum"
						value="${fn:substringBefore(Math.ceil(count/10),'.') }" />
					<c:set var="active" value="active"></c:set>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${startNum > 1 }">
								<li class="page-item"><a class="page-link"
									href="?p=${startNum-1 }" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="i" begin="0" end="4">
								<c:if test="${startNum+i<=lastNum }">
									<li class="page-item"><a
										class="page-link ${(param.p==startNum+i)?active:''}"
										href="?p=${startNum+i }">${startNum+i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${startNum+4 < lastNum}">
								<li class="page-item"><a class="page-link"
									href="?p=${startNum+5}" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				<c:if test="${not empty principal && isEmailCheck}">
					<div class="col">
						<a href="write_view" class="btn btn-primary float-end"
							role="button">作成</a>
					</div>
				</c:if>
				<c:if test="${not empty principal && !isEmailCheck}">
					<div class="col">
						<button type="button" class="btn btn-primary float-end"
							data-bs-toggle="modal" data-bs-target="#exampleModal">作成</button>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										掲示板に投稿するためにはE-MAILの確認が必要です。<br> 右上のE-MAILボタンを押して確認してください。
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">閉じる</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${empty principal}">
					<div class="col">
						<button type="button" class="btn btn-primary float-end"
							data-bs-toggle="modal" data-bs-target="#exampleModal">作成</button>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">ログインしてください</div>
									<div class="modal-footer">
										<button class="btn btn-primary" data-bs-toggle="modal"
											data-bs-target="#myModal" aria-expanded="false">ログイン</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">閉じる</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="/js/modalFocus.js"></script>
<script src="/js/app.js"></script>
</body>
</html>