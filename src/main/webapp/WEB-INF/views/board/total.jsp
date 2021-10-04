<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />
</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="../common/nav.jsp" />

	<main id="main">
		<!-- ======= Blog Section ======= -->
		<section class="breadcrumbs">
			<div class="container">

				<%--  <div class="d-flex justify-content-between align-items-center">
          <h2>면접후기</h2>

          <ol>
            <li><a href="/">Home</a></li>
            <li>커뮤니티</li>
            <li>${pageInfo.listCount}개의 글</li>
          </ol>
        </div> --%>

			</div>
		</section>
		<!-- End Blog Section -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">

				<div class="row">

					<div class="col-lg-8 entries">
						<c:choose>
							<c:when test="${articleList!=null && pageInfo.listCount>0 }">
								<article class="entry" id="listForm">
									<c:forEach var="article" items="${articleList}">
										<div class="entry-box">
											<div class="entry-title-left">
												<div class="entry-meta">
													<ul>
														<li class="d-flex align-items-center td_pos"><i
															class="bi bi-list-ol"></i> 질문[${article.qId }]</li>
														<li class="d-flex align-items-center td_name"><i
															class="bi bi-patch-question"></i> <a
															href="./totaldetail?q_id=${article.qId}">${article.content}
														</a></li>
														<%--  <li class="d-flex align-items-center td_company"><i class="bi bi-person"></i> ${article.qtype }(${article.kwlist })</li>   --%>


													</ul>
												</div>
											</div>

											<%-- 		  <div class="entry-content">
                    <div class="read-more">
                      <a href="./board_review_detail?reviewId=${article.reviewId}&page=${pageInfo.page}">상세보기</a>
                    </div>
              	  </div> --%>
										</div>
										<br>
									</c:forEach>

									<div class="entry-img">
										<img src="assets/img/blog/blog-1.jpg" alt="" class="img-fluid">
									</div>
							</c:when>
							<c:otherwise>
								<section id="emptyArea">등록된 글이 없습니다.</section>
							</c:otherwise>
						</c:choose>

						</article>
						<!-- End blog entry -->

						<!--             <article class="entry">

              <div class="entry-img">
                <img src="assets/img/blog/blog-1.jpg" alt="" class="img-fluid">
              </div>

              <h2 class="entry-title">
                <a href="blog-single.html">Dolorum optio tempore voluptas dignissimos cumque fuga qui quibusdam quia</a>
              </h2>

              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-single.html">John Doe</a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-single.html"><time datetime="2020-01-01">Jan 1, 2020</time></a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">12 Comments</a></li>
                </ul>
              </div>

              <div class="entry-content">
                <p>
                  Similique neque nam consequuntur ad non maxime aliquam quas. Quibusdam animi praesentium. Aliquam et laboriosam eius aut nostrum quidem aliquid dicta.
                  Et eveniet enim. Qui velit est ea dolorem doloremque deleniti aperiam unde soluta. Est cum et quod quos aut ut et sit sunt. Voluptate porro consequatur assumenda perferendis dolore.
                </p>
                <div class="read-more">
                  <a href="blog-single.html">Read More</a>
                </div>
              </div>

            </article>End blog entry -->

						<!-- 페이지 컨트롤 -->
						<div class="blog-pagination">
							<ul class="justify-content-center">
								<span> <c:choose>
										<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp; 
				</c:when>
										<c:otherwise>
											<a href="allqlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
									</c:choose> <c:forEach var="i" begin="${pageInfo.startPage }"
										end="${pageInfo.endPage }">
										<c:choose>
											<c:when test="${pageInfo.page==i }">[${i}]</c:when>
											<c:otherwise>
												<a href="allqlist?page=${i}">[${i }]</a>
											</c:otherwise>
										</c:choose>
									</c:forEach> <c:choose>
										<c:when test="${pageInfo.page>=pageInfo.maxPage }">
                [다음]
                </c:when>
										<c:otherwise>
											<a href="allqlist?page=${pageInfo.page+1}">[다음]</a>
										</c:otherwise>
									</c:choose>
								</span>
							</ul>
						</div>
						<!-- End 페이지 컨트롤 -->

					</div>
					<!-- End blog entries list -->

					<!-- 사이드 메뉴 -->
					<div class="col-lg-4">

						<div class="sidebar">

							<%--<!-- 임시저장 글 목록 보기 --> 			
<sec:authorize access="isAuthenticated()">
					<a href="./write_tempreview">
					<button class="btn edit-btn">임시저장 글 보기</button>
					</a>    
			</sec:authorize> 
<!-- 임시저장 글 목록 보기 끝 -->--%>

							<!-- 글쓰기기능 -->
							<%-- 	<sec:authorize access="isAuthenticated()">
								<h3 class="sidebar-title">
									<a href="./write_review">글쓰기</a>
								</h3>
								<br>
							</sec:authorize> --%>
							<!-- 글쓰기기능 -->

							<!-- 키워드검색기능 -->



							<h2 class="sidebar-title">키워드 검색</h2>
							<div class="sidebar-item search-form">

								<form action="/board/allkwlist" method="post"
									class="board_review_key" name="board_review_key">


									<input id="inline" type="text" name="kw" required="required" />

									<button type="submit">
										<i class="bi bi-search"></i>
									</button>

								</form>
							</div>






							<!-- 키워드검색기능 끝-->



							<h3 class="sidebar-title">Tags</h3>
							<div class="sidebar-item tags">
								<ul>

									<c:forEach items="${keywordList }" var="keywordList">

										<li><a href="#">${keywordList.kw }</a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- End sidebar tags-->

						</div>
						<!-- End sidebar -->

					</div>
					<!-- End blog sidebar -->

				</div>

			</div>
		</section>
		<!-- End Blog Section -->
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