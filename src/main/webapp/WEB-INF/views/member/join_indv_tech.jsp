
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
	        
	        
			    <!-- 주요 기술 팝업 -->
			    <div id="popTech">
			        <div class="popTechBg"></div>
			        <div class="popTechFg">
			            <h1>주요기술</h1>
			            <div class="tech-text">자신 있는 기술을 최대 3개 선택하세요.</div>
			            <div class="tech-component">
			                <input type="checkbox" name="tech-group" value="CSS"><span class="btn lightgrey btnlabel">CSS</span>     
			                <input type="checkbox" name="tech-group" value="HTML"><span class="btn lightgrey btnlabel">HTML</span> 
			                <input type="checkbox" name="tech-group" value="JAVA"><span class="btn lightgrey btnlabel">JAVA</span> <br>
			                <input type="checkbox" name="tech-group" value="JavaScript"><span class="btn lightgrey btnlabel">JavaScript</span> 
			                <input type="checkbox" name="tech-group" value="Spring"><span class="btn lightgrey btnlabel">Spring</span> 
			                <input type="checkbox" name="tech-group" value="MyBatis"><span class="btn lightgrey btnlabel">MyBatis</span> 
			            </div>
			        </div>
			    </div>

    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>



