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
  <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>비밀번호 변경</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>비밀번호 변경</li>
          </ol>
        </div>

      </div>
    </section>
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
  
</body>
</html>


