<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일  -->
	<link rel="stylesheet" href="/style/recruit_form.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 팝업 -->
        <jsp:include page="../common/popups/popups.jsp"/>

        <!-- 타이틀 더미 -->
        <div class="dummy"></div>
        
        <!-- 채용공고 작성 -->
        <h1 class="page-title-left">채용공고 작성하기</h1>
        <form action="/recruit/form" method="GET" class="form-box">

            <!-- 구분선 -->
            <div class="line"></div>

            <div class="login-sub">
                <div class="post_page-box">
                    <div class="post_page-sub-box">
                        <label for="">회사이름</label>
                        <input class="login-input" type="text" placeholder="">
                    </div>
                    <div class="post_page-sub-box">
                        <label for="">이메일</label>
                        <input class="login-input" type="email" placeholder="">
                    </div>
                    <div class="post_page-sub-box">
                        <label for="">모집 포지션</label>
                        <input class="login-input" type="text" placeholder="">
                    </div>
                    <div class="post_page-sub-box">
                        <label for="">기간</label>
                        <input class="login-input" type="date" placeholder="">
                        <p class="from-to"> ~ </p>
                        <input class="login-input" type="date" placeholder="">
                    </div>

                    <div class="post_page-sub-box">
                        <label>키워드</label>
                        <div class="post-keywords">
                            <div class="post-keyword">
                                <input id="post-kw1" type="checkbox">
                                <label for="post-kw1">a</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw2" type="checkbox">
                                <label for="post-kw2">b</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw3" type="checkbox">
                                <label for="post-kw3">c</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw4" type="checkbox">
                                <label for="post-kw4">d</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw5" type="checkbox">
                                <label for="post-kw5">e</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw6" type="checkbox">
                                <label for="post-kw6">faaaaaaaaaaa</label>
                            </div>
                        </div>
                    </div>

                    <div class="post_page-sub-box">
                        <label for="">URL</label>
                        <input class="login-input" type="text" placeholder="">
                    </div>

                    <div class="post_page-sub-box">
                        <label for="">경력</label>
                        <input class="login-input" type="number" placeholder="ex) 1">
                    </div>
                </div>

                <input class="login-btn apply btn" type="submit" value="채용공고 올리기">
            </div>
        </form>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


