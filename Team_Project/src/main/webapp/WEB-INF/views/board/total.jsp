<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">
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
        
        <!-- 페이지 타이틀 -->
        <div class="board-edit">
            <div class="total-count"><span>00000</span>개의 글</div>
            <jsp:include page="board_common/board_article_ctrl.jsp"/>
        </div>
        
        <!-- 구분선 -->
        <div class="line"></div>

        <!-- 메인화면 게시판 -->
        <div class="board-total mypage">
            <!-- 게시판 메뉴 -->
            <jsp:include page="board_common/board_nav.jsp"/>

            <!-- 게시판 -->
            <div class="board mypage-right">
                <!-- 페이지 타이틀 -->
                <div class="board-edit">
                    <h1 class="page-title-left">전체질문</h1>
                    <button class="btn total-btn">키워드 검색</button>
                </div>

                <!-- 구분선 -->
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

	            <!-- 하부 컨트롤 -->
    	        <jsp:include page="board_common/board_page_ctrl.jsp"/>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


