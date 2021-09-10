<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	
	   <div class="join-individual-form">
          <form action="/join_indv" method="POST" enctype="multipart/form-data" class="login join-person">
              <h1 class="join-title">ALPACA 계정 만들기</h1>
              <div class="join-holder">    
                  <!-- 구분선 -->
                  <div class="line"></div> 
                  <div style="clear:both"></div>
                  <label for="">이름</label>
                  <input class="join-input holder" type="text" name="name"placeholder="이름" required>
                  <label for="">이메일</label>
                  <input class="join-input holder" type="email" name="email" placeholder="이메일" required>
                  <label for="">비밀번호</label>
                  <input class="join-input holder" type="password" name="pw" placeholder="비밀번호" required>
                  <label for="">비밀번호 확인</label>
                  <input class="join-input holder" type="password" placeholder="비밀번호 확인" required>
                  <input type="file" name = "pfImg" style="display:none" src="../image/alpaca.jpg"/>
                  <div class="join-confirm">
                      <!-- <input class="join-btn btn" type="button" value="일반회원 가입하기"> -->
                      <button class="join-btn btn"  type="submit" >일반회원 가입하기</button>
                  </div>
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


