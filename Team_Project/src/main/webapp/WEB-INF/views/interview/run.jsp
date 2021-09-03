<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- google api test -->
<script src='https://code.responsivevoice.org/responsivevoice.js'></script>

<!-- 공통 스타일  -->

<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일  -->

<link rel="stylesheet" href="/style/interview_normal.css">

</head>
<body>
	<!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
		<!-- 태양 -->
		<div class="sun">
			<img src="https://pngimg.com/uploads/sun/sun_PNG13439.png" alt="">
		</div>

		<!-- 팝업 -->
		<!-- 팝업배경 더미 -->
		<div class="popup-dummy"></div>

		<!-- 키워드 카드 팝업 -->
		<jsp:include page="../common/popups/popup_keyword.jsp" />

		<!-- 기업회원가입 팝업 -->
		<jsp:include page="../common/popups/popup_join_com.jsp" />

		<!-- 일반회원가입 팝업 -->
		<jsp:include page="../common/popups/popup_join_indv.jsp" />

		<!-- 일번회원가입 추가입력 폼 팝업 -->
		<jsp:include page="../common/popups/popup_join_indv_extra.jsp" />

		<!-- 기업회원 로그인 -->
		<jsp:include page="../common/popups/popup_login_com.jsp" />

		<!-- 일반회원 로그인 -->
		<jsp:include page="../common/popups/popup_login_indv.jsp" />

		<!--본문 면접모드-->
		<div class="interview">
			<div class="interview-content">
				<h2>질문:</h2>
				<div class="interview-question interview-text">${questions[0].ssml}</div>

				<h2>답변:</h2>
				<textarea name="" id="" class="interview-answer interview-text"></textarea>

				<div class="interview-time">
					<p>
						남은시간: <span class="time-left">00:00</span>
					</p>
				</div>
			</div>
			
			<input
				onclick="responsiveVoice.speak('${questions[0].content}');"
				type='button' value='🔊 질문 듣기' />
				
			<div class="btn-box">
				<a href=""><button class="btn interview-btn">이전질문</button></a> <a
					href="interview_result.html"><button class="btn interview-btn">다음질문</button></a>
			</div>


		</div>
	</main>

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>




	<script>
	alert("작업중인 페이지 입니다.");
	
	$(function(){
	
		alert( '${questions[0].ssml}' );
		
		var request = new XMLHttpRequest();
		
		request.responseType = "blob"; 
		
		request.onload = function() {
 			var audioURL = URL.createObjectURL(this.response);	
 			var audio = new Audio();
			audio.src = audioURL;
			audio.play();
 		}
 		
		request.open("POST", 'questionvoice');
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		request.send("ssml=" + '${questions[0].ssml}' );
		
	});
</script>

</body>
</html>
