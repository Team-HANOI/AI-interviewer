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
                <div class="mypage-content-title">프로필 관리</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-profile">
                        <ul>
                            <li>
                                <span class="pfText">프로필 </span>
                                <div class="pfInfoOuter">
                                    <div clas="pfInfoInner">
                                        <div class="pfInfoInnerLeft">
                                            <img class="profile-img" width="200px" height="200px" src="https://t1.daumcdn.net/cfile/tistory/997607385E69770E19">
                                        </div>
                                        <div class="pfInfoInnerRight">
                                            <span class="pfExpText">경험치 </span><progress class="pfExp" max="100" value="70"> 70% </progress>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">기본 정보</span><br><br>
                                <span class="pfInfo" >010-000-0000 </span>
                                <span class="pfInfo" >email@email.com</span>
                            </li>
                            <li>
                                <span class="pfText">Git 저장소 주소</span>
                                <input class="pfIntro" type="text" placeholder="https://git.com">
                            </li>
                            <li>
                                <span class="pfText">주요 기술<span class="sm-grey">3개</span></span>
                                <div style="display: block;margin-top: 10px;">
                                    <button class="btn dark" type="button">Java</button>
                                    <button class="btn dark" type="button">Spring</button>
                                    <button class="btn dark" type="button">MyBatis</button>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">기술 태그<span class="sm-grey">3개</span></span> 
                                <div style="display: block;margin-top: 10px;">
                                    <button class="btn lightgrey" type="button">CSS</button>
                                    <button class="btn lightgrey" type="button">HTML</button>
                                    <button class="btn lightgrey" type="button">JavaScript</button>
                                </div>    
                            </li>
                            <li>
                                <span class="pfText">한줄 소개</span>
                                <textarea class="pfIntro pfTextLight" rows="3">안녕하세요</textarea>
                            </li>
                        </ul>
                    </div> 
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


