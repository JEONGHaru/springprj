<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/navbar.jsp"%>
	<div class="container py-4">
		<div class="row mt-4">
			<div class="col-sm-5">
				<div class="fs-1">
					<img src="images/korea.png" alt="" />韓アイドル
				</div>
				<div id="carouselExampleSlidesOnly" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner border p-2">
						<div class="carousel-item active" data-bs-interval="2000">
							<img src="${kList.get(0).filePath}" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item ">
							<img src="${kList.get(1).filePath}" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${kList.get(2).filePath}"
								class="d-block w-100 lesse" alt="...">
						</div>

					</div>

				</div>
			</div>
			<div class="col-sm-5 offset-sm-2">
				<div class="fs-1">
					<img src="images/japan.png" alt="" />日アイドル
				</div>

				<div id="carouselExampleSlidesOnly" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner badge border p-2">
						<div class="carousel-item active" data-bs-interval="2000">
							<img src="${jList.get(0).filePath}" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="${jList.get(1).filePath}" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="${jList.get(2).filePath}" class="d-block w-100"
								alt="...">
						</div>
					</div>
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