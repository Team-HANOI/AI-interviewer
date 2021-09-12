<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
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
	
	  <div class="card-box">
            <!-- 채용공고 -->
            <form action="./mentorform" method="POST" class="mentor-form join">
                <h1 class="join-title">멘토 등록하기</h1>
                
                <!-- 구분선 -->
                <div class="line"></div>
                
                <div class="login-sub">
                    <div class="post_page-box">
                        <div class="post_page-sub-box">
                            <label for="company">회사이름</label>
                            <input id="company" class="login-input" type="text" name="company" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="mentorDate">날짜</label>
                            <input id="mentorDate" class="login-input" type="date" name="mentorDate" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="startDate">시작시간</label>
                            <input id="startDate" class="login-input" type="time" name="startDate" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="endDate">종료시간</label>
                            <input id="endDate" class="login-input" type="time" name="endDate" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="title">멘토링 제목</label>
                            <input id="title" class="login-input" name="title" type="text" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="content">멘토링 내용</label>
                            <input id="content" class="login-input" name="content" type="text" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="field">멘토링 분야</label>
                            <input id="field" class="login-input" type="text" name="field" placeholder="">
                        </div>
                        <div class="post_page-sub-box">
                            <label for="bio">멘토 소개</label>
                            <textarea id="bio" class="" name="bio" cols="57" rows="10"></textarea>
                        </div>
                    </div>

                    <input class="login-btn apply btn" type="submit" value="신청하기">
                </div>

            </form>
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


