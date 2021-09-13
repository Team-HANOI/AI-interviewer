<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />

<style>
p {
	color: white;
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
				<!-- 작업공간 시작-->
				<div class="title">
					<div class="title-text">
						<h1 class="text">1:1멘토</h1>
						<small class="text">자신과 맞는 멘토와 1:1매칭..</small>
					</div>
				</div>

				<sec:authorize access="hasRole('COMPANY')">

				</sec:authorize>


				<!-- 메인화면 게시판 -->

				<c:if test="${articleList!=null}">

					<div class="row portfolio-container" data-aos="fade-up"
						data-aos-easing="ease-in-out" data-aos-duration="500">
						<c:forEach var="article" items="${articleList}">
							<div class="col-lg-4 col-md-6 portfolio-wrap filter-app">
								<div class="portfolio-item">

									<c:choose>
										<c:when test="${article.applEmail==null}">
											<ul class="mentor-box">
												<li class="mentor">
													<div class="mentor-item">
														<div class="mentor-cover"></div>
														<div class="mentor-info">
															<p class="mentor-title">[${article.company}]기업에서
																[${article.field}]면접 지도</p>
															<p class="mentor-time">${article.startDate}부터${article.endDate}까지</p>
															
															<fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${interviewRecord.regdate}"/>
															<p class="mentor-date">${article.mentorDate}날에!</p>
															
															
															<p class="mentor-email">문의사항: ${article.mentorEmail}</p>
														</div>
														<a href="./apply?mentorEmail=${article.mentorEmail}">
														<button type="button" class="btn btn-success"
															onClick="alert('신청완료')">신청하기📝</button>
														</a>
														<!-- <img src="image/teampic.png" class="img-fluid" alt=""> -->
													</div>
												</li>
											</ul>
										</c:when>
										<c:otherwise>
											<ul class="mentor-box">
												<li class="mentor">
													<div class="mentor-item">
														<div class="mentor-cover"></div>
														<div class="mentor-info">
															<p class="mentor-title">[${article.company}]기업에서
																[${article.field}]면접 지도</p>
															<%-- 	<p class="mentor-time">${article.startDate}부터${article.endDate}까지</p>
															<p class="mentor-date">${article.mentorDate}날에!</p>
															<p class="mentor-email">문의사항: ${article.mentorEmail}</p> --%>
															<a class="btn btn-outline-secondary disabled" aria-disabled="true"
																role="button" data-bs-toggle="button">🚧종료된 일정입니다.🚧</a>
														</div>
													</div>
												</li>

											</ul>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>

				<!-- 메인화면 게시판 -->


				<section id="pageList">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
						<c:otherwise>
							<a href="mentor?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="mentor?page=${i}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
						<c:otherwise>
							<a href="mentor?page=${pageInfo.page+1}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</section>

				<!-- 작업공간 끝-->
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


