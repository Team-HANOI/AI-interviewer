<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex justify-content-between align-items-center">
	  	
	  <!-- site title -->	
      <div class="logo">
        <h1 class="text-light"><a href="/"><span>Mr. Alpaca</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>
	
	  <!-- navigation -->
	  <nav id="navbar" class="navbar">
  <ul>
    <li><a class="active" href="/">홈</a></li>
    <li class="dropdown"><a href="/interview/"><span>면접하기</span> <i class="bi bi-chevron-down"></i></a>
      <ul>
        <li><a href="/interview/normal">일반면접</a></li>
        <li><a href="/interview/recruit">채용공고면접</a></li>
        <li><a href="/interview/custom">맟춤면접</a></li>
        <li><a href="/interview/mentor">멘토면접</a></li>
      </ul>
    </li><li class="dropdown"><a href="/board/"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
      <ul>
        <li><a href="/board/">전체질문</a></li>
        <li><a href="/review/board_review">면접후기</a></li>
        <li><a href="/board/free">자유게시판</a></li>
        <li><a href="/board/recommend">면접질문</a></li>
        <li><a href="/board/best_answers">모범답안</a></li>
      </ul>
    </li>
    <li><a href="/recruit/">채용공고</a></li>
    <sec:authorize access="isAuthenticated()">
      <li><a href="/logout">로그아웃</a></li>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
      <li><a href="/userLogin">로그인</a></li>
    </sec:authorize>
    
    <li class="dropdown"><a href="#"><span>회원가입</span> <i class="bi bi-chevron-down"></i></a>
      <ul>
        <li><a href="/join_indv">일반회원</a></li>
        <li><a href="/join_com">기업회원</a></li>
      </ul>
    </li>
    <!-- my page 링크 -->
    <li><a href="/mypage/" class="my-page-link">M</a></li>
    <li><a href="/contact">Contact Us</a></li>
  </ul>
  <i class="bi bi-list mobile-nav-toggle"></i>
</nav><!-- .navbar -->	  

    </div>
  </header><!-- End Header -->

