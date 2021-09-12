<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav_main.jsp"/>
  
  <!-- ======= Hero Section ======= -->
  <section id="" class="h-100" 
  style="background-image: url('/image/i_recruit.jpg');
  background-size:cover; background-position:center;
  position: relative;">
  	<div class="w-100 h-100 bg-dark" style="position:absolute;
  	top:0; opacity:.5;"></div>
  </section><!-- End Hero -->
  
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
                <div class="board-edit">
                    <h1 class="page-title-left">전체질문</h1>
                    <form action="/allkwlist" method="post">
                    <input type="text" name="kw">
           			<input type="submit" value="키워드 검색">
         			</form>
                </div>

                <!-- 구분선 -->
                	<c:choose>
	<c:when test="${articleList!=null && pageInfo.listCount>0 }">
		<section id="listForm">
		<table>
			
			<c:forEach var="article" items="${articleList}">
				<tr>
				<td>${article.qId }</td>
				<td>
			
				<a href="./totaldetail?q_id=${article.qId}">
					${article.content} 
				</a>
				</td>
				<td>${article.qId }</td>
			
			
				</tr>
			</c:forEach>
		</table>
		</section>
		<section id="pageList">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="allqlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
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

                <div class="board-table detail-row">
                    <div>
                        <a href="/board/total_detail" title="클릭 시 상세 페이지로 이동합니다.">
                            <p>질문 
                                <span>1.</span>
                                <span>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, fugit?</span>
                            </p>
                        </a>
                        
                        <div>
                            <button class="btn">전체답안</button>
                            <button class="btn">모범답안</button>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        
		<!-- 작업공간 끝-->
      </div>
    </section><!-- End Portfolio Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  
</body>
</html>


