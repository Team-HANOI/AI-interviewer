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
        <jsp:include page="../common/popups/popups.jsp"/>

		<!-- 타이틀 더미 -->
        <div class="dummy"></div>
        
        <!-- 마이 페이지 -->
        <div class="mypage">
            <!-- 유저정보 좌측 메뉴 정보 -->
            <div class="mypage-left">

                <!-- 좌측 메뉴 링크 -->
                <jsp:include page="mypage_common/mypage_nav.jsp"></jsp:include>
            </div>
            
            <!-- 유저정보 우측 정보 박스 -->
            <div class="mypage-right">
                <!-- 유저정보 제목 -->
                <div class="mypage-content-title">비밀번호 변경</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    

                    <div class="pwResetHolder">

                 
                        <div class="pwEmailInput">
                            <label for=""><span style="color:red;">*</span> 현재 비밀번호</label>
                            <input class="pwreset-input holder" type="password" placeholder="">
                        </div>
                        <!-- <div class="pwResetCheck">
                            <span class="pwResetText">비밀번호를 잊으셨나요?</span><a href="login_pw_reset.html"><span class="pwReset"><small> 비밀번호 재설정</small></span></a> 
                        </div> -->

                        <div class="pwEmailInput">
                            <label for=""><span style="color:red;">*</span> 새 비밀번호</label>
                            <input class="pwreset-input holder" type="password" placeholder="">
                        </div>
                        <!-- <div class="pwResetCheck">
                            <span class="pwResetText">비밀번호 (소문자와 숫자 포함 최소 6자)</span>
                        </div> -->

                        <div class="pwEmailInput">
                            <label for=""><span style="color:red;">*</span> 비밀번호 확인</label>
                            <input class="pwreset-input holder" type="password" placeholder="">
                        </div>

                        <div class="pwReset-confirm">
                            <input class="pwReset-btn btn" type="submit" value="비밀번호 변경">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


