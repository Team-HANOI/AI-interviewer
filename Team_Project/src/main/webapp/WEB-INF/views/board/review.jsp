<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>

  <main id="main">
  	<!-- ======= Blog Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>면접후기</h2>

          <ol>
            <li><a href="/">Home</a></li>
            <li>커뮤니티</li>
            <li>${pageInfo.listCount}개의 글</li>
          </ol>
        </div>

      </div>
    </section><!-- End Blog Section -->

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
				  <h2 class="entry-title td_title">
                	<a href="./board_review_detail?reviewId=${article.reviewId}&page=${pageInfo.page}">${article.title}</a>
              	  </h2>
              	  <div class="entry-meta">
                    <ul>
                      <li class="d-flex align-items-center td_pos"><i class="bi bi-person"></i> <a href="blog-single.html">직무: ${article.pos}</a></li>
                      <li class="d-flex align-items-center td_name"><i class="bi bi-person"></i> <a href="blog-single.html">회사: ${article.company}</a></li>
                      <li class="d-flex align-items-center td_company"><i class="bi bi-person"></i> <a href="blog-single.html">작성자: ${article.name}</a></li>          
                      <li class="d-flex align-items-center td_regdate"><i class="bi bi-clock"></i> <a href="blog-single.html"><time datetime="2020-01-01">${article.regdate}</time></a></li>
                      <li class="d-flex align-items-center td_viewCnt"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">${article.viewCnt}</a></li>
                      <li class="d-flex align-items-center td_likeCnt"><i class="bi bi-suit-heart"></i> <a href="blog-single.html">${article.likeCnt}</a></li>                     
                    </ul>
              	  </div>
              	  </div>
				  <div class="entry-content">
                    <div class="read-more">
                      <a href="blog-single.html">상세보기</a>
                    </div>
              	  </div>
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
              	<span>
								<c:choose>
									<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp; 
				</c:when>
									<c:otherwise>
										<a href="/review/board_review?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${pageInfo.startPage }"
									end="${pageInfo.endPage }">
									<c:choose>
										<c:when test="${pageInfo.page==i }">[${i}]</c:when>
										<c:otherwise>
											<a href="/review/board_review?page=${i}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageInfo.page>=pageInfo.maxPage }">
                [다음]
                </c:when>
									<c:otherwise>
										<a href="/review/board_review?page=${pageInfo.page+1}">[다음]</a>
									</c:otherwise>
								</c:choose>
								</span>
              </ul>
            </div><!-- End 페이지 컨트롤 -->

          </div><!-- End blog entries list -->

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
			
			<!-- 키워드검색기능 -->
              <h3 class="sidebar-title">키워드 검색</h3>
              <div class="sidebar-item search-form">
                <form action="/review/board_review_key" method="post" class="board_review_key" name="board_review_key">
                  <input type="text" name="keyword" id="keyword"
								required="required"/>
                  <button type="submit"><i class="bi bi-search"></i></button>
                </form>
              </div>
             <!-- 키워드검색기능 끝-->

              <h3 class="sidebar-title">회사별 모아보기</h3>
              <div class="sidebar-item categories">
                <ul>
                  <li><a href="#">네이버<span>(25)</span></a></li>
                  <li><a href="#">카카오<span>(12)</span></a></li>
                  <li><a href="#">구글<span>(5)</span></a></li>
                  <li><a href="#">쿠팡<span>(22)</span></a></li>
                  <li><a href="#">배달의민족<span>(8)</span></a></li>
                  <li><a href="#">라인<span>(14)</span></a></li>
                </ul>
              </div><!-- End sidebar categories-->

<!-- 면접후기 인기글 -->
<!--               <h3 class="sidebar-title">면접후기 인기글</h3>
              <div class="sidebar-item recent-posts">
           
                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-1.jpg" alt="">
                  <h4><a href="blog-single.html">Nihil blanditiis at in nihil autem</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-2.jpg" alt="">
                  <h4><a href="blog-single.html">Quidem autem et impedit</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-3.jpg" alt="">
                  <h4><a href="blog-single.html">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-4.jpg" alt="">
                  <h4><a href="blog-single.html">Laborum corporis quo dara net para</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-5.jpg" alt="">
                  <h4><a href="blog-single.html">Et dolores corrupti quae illo quod dolor</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

              </div> -->
<!-- 면접후기 인기글 끝 -->

              <h3 class="sidebar-title">Tags</h3>
              <div class="sidebar-item tags">
                <ul>
                  <li><a href="#">app</a></li>
                  <li><a href="#">IT</a></li>
                  <li><a href="#">java</a></li>
                  <li><a href="#">Spring</a></li>
                  <li><a href="#">javascript</a></li>
                  <li><a href="#">Oracle</a></li>
                  <li><a href="#">CodingTest</a></li>
                  <li><a href="#">web</a></li>
                  <li><a href="#">css</a></li>
                  <li><a href="#">tips</a></li>
                  <li><a href="#">react</a></li>
                </ul>
              </div><!-- End sidebar tags-->

            </div><!-- End sidebar -->

          </div><!-- End blog sidebar -->

        </div>

      </div>
    </section><!-- End Blog Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>