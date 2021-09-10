<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<jsp:include page="../common/top_t.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>

<script>
	
$(function() {
	$(".card").click(function(e) {
		
		$(this).find('.kwform')[0].submit();
	});
});
	
</script>

<style>
img {
	width: 450px;
	height: 150px;
	object-fit: cover;
}

#listPos {
	background-color: white;
	color: black;
}
</style>

</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="../common/nav_main.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="" class="h-100"
		style="background-image: url('/image/i_recruit.jpg'); background-size: cover; background-position: center; position: relative;">
		<div class="w-100 h-100 bg-dark"
			style="position: absolute; top: 0; opacity: .5;"></div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<section class="portfolio">
			<div class="container">
				<%-- 
				<!-- 공고 container -->
				<div class="row portfolio-container" data-aos="fade-up"
					data-aos-easing="ease-in-out" data-aos-duration="500">
					<!-- 공고 -->
					<c:forEach items="${voList}" var="list">
						<div class="col-lg-4 col-md-6 portfolio-wrap filter-app">
							<div class="portfolio-item">
								<!-- 정보를 가지고 넘어가야됨 -->
								<div class="card" id="pick">
								<img src="${list.logoUrl}" class="play-button1 img-fluid"
									alt="${list.cname}">
									</div>
								<div class="portfolio-info">

									<!--  <h1 class="bg-light">{list.cname}</h1> -->
									<form class="kwform" action="/interview/customMode"	method="GET">

										<h1 class="bg-light">${list.cname}</h1>
										<h3 id="listPos">${list.pos}</h3>
										<input type="hidden" name="type" value="${type }">

										<c:forEach items="${list.kwList}" var="kw">
											<input id="kw${list.cname }" type="checkbox" checked="checked" name="keyword" value="${kw}"> <label for="kw${list.cname }">${kw}</label>
										</c:forEach>
									</form>
									<div></div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- End 공고 container -->
 --%>

				<div class="row portfolio-container" data-aos="fade-up"
					data-aos-easing="ease-in-out" data-aos-duration="500">
					<!-- 공고 -->
					<div class="container">

						<c:forEach items="${voList}" var="list">
							<div class="col-lg-4 col-md-6 portfolio-wrap filter-app">
								<div class="portfolio-item">
									<div class="card" id="pick">
										<!-- 정보를 가지고 넘어가야됨 -->

										<img class="play-button1 img-fluid" src="${list.logoUrl}"
											alt="${list.cname}">
										<!-- <div class="text-wrap"> -->
										<div class="portfolio-info">
											<form class="kwform" action="/interview/customMode"
												method="GET">

												<h1>${list.cname}</h1>
												<h1>${list.pos}</h1>
												<input type="hidden" name="type" value="${type }">

												<c:forEach items="${list.kwList}" var="kw">
													<%-- <button>${kw}</button> --%>
													<input id="kw${list.cname }" type="checkbox"
														checked="checked" name="keyword" value="${kw}">
													<label for="kw${list.cname }">${kw}</label>
												</c:forEach>
											</form>
										</div>

									</div>
									<div></div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- card -->
				</div>



				<!-- 페이지 컨트롤 -->
				<div class="row">
					<div class="col-lg-12">
						<ul id="portfolio-flters">
							<div id="pageList" class="pageList">
								<c:choose>
									<c:when test="${pageInfo.page<=1}">
										<li data-filter=".filter-card">이전</li>
									</c:when>
									<c:otherwise>
										<a href="/interview/recruit?page=${pageInfo.page-1}">[이전]</a>&nbsp;
					</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${pageInfo.startPage }"
									end="${pageInfo.endPage }">
									<c:choose>
										<c:when test="${pageInfo.page==i }">[${i }]</c:when>
										<c:otherwise>
											<a href="/interview/recruit?page=${i}">[${i }]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						[다음]
					</c:when>
									<c:otherwise>
										<a href="/interview/recruit?page=${pageInfo.page+1}">[다음]</a>
									</c:otherwise>
								</c:choose>
							</div>
						</ul>
					</div>
				</div>
				<!-- End 페이지 컨트롤 -->



			</div>
		</section>
		<!-- End Portfolio Section -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../common/footer.jsp" />

	<!-- Vendor JS Files -->
	<jsp:include page="../common/vendor_js.jsp" />

	<!-- Template Main JS File -->
	<script src="../assets/js/main.js"></script>

</body>
</html>


