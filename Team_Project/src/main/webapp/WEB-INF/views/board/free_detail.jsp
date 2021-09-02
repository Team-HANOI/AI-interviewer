<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_best_answers.css">
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

            <!-- 자유게시판 상세 -->
            <div class="board mypage-right">
                <!-- 페이지 타이틀 -->
                <h1 class="page-title-left">자유게시글 상세보기</h1>

                <!-- 구분선 -->
                <div class="line"></div>

                <div class="board-edit">
                    <button class="btn edit-btn">글쓰기</button>
                    <button class="btn edit-btn">수정</button>
                    <button class="btn edit-btn">삭제</button>
                    <button class="btn edit-btn">이전글</button>
                    <button class="btn edit-btn">다음글</button>
                    <button class="btn edit-btn">목록보기</button>
                </div>

                

                <div class="board-detail">
                    <p class="text item detail-row">제목: <span>33</span></p>
                    <div class="detail-row">
                        <p class="text item">보드넘버: <span>33</span></p>
                        <p class="text item">구분: <span>33</span></p>
                        <p class="text item">작성자: <span>33</span></p>
                        <p class="text item">작성일: <span>33</span></p>
                        <p class="text item">조회 수: <span>33</span></p>
                        <p class="text item">좋아요: <span>33</span></p>
                    </div>
        
                    <div class="detail-row">
                        <img class="detail-img" src="image/sky.jpg" alt="">
                    </div>
        
                    <textarea name="" id="" cols="30" rows="10" class="item detail-row"></textarea>
        
                    <p class="detail-row">
                        <img src="image/austria.jpg" alt="" class="reply-img">
                        <small>댓글: </small>
                        <small>id: </small>
                        <small>내용: </small>
                        <small>작성일: </small>
                        <button class="btn">삭제하기</button>
                    </p>
        
                    <div class="detail-row">
                        <input type="text" class="comment">
                        <button class="btn">등록하기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


