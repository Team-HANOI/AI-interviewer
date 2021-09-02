<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일  -->
	<link rel="stylesheet" href="/style/recruit_list.css">
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
                <h1 class="text">채용공고</h1>
            </div>
        </div>

        <div class="post">
            <a href="/recruit/form">
                <button class="post-btn">
                    채용공고 올리기
                </button>
            </a>
        </div>

        <!-- 공고 -->
        <div class="card-box">
            <div class="card">
                <img class="card-img" src="image/sky.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="card-com_url"><a href="">http:aaaaa</a></div> 
            </div>
            <div class="card">
                <img class="card-img" src="image/sky.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="card-com_url"><a href="">http:aaaaa</a></div> 
            </div>
            <div class="card">
                <img class="card-img" src="image/sky.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="card-com_url"><a href="">http:aaaaa</a></div> 
            </div>
            <div class="card">
                <img class="card-img" src="image/sky.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="card-com_url"><a href="">http:aaaaa</a></div> 
            </div>
            <div class="card">
                <img class="card-img" src="image/sky.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="card-com_url"><a href="">http:aaaaa</a></div> 
            </div>
            <div class="card">
                <img class="card-img" src="image/sky.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="card-com_url"><a href="">http:aaaaa</a></div> 
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


