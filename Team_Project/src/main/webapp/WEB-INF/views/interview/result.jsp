<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일  -->
	<link rel="stylesheet" href="/style/board_review.css">
	<link rel="stylesheet" href="/style/interview_result.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>       
    	<!-- 팝업 -->
        <jsp:include page="../common/popups/popups.jsp"/>

        <!-- 페이지 타이틀 -->
        <h1 class="page-title">면접결과</h1>

        <!-- 구분선 -->
        <div class="line"></div>

        <!-- 메인화면 게시판 -->
        <div class="board-container interview-result">
            <!-- 인터뷰 결과 메뉴 -->
            <div class="board-menu">
                <ul>
                    <a href="board_write.html">
                        <li class="btn">질문 
                            <span> 1.</span>
                        </li>
                    </a>
                    <a href="board_total.html">
                        <li class="btn">질문 
                            <span> 2.</span>
                        </li>
                    </a>
                    <a href="board_review.html">
                        <li class="btn">질문 
                            <span> 3.</span>
                        </li>
                    </a>
                    <a href="board_free.html">
                        <li class="btn">질문 
                            <span> 4.</span>
                        </li>
                    </a>
                    <a href="board_recommend.html">
                        <li class="btn">질문 
                            <span> 5.</span>
                        </li>
                    </a>
                    <a href="board_best_answers.html">
                        <li class="btn">질문 
                            <span> 6.</span>
                        </li>
                    </a>
                    <a href="board_best_answers.html">
                        <li class="btn">질문 
                            <span> 7.</span>
                        </li>
                    </a>
                    <a href="board_best_answers.html">
                        <li class="btn">질문 
                            <span> 8.</span>
                        </li>
                    </a>
                    <a href="board_best_answers.html">
                        <li class="btn">질문 
                            <span> 9.</span>
                        </li>
                    </a>
                    <a href="board_best_answers.html">
                        <li class="btn">질문 
                            <span>10.</span>
                    </li>
                </a>
                </ul>
            </div>

            <!-- 인터뷰 결과 내용 -->
            <div class="board">
                <h2>질문 <span>1.</span></h2> 
                
                <div class="detail-row result-btn-box">
                    <button class="btn">최신순</button>
                    <button class="btn">추천순</button>
                    <a href="board_best_answers.html">
                        <button class="btn">모범답안 페이지로</button>
                    </a>
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


