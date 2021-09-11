<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- 잔디 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="/style/jandi.css">
<!-- 잔디 css 끝 -->

  <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
  <!-- 페이지 스타일 -->
  <link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">


<jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav_main.jsp"/>
  
  <!-- ======= Hero Section ======= -->
  <section id="" class="h-100" 
  style="background-image: url('/image/i_recruit.jpg');
  background-size:cover; background-position:center;
  position: relative;">
  	<div class="w-100 h-100 bg-dark" style="position:absolute;
  	top:0; opacity:.5;"></div>
  </section><!-- End Hero -->
  
  <main id="main">
  	<section class="portfolio">
      <div class="container">
		<!-- 작업공간 시작-->
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
                <div class="mypage-content-title">내가 쓴 글</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-list">
                        <ul>
                            <a href="#"><li>제목</li></a>
                            <a href="#"><li>제목</li></a>
                            <a href="#"><li>제목</li></a>
                            <a href="#"><li>제목</li></a>
                            <a href="#"><li>제목</li></a>
                            <a href="#"><li>제목</li></a>
                        </ul>
                    </div> 
                </form>
            </div>
        </div>
		<!-- 작업공간 끝-->
      </div>
    </section><!-- End Portfolio Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  
  
  
  <!-- 잔디 -->
  <script type="text/javascript">
    var dayArr = new Array();
    
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;
    dayArr[363] = dateString;
    
    for(var i = 362; i >= 0; i--) {
      today = new Date(today.setDate(today.getDate() - 1));
      year = today.getFullYear();
      month = ('0' + (today.getMonth() + 1)).slice(-2);
      day = ('0' + today.getDate()).slice(-2);
  
      dateString = year + '-' + month  + '-' + day;
      dayArr[i] = dateString;
    }

      var arr = new Array();
      <c:forEach items="${intArr}" var="item">        
              arr.push("${item}");
      </c:forEach>
    const squares = document.querySelector('.squares');
    for (var i = 0; i < 364; i++) {
      console.log(arr[i]);
      const level = Math.floor(Math.random() * 3);  
      squares.insertAdjacentHTML('beforeend', `<li data-level="\${arr[i]}" type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="\${dayArr[i]}: 면접 \${arr[i]}번 완료"></li>`);
    }
    </script>
    
    <!-- 부트스트랩 tooltip -->
    <script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl)
    })
    </script>
  
</body>
</html>


