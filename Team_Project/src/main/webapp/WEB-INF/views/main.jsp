<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="common/top.jsp"/>
	<!-- 페이지 스타일  -->
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="common/header.jsp"/>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 태양 -->
    	<div class="sun">
            <img src="https://pngimg.com/uploads/sun/sun_PNG13439.png" alt="">
        </div>
        
    	<!-- 팝업 -->
        <!-- 팝업배경 더미 -->
        <div class="popup-dummy"></div>
        
        <!-- 키워드 카드 팝업 -->
        <jsp:include page="common/popups/popup_keyword.jsp"/>
        
        <!-- 기업회원가입 팝업 -->
        <jsp:include page="common/popups/popup_join_com.jsp"/>

        <!-- 일반회원가입 팝업 -->
        <jsp:include page="common/popups/popup_join_indv.jsp"/>
        
        <!-- 일번회원가입 추가입력 폼 팝업 -->
        <jsp:include page="common/popups/popup_join_indv_extra.jsp"/>

        <!-- 기업회원 로그인 -->
        <jsp:include page="common/popups/popup_login_com.jsp"/>

        <!-- 일반회원 로그인 -->
        <jsp:include page="common/popups/popup_login_indv.jsp"/>

        <!-- 비번찿기 -->
        <jsp:include page="common/popups/popup_pw_search.jsp"/>

        <!-- 본문 타이틀 -->
        <div class="title">
            
            <div class="cloud-box">
                <img class="cloud" src="https://img.icons8.com/emoji/96/000000/cloud-emoji.png"/>
            </div>
            <div class="cloud-box">
                <img class="cloud" src="https://img.icons8.com/emoji/96/000000/cloud-emoji.png"/>
            </div>
            <div class="cloud-box">
                <img class="cloud" src="https://img.icons8.com/emoji/96/000000/cloud-emoji.png"/>
            </div>
            <div class="cloud-box">
                <img class="cloud" src="https://img.icons8.com/emoji/96/000000/cloud-emoji.png"/>
            </div>
            <div class="title-text">
                <h1 class="text">인터뷰</h1>
                <h3 class="text">인터뷰</h3>
            </div>
        </div>

        <div class="row intro">
            <p class="intro-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Illo sint soluta quibusdam corrupti saepe dolor?</p>
        </div>
        
        <h2 class="row-title">채용공고</h2>
        <div class="row first">
            <div class="col">
                <div class="row">
                    <a href="">
                        <button class="item btn">조회수</button>
                    </a>
                    <a href="">
                        <button class="item btn">ㅁㅁㅁ</button>
                    </a>
                    <a href="">
                        <button class="item btn">ㅇㅇㅇ</button>
                    </a>
                    <a href="">
                        <button class="item btn">ㄹㄹㄹ</button>
                    </a>
                </div>
            </div>
        </div>
        
        <h2 class="row-title">모의면접</h2>
        <div class="row second">
            <div class="col">
                <div class="row">
                    <a href="">
                        <button class="item btn">조회수</button>
                    </a>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto, reiciendis cupiditate numquam libero architecto pariatur at maiores sequi enim impedit.</p>
                </div>
                <div class="row">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto, reiciendis cupiditate numquam libero architecto pariatur at maiores sequi enim impedit.</p>
                    <a href="">
                        <button class="item btn">조회수</button>
                    </a>
                </div>
                <div class="row">
                    <a href="">
                        <button class="item btn">조회수</button>
                    </a>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto, reiciendis cupiditate numquam libero architecto pariatur at maiores sequi enim impedit.</p>
                </div>
                <div class="row">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto, reiciendis cupiditate numquam libero architecto pariatur at maiores sequi enim impedit.</p>
                    <a href="">
                        <button class="item btn">조회수</button>
                    </a>
                </div>
            </div>
        </div>

        <h2 class="row-title">게시판</h2>
        <div class="row third">
            <div class="col">
                <div class="row">
                    <a href="">
                        <button class="item btn">조회수</button>
                    </a>
                    <a href="">
                        <button class="item btn">ㅁㅁㅁ</button>
                    </a>
                </div>
                <div class="row">
                    <a href="">
                        <button class="item btn">ㅇㅇㅇ</button>
                    </a>
                    <a href="">
                        <button class="item btn">ㄹㄹㄹ</button>
                    </a>
                </div>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>


