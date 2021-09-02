<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_recommend.css">
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

            <!-- 게시판 -->
            <ul class="recommendations board mypage-right">
                <h1 class="page-title-left">질문제안 게시판</h1>

                <!-- 구분선 -->
                <div class="line"></div>

                <!-- **질문제안 올리기 -->
                <li>
                    <div class="author recommedations-sub">
                        <img src="https://img.icons8.com/ios-glyphs/60/000000/ball-point-pen.png" class="recommendations-user_icon"/>
                        <small>작성자</small>
                    </div>

                    <input type="text" class="recommendation-keyword" placeholder="키워드를 입력하세요">

                    <div class="question recommedations-sub">
                        <input type="text" class="register-question recommendation-question" placeholder="등록 할 질문을 입력하세요">
                    </div>
                    
                    <div class="like recommedations-sub">
                        <button class="btn register-btn">등록하기</button>
                    </div>
                </li>
                <!-- **질문제안 올리기 -->

                <!-- 구분선 -->
                <div class="line"></div>

                <!-- **질문제안 게시판 -->
                <li class="register-questions">
                    <div class="author recommedations-sub">
                        <img class="recommendations-user_icon" src="image/sky.jpg" alt="">
                        <small>작성자</small>
                    </div>
            
                    <input type="text" class="recommendation-keyword" placeholder="키워드를 입력하세요">
                    
                    <div class="question recommedations-sub">
                        <div class="recommendation-question">
                            TCP와 UDP의 차이점은?
                        </div>
                        <button class="btn delete-btn">삭제하기</button>
                    </div>

                    <div class="like recommedations-sub">
                        <button class="recommendations-btn">
                            <i class="fas fa-heart"></i> 좋아요
                            <span class="count-number">2</span>
                        </button>
                        <small class="register-date">등록일: <span>21. 1. 2.</span></small>
                    </div>
                </li>
                <li class="register-questions">
                    <div class="author recommedations-sub">
                        <img class="recommendations-user_icon" src="image/sky.jpg" alt="">
                        <small>작성자</small>
                    </div>
            
                    <input type="text" class="recommendation-keyword" placeholder="키워드를 입력하세요">
                    
                    <div class="question recommedations-sub">
                        <div class="recommendation-question">
                            TCP와 UDP의 차이점은?
                        </div>
                        <button class="btn delete-btn">삭제하기</button>
                    </div>

                    <div class="like recommedations-sub">
                        <button class="recommendations-btn">
                            <i class="fas fa-heart"></i> 좋아요
                            <span class="count-number">2</span>
                        </button>
                        <small class="register-date">등록일: <span>21. 1. 2.</span></small>
                    </div>
                </li>
                <li class="register-questions">
                    <div class="author recommedations-sub">
                        <img class="recommendations-user_icon" src="image/sky.jpg" alt="">
                        <small>작성자</small>
                    </div>
            
                    <input type="text" class="recommendation-keyword" placeholder="키워드를 입력하세요">
                    
                    <div class="question recommedations-sub">
                        <div class="recommendation-question">
                            TCP와 UDP의 차이점은?
                        </div>
                        <button class="btn delete-btn">삭제하기</button>
                    </div>

                    <div class="like recommedations-sub">
                        <button class="recommendations-btn">
                            <i class="fas fa-heart"></i> 좋아요
                            <span class="count-number">2</span>
                        </button>
                        <small class="register-date">등록일: <span>21. 1. 2.</span></small>
                    </div>
                </li>
                <li class="register-questions">
                    <div class="author recommedations-sub">
                        <img class="recommendations-user_icon" src="image/sky.jpg" alt="">
                        <small>작성자</small>
                    </div>
            
                    <input type="text" class="recommendation-keyword" placeholder="키워드를 입력하세요">
                    
                    <div class="question recommedations-sub">
                        <div class="recommendation-question">
                            TCP와 UDP의 차이점은?
                        </div>
                        <button class="btn delete-btn">삭제하기</button>
                    </div>

                    <div class="like recommedations-sub">
                        <button class="recommendations-btn">
                            <i class="fas fa-heart"></i> 좋아요
                            <span class="count-number">2</span>
                        </button>
                        <small class="register-date">등록일: <span>21. 1. 2.</span></small>
                    </div>
                </li>
                <!-- **질문제안 게시판 -->

	            <!-- 하부 컨트롤 -->
    	        <jsp:include page="board_common/board_page_ctrl.jsp"/>
            </ul>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


