<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일  -->
	<link rel="stylesheet" href="/style/interview.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 태양 -->
    	<div class="sun">
            <img src="https://pngimg.com/uploads/sun/sun_PNG13439.png" alt="">
        </div>
        
    	<!-- 팝업 -->
        <jsp:include page="../common/popups/popups.jsp"/>

         <!-- 본문 타이틀 -->
        <div class="title">
            <div class="title-text">
                <h1 class="text">면접모드선택</h1>
            </div>
        </div>

        <!-- 메인메뉴 -->
        <div class="mode-box">
            <div class="mode top_left btn" onclick="location.href='/interview/run';">
                일반면접모드
            </div> 
            
            <div class="mode top_right btn" onclick="location.href='/interview/recruit';">
                채용공고모드
            </div>
                        
            <div class="mode bottom_right btn keyword-popup">
                맞춤 모드
            </div>

            <div class="mode bottom_left btn" onclick="location.href='/interview/mentor';">
                멘토모드
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


