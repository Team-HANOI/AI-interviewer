<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>   
    <!-- 페이지 스타일  -->
    <link rel="stylesheet" href="/style/board_total.css">
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

            <!-- 모법답안 게시판 -->
            <div class="mypage-right">
                <div class="board-edit">
                    <h1 class="page-title-left">모범답안</h1>
                    <a href="/board/">
                        <button class="btn total-btn">전체답안</button>
                    </a>
                </div>

                <!-- 구분선 -->
                <div class="line"></div>

                <div class="best-answer">
                    <div class="answer">
                        <!-- **질문, 답변 불러오는 란 -->
                        <div class="answer-content">
                            <div>
                                <h3>문제:</h3>
                                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Expedita ea ducimus iste aperiam placeat veniam esse. Nihil odit officiis ratione asperiores quibusdam magni odio accusamus, dolorem adipisci architecto at temporibus laborum officia perferendis vitae labore nam ad nobis nostrum quasi harum. Sit id voluptatum suscipit exercitationem atque sed? Nisi, exercitationem.</p>
                            </div>
                            <div>
                                <h3>정답:</h3>
                                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia blanditiis sequi earum maiores beatae doloremque porro, quod magnam voluptate fuga, amet possimus non. Cupiditate ratione sequi expedita molestiae dolorem cumque? Repudiandae debitis esse, vitae fugit nihil tempora quam blanditiis officia eaque unde pariatur corporis amet facilis illo veniam velit minima?</p>
                            </div>
                        </div>
                        <!-- **질문, 답변 불러오는 란 -->
                        <div class="items">
                            <div class="recommend">
                                <i class="far fa-thumbs-up"></i>
                                <button class="btn">좋아요 <span>number</span></button>
                            </div>
                            <div class="detail_link">
                                <i class="fas fa-door-open"></i>
                                <a href="/board/best_answers/detail">
                                    <button class="btn">답안 상세 페이지로 가기</button>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="board-detail">
                        <!-- **댓글 추가 -->
                        <div class="reply">
                            <img class="reply-img" src="/image/sky2.jpg" alt="">
                            <p class="reply-text">gggggggggg</p>
                            <p>id</p>
                            <p>date</p>
                        </div>
                        <div class="reply">
                            <img class="reply-img" src="/image/sky2.jpg" alt="">
                            <p class="reply-text">gggggggggg</p>
                            <p>id</p>
                            <p>date</p>
                        </div>
                        <div class="reply">
                            <img class="reply-img" src="/image/sky2.jpg" alt="">
                            <p class="reply-text">gggggggggg</p>
                            <p>id</p>
                            <p>date</p>
                        </div>
                        <div class="reply">
                            <img class="reply-img" src="/image/sky2.jpg" alt="">
                            <p class="reply-text">gggggggggg</p>
                            <p>id</p>
                            <p>date</p>
                        </div>
                        <!-- **댓글 추가 -->
                    </div>

                    <form action="" method="" class="write">
                        <i class="fas fa-pen-alt write-icon fa-2x"></i>
                        <input type="text" class="write-text" placeholder="댓글을 등록하세요">
                        <button type="submit" class="btn write-btn">등록</button>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


