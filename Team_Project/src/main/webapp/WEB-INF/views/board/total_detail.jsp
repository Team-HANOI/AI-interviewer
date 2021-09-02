<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
	<link rel="stylesheet" href="/style/interview_result.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 구분선 -->
    <div class="line"></div>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 팝업 -->
        <!-- 팝업배경 더미 -->
        <div class="popup-dummy"></div>
        
        <!-- 키워드 카드 팝업 -->
        <jsp:include page="../common/popups/popup_keyword.jsp"/>
        
        <!-- 기업회원가입 팝업 -->
        <jsp:include page="../common/popups/popup_join_com.jsp"/>

        <!-- 일반회원가입 팝업 -->
        <jsp:include page="../common/popups/popup_join_indv.jsp"/>
        
        <!-- 일번회원가입 추가입력 폼 팝업 -->
        <jsp:include page="../common/popups/popup_join_indv_extra.jsp"/>

        <!-- 기업회원 로그인 -->
        <jsp:include page="../common/popups/popup_login_com.jsp"/>

        <!-- 일반회원 로그인 -->
        <jsp:include page="../common/popups/popup_login_indv.jsp"/>

		<!-- 타이틀 더미 -->
        <div class="dummy"></div>

        <!-- 메인화면 게시판 -->
        <div class="board-total mypage">
            <!-- 게시판 메뉴 -->
            <jsp:include page="board_common/board_nav.jsp"/>

            <!-- 질문 상세 -->
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

                <h2>질문 <span>1.</span></h2> 
                
                <div class="detail-row result-btn-box">
                    <button class="btn">최신순</button>
                    <button class="btn">추천순</button>
                </div>
                
                <div class="detail-row">
                    <div>
                        <img class="recommendations-user_icon" src="image/sky.jpg" alt="">
                        <small>J</small>
                    </div>
                    
                    <p class="item">ID: <span>jjj</span></p>
                    <p class="answer item">답: <span>왕ㅇㅇㅇㅇㅇ</span></p>
                    <p class="item">좋아요: <span>11</span></p>
                    <p class="item">등록일: <span>11.11.</span></p>
                </div>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


