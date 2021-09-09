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
				  <h2 class="entry-title td_title">
                	<a href="./board_review_detail?reviewId=${article.reviewId}&page=${pageInfo.page}">${article.title}</a>
              	  </h2>
              	  <div class="entry-meta">
                    <ul>
                      <li class="d-flex align-items-center td_pos"><i class="bi bi-person"></i> <a href="blog-single.html">번호:${article.pos}</a></li>
                      <li class="d-flex align-items-center td_name"><i class="bi bi-person"></i> <a href="blog-single.html">작성자:${article.name}</a></li>
                      <li class="d-flex align-items-center td_company"><i class="bi bi-clock"></i> <a href="blog-single.html">${article.company}</a></li>          
                      <li class="d-flex align-items-center td_regdate"><i class="bi bi-clock"></i> <a href="blog-single.html"><time datetime="2020-01-01">${article.regdate}</time></a></li>
                      <li class="d-flex align-items-center td_viewCnt"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">${article.viewCnt}</a></li>
                      <li class="d-flex align-items-center td_likeCnt"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">${article.likeCnt}</a></li>                     
                    </ul>
              	  </div>
				  <div class="entry-content">
                	<p>
                  	  ${article.content}
                	</p>
                    <div class="read-more">
                      <a href="blog-single.html">Read More</a>
                    </div>
              	  </div>
	  			</c:forEach>

              <div class="entry-img">
                <img src="assets/img/blog/blog-1.jpg" alt="" class="img-fluid">
              </div>
              </c:when>	
			  <c:otherwise>
				<section id="emptyArea">등록된 글이 없습니다.</section>
			  </c:otherwise>
			</c:choose>
			
            </article><!-- End blog entry -->	

            <article class="entry">

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

            </article><!-- End blog entry -->
			
			<!-- 페이지 컨트롤 -->
            <div class="blog-pagination">
              <ul class="justify-content-center">
              	<c:choose>
				  <c:when test="${articleList!=null && pageInfo.listCount>0 }">
					<section id="pageList">
					  <c:choose>
					    <c:when test="${pageInfo.page<=1}">
					      <li>이전</li>
					  	</c:when>
	  				    
	  				    <c:otherwise>
	  				      <li><a href="allqlist?page=${pageInfo.page-1}">이전</a></li>
					    </c:otherwise>
					  </c:choose>
					  
					  <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					    <c:choose>
						  <c:when test="${pageInfo.page==i }">[${i }]</c:when>
						  <c:otherwise>
							<a href="allqlist?page=${i}">[${i }]</a>
						  </c:otherwise>
						</c:choose>
					  </c:forEach>
					  <c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						  <li>다음</li>
						</c:when>
						<c:otherwise>
						  <li><a href="allqlist?page=${pageInfo.page+1}">다음</a></li>
						</c:otherwise>
					  </c:choose>
					</section>
				  </c:when>	
				  <c:otherwise>
					<section id="emptyArea">등록된 글이 없습니다.</section>
				  </c:otherwise>
				</c:choose>
              </ul>
            </div><!-- End 페이지 컨트롤 -->

          </div><!-- End blog entries list -->

		  <!-- 사이드 메뉴 -->
          <div class="col-lg-4">
			
            <div class="sidebar">

              <h3 class="sidebar-title">Search</h3>
              <div class="sidebar-item search-form">
                <form action="/allkwlist" method="post">
                  <input type="text" name="kw">
                  <button type="submit" value="키워드 검색"><i class="bi bi-search"></i></button>
                </form>
              </div><!-- End sidebar search formn-->

              <h3 class="sidebar-title">Categories</h3>
              <div class="sidebar-item categories">
                <ul>
                  <li><a href="#">General <span>(25)</span></a></li>
                  <li><a href="#">Lifestyle <span>(12)</span></a></li>
                  <li><a href="#">Travel <span>(5)</span></a></li>
                  <li><a href="#">Design <span>(22)</span></a></li>
                  <li><a href="#">Creative <span>(8)</span></a></li>
                  <li><a href="#">Educaion <span>(14)</span></a></li>
                </ul>
              </div><!-- End sidebar categories-->

              <h3 class="sidebar-title">Recent Posts</h3>
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

              </div><!-- End sidebar recent posts-->

              <h3 class="sidebar-title">Tags</h3>
              <div class="sidebar-item tags">
                <ul>
                  <li><a href="#">App</a></li>
                  <li><a href="#">IT</a></li>
                  <li><a href="#">Business</a></li>
                  <li><a href="#">Mac</a></li>
                  <li><a href="#">Design</a></li>
                  <li><a href="#">Office</a></li>
                  <li><a href="#">Creative</a></li>
                  <li><a href="#">Studio</a></li>
                  <li><a href="#">Smart</a></li>
                  <li><a href="#">Tips</a></li>
                  <li><a href="#">Marketing</a></li>
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