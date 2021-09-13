<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
  <script
	src="https://code.jquery.com/jquery-latest.min.js"></script>
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
	
	 			<div class="board mypage-right">
				<!-- 페이지 타이틀 -->
				<div class="board-edit">
					<h1 class="page-title-left">전체질문 상세보기</h1>
					<a href="/board/best_answers">
						<button class="btn total-btn">모범답안</button>
					</a>
				</div>

				<!-- 구분선 -->
				<div class="line"></div>

				<div class="q">
					질문 <span>${articleList[0].q_id}.
					${articleList[0].qContent}</span>
				</div>
				

				<div class="detail-row result-btn-box">
					<a href="/board/totaldetail?q_id=${articleList[0].q_id }">
					<button class="btn">최신순</button>
					</a>
					<a href="/board/detailRCnt?q_id=${articleList[0].q_id}">
					<button class="btn">추천순</button>
					</a>
				</div>
				<c:forEach var="article" items="${articleList}">                  
					<div class="detail-row">
						<div>
							<img class="recommendations-user_icon"
								src="img/${article.pfImgId}"> <small>${article.memberName}</small>
						</div>
						<%--  <p class="item">ID: <span>${article.memberName}</span></p> --%>
						<p class="answer item">
							답: <span>${article.content} </span>
						</p>

						<button class="btn" id="${article.answerId}" class="recommend"
							data-bs-toggle="modal"
							onClick="javascript:recommend(${article.answerId});">좋아요:
							${article.rCnt}</button>

						<p>
							작성일: <span>${article.regdate}</span>
						</p>
						<br>
						<br> <br>
					</div>

				</c:forEach>
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


