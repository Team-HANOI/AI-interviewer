<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

		<div class="interview">
		
			<div class="btn-box">
				<a href="/interview/backEnd"><button class="btn interview-btn">백엔드</button></a> 
				<a href="/interview/frontEnd"><button class="btn interview-btn">프론트</button></a>
			</div>
			
		</div>

	</main>

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>


