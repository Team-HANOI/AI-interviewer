<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
#inline {
	display: inline-block;
	text-align:center;
	height: 40px;
	width: 350px;
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

				<!-- 구분선 -->
				<div class="line"></div>

				<!-- 메인화면 게시판 -->
				<div class="board-total mypage">
					<!-- 게시판 메뉴 -->

					<!-- 게시판 -->
					<div class="board mypage-right">
						<!-- 페이지 타이틀 -->

						<!-- 구분선 -->
						<div align="center">
							<c:choose>
								<c:when test="${articleList!=null && pageInfo.listCount>0 }">
									<section id="listForm">
										<table>

											<c:forEach var="article" items="${articleList}">
												<tr>
													<td><span class="badge rounded-pill bg-secondary">질문[${article.qId }]</span></td>
													<td><a href="./totaldetail?q_id=${article.qId}">${article.content}
													</a></td>
													<td><span class="badge rounded-pill bg-secondary">${article.qtype }(${article.kwlist })</span></td>
												</tr>
											</c:forEach>
											
	
										</table>
									</section>


									<div>
										<form action="/board/allkwlist" method="post">
											<h1>
												<input id="inline" type="text" name="kw"
													class="form-control"> <input id="inline"
													type="submit" class="form-control" value="키워드 검색">
											</h1>
										</form>
									</div>
									
									<section id="pageList">
										<c:choose>
											<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
											<c:otherwise>
												<a href="allqlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${pageInfo.startPage }"
											end="${pageInfo.endPage }">
											<c:choose>
												<c:when test="${pageInfo.page==i }">[${i }]</c:when>
												<c:otherwise>
													<a href="allqlist?page=${i}">[${i }]</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
											<c:otherwise>
												<a href="allqlist?page=${pageInfo.page+1}">[다음]</a>
											</c:otherwise>
										</c:choose>
									</section>
								</c:when>
								<c:otherwise>
									<section id="emptyArea">등록된 글이 없습니다.</section>
								</c:otherwise>
							</c:choose>
							<div class="line"></div>



						</div>
					</div>
				</div>
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


