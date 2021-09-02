<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
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
                <h1 class="page-title-left">면접후기게시판</h1>

                <!-- 구분선 -->
                <div class="line"></div>
                
                <table class="board-table">
                    <thead class="board-head">
                        <tr>
                            <th>번호</th>
                            <th>구분</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회</th>
                            <th>좋아요</th>
                        </tr>
                    </thead>
                    <tbody class="board-body">
                        <tr>
                            <td><a href="">01</a></td>
                            <td><a href="">자유</a></td>
                            <td><a href="/board/review/detail"><span></span>Lorem ipsum</a></td>
                            <td><a href="">Lorem ipsum</a></td>
                            <td><a href="">Lorem ipsum</a></td>
                            <td><a href="">80</a></td>
                            <td><a href="">100</a></td>
                        </tr>
                    </tbody>
                </table>

	            <!-- 하부 컨트롤 -->
    	        <jsp:include page="board_common/board_page_ctrl.jsp"/>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


