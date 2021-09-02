<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일  -->
	<link rel="stylesheet" href="/style/interview_recruit.css">
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
                <h1 class="text">채용공고모드</h1>
            </div>
        </div>

        <div class="row intro">
            <p class="row-text">원하는 공고를 선택하면 솰라솰라</p>
        </div>

        <!-- 구분선 -->
        <div class="line"></div>
       
        <!-- 공고 -->
        <div class="container">
            <div class="card" id="pick">
                <div class="img-gradient"></div>
                <img src="img/austria.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="play-button1"></div>
            </div>

            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-2.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="play-button2"></div>
            </div>
            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-2.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="play-button"></div>
            </div>
            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-2.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>회사아아</h1>
                    <button>java</button>
                    </div>
                <div class="play-button"></div>
            </div>
            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-2.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>Nam lacinia</h1>
                    <h1>회사이름</h1>
                    <button>java</button>
                    <button>jQuery</button>
                    <button>python</button>
                </div>
                <div class="play-button"></div>
            </div>
            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-2.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>Nam lacinia</h1>
                    <p>Duis interdum elit nibh. Vivamus non nu est laoreet. </p>
                </div>
                <div class="play-button"></div>
            </div>
            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-2.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>Nam lacinia</h1>
                    <p>Duis interdum elit nibh. Vivamus non nu est laoreet. </p>
                </div>
                <div class="play-button"></div>
            </div>

            <div class="card">
                <div class="img-gradient"></div>
                <img src="img/sample-3.jpg" alt="" srcset="">
                <div class="text-wrap">
                    <h1>Integer 5</h1>
                    <p>Cras nec nunc ut neque cursus dictum.</p>
                </div>
                <div class="play-button"></div>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


