<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />
<link rel="stylesheet" href="/style/total_detail_comment.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

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
<style>
.totalHead {
	color: gray;
	background: white;
}

.div1 {
	border: 1px solid black;
}

.div2 {
	border: 1px solid black;
	text-align: left;
}

#span1 {
	font-size: 13px;
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

				<div align="center">
					<!-- 페이지 타이틀 -->
					<div>
						<h1 class="totalHead">질  문</h1>
					</div>

					<!-- 구분선 -->
					<div class="line"></div>

		<section id="banner">
        <div id="intro">
        <h1>
    	<span>${articleList[0].q_id}.
							${articleList[0].qContent}</span>
		</h1>
        </div>
        <img src="https://images.unsplash.com/photo-1514454529242-9e4677563e7b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80" width="900" />
		</section>
					
					

					<div>
						<span></span> <a
							href="/board/totaldetail?q_id=${articleList[0].q_id}">
							<button type="button" class="badge rounded-pill bg-secondary">최신순</button>
						</a> <span>&nbsp;</span> <a
							href="/board/detailRCnt?q_id=${articleList[0].q_id}">
							<button type="button" class="badge rounded-pill bg-secondary">추천순</button>
						</a> <span>&nbsp;</span>
					</div>

	<div id="comments">
		<!-- 댓글목록 -->

	<div class="comments-h2">
			<h2>댓글</h2>
		</div>
		<div class="comments-container">
			<c:forEach var="article" items="${articleList}">

<!-- 본댓글 시작-->

				<ul id="comments-list" class="comments-list">
					<li>
								<div class="comment-main-level">

									<div class="comment-avatar">
									<img class="recommendations-user_icon"
									src="img/${article.pfImgId}" width="80px" height="80px">
									</div>

									<div class="comment-box">
										<div class="comment-head reply-head">
											<div class="comment-head-left">
												<h6 class="comment-name">
													<a>${article.memberName}</a>
												</h6>
												<span>${article.regdate}</span>
											</div>
											<div class="comment-head-right">
													
												<button class="btn btn-outline-secondary"
								id="${article.answerId}" class="recommend"
								data-bs-toggle="modal"
								onClick="javascript:recommend(${article.answerId});">좋아요:
								${article.rCnt}</button>

											</div>
										</div>
										<div class="reply-content">${article.content}</div>
									</div>
								</div>
								</li>
								</ul>
								</c:forEach>
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


