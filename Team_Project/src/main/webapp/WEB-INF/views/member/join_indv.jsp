
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
  <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
  <!-- 페이지 스타일 -->
  <link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 구분선 -->
    <div class="line"></div>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
      <!-- 팝업 -->
	    <!-- 팝업배경 더미 -->
	    <div class="popup-dummy"></div>
	    
	    <!-- 키워드 카드 팝업 -->
	    <jsp:include page="../common/popups/popup_keyword.jsp"/>
	    
	    <div class="dummy"></div>
	        
	        
	        <!-- 일반회원가입 팝업 -->
			<div class="join-individual-form">
			    <form action="" method="POST" class="login join-person">
			        <h1 class="join-title">ALPACA 계정 만들기</h1>
			        <div class="join-holder">    
			            <!-- 구분선 -->
			            <div class="line"></div> 
			            <div style="clear:both"></div>
			            <label for="">이름</label>
			            <input class="join-input holder" type="text" placeholder="이름">
			            <label for="">이메일</label>
			            <input class="join-input holder" type="email" placeholder="이메일">
			            <label for="">비밀번호</label>
			            <input class="join-input holder" type="password" placeholder="비밀번호">
			            <label for="">비밀번호 확인</label>
			            <input class="join-input holder" type="password" placeholder="비밀번호 확인">
			            
			            <div class="join-confirm">
			                <input class="join-btn btn" type="button" value="일반회원 가입하기">
			            </div>
			        </div>
			
			    </form>
			</div>

    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>



