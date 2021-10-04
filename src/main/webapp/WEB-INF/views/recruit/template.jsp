<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
  <script
	src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<script>

        function recommend(answerId) {
          
            $.ajax({
                  type: "POST",
                  url: "./recommend", //요청 URL 
                  data: { answerId : answerId  }, //요청과 함께 서버에 보내는 string 또는 json
                  // 서버에서 내려온 data 형식. ( default : xml, json, script, text, html )
                  success: function(data, textStatus) { // 요청에 성공하면 함수 실행 data는 응답 데이터가 들어간다
           
                        if (textStatus == 'success') {
                          $("#"+answerId).text('좋아요: '+ data);
                      };
                  },
                  error: function(response, textStatus) { // 에러가 났을 경우의 작업
                     alert("오류가 발생했습니다.");
                  }
              });
              return false; // 페이지 리로딩을 막는다. 
        };
        



</script>
	
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


