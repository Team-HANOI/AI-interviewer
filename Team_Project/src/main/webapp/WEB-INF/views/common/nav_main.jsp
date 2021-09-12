<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication property="principal" var="user"/>


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
    <li><a href="/contact">Contact Us</a></li>
    <li class="dropdown"><a href="/interview/"><span>면접하기</span> <i class="bi bi-chevron-down"></i></a>
      <ul>
        <li><a href="/interview/steps_n">일반면접</a></li>
        <li><a href="/interview/steps_r">채용공고면접</a></li>
        <li><a href="/interview/steps_k">맟춤면접</a></li>
        <li><a href="/interview/steps_m">멘토면접</a></li>
      </ul>
    </li><li class="dropdown"><a href="/board/"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
      <ul>
        <li><a href="/board/">전체질문</a></li>
        <li><a href="/review/board_review">면접후기</a></li>
        <!-- 삭제 
        <li><a href="/board/free">자유게시판</a></li>
        -->
        <li><a href="/board/recommend">면접질문</a></li>
        <li><a href="/board/best_answers">모범답안</a></li>
      </ul>
    </li>
    <li><a href="/recruit/">채용공고</a></li>
 
    
    <sec:authorize access="isAnonymous()">
      <li class="dropdown"><a href="#"><span>회원가입</span> <i class="bi bi-chevron-down"></i></a>
        <ul>
          <li><a href="/join_indv">일반회원</a></li>
          <li><a href="/join_com">기업회원</a></li>
        </ul>
      </li>
    </sec:authorize>
       <sec:authorize access="isAnonymous()">
      <li><a href="/userLogin">로그인</a></li>
    </sec:authorize>
    <!-- my page 링크 -->
    <sec:authentication property="principal" var="user"/> 
    <sec:authorize access="isAuthenticated()">
		  <li class="dropdown">
        <a href="#"><span>${user.name}님<c:if test="${fn:contains(user.type, 'C')}">(기업)</c:if></span> 
          <i class="bi bi-chevron-down"></i>
        </a>
        <ul>
          <li><a href="/profile">프로필</a></li>
          <li><a href="/mypage/">마이페이지</a></li>
          <li><a href="/logout">로그아웃</a></li>
        </ul>
      </li>
  
    </sec:authorize>
  </ul>
  <i class="bi bi-list mobile-nav-toggle"></i>
  
      
      
      
</nav><!-- .navbar -->	  

    </div>
  </header><!-- End Header -->
