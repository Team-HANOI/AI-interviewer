
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
	        
	        
	    <!-- 일번회원가입 추가입력 폼 팝업 -->
			<div class="join-individual-extra-form">
			    <form action="main.html" method="GET" class="login join-business">
			        <h1 class="join-title">일반 회원가입</h1>
			        <span class="profile-text">프로필 이미지</span>
			        <div class="join-sub">
			            <!--로고 이미지-->
			            <div class="profile-outer">
			                <div class="profile-inner">
			                    <img class="profile-img" width="60px" height="60px" src="https://t1.daumcdn.net/cfile/tistory/997607385E69770E19">
			                    <span class="profile-img-name">profile.png</span>
			                    <button class="profile-upload-btn">upload</button>
			                </div>
			            </div>
			        </div>    
			
			        <div class="join-holder">    
			            <!-- 구분선 -->
			            <div class="line"></div> 
			            <div style="clear:both"></div>   
			            
			            <div style="clear:both"></div>
			            <label for="">휴대폰 번호</label>
			            <input class="join-input holder" type="text" placeholder="010-0000-0000">
			            <label for="">간단 소개</label>
			            <textarea class="join-input holder" placeholder="입력" rows=5></textarea>
			            <label for="">Git 저장소 주소</label>
			            <input class="join-input holder" type="text" placeholder="https://git.com">
			             <!-- 구분선 -->
			             <div class="line"></div> 
			            <label for="">주요 기술<span class="sm-grey">3개</span><button type="button" class="popTechBtn" onclick="showTech()"></button></label>
			            <button class="btn dark" type="button">Java</button>
			            <button class="btn dark" type="button">Spring</button>
			            <button class="btn dark" type="button">MyBatis</button>
			            <label for="">기술 태그<span class="sm-grey">3개</span></label>
			            <button class="btn lightgrey" type="button">CSS</button>
			            <button class="btn lightgrey" type="button">HTML</button>
			            <button class="btn lightgrey" type="button">JavaScript</button>
			            <!-- 구분선 -->
			            <div class="line"></div> 
			            <label for="">희망 직군</label>
			            <input type="radio" name="job-group" value="서버/백엔드"><span class="btn lightgrey">서버/백엔드</span>
			            <input type="radio" name="job-group" value="프론트엔드"><span class="btn lightgrey">프론트엔드</span>
			            <div class="join-confirm">
			                <input class="join-btn btn" type="submit" value="완료하기">
			            </div>
			        </div>
			    </form>
			
			    <!-- 주요 기술 팝업 -->
			    <div class="popTech" id="popTech">
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
			            <div class="tech-text">그 밖의 기술 등록</div>
			            <input type="text" name="tech-group-etc" class="tech-group-etc" >
			            <div class="join-confirm">
			                <input class="sub-admit-btn" type="button" onclick="javascript:subAdmit()" value="등록">
			                <input class="sub-cancel-btn" type="button" onclick="javascript:subCancel()" value="취소">
			            </div>
			        </div>
			    </div>
			</div>

    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>



