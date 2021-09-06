<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 구분선 -->
    <div class="line"></div>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    
    	<!-- 팝업 -->
        <jsp:include page="../common/popups/popups.jsp"/>

		<!-- 타이틀 더미 -->
        <div class="dummy"></div>
        
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
                <div class="mypage-content-title">프로필 관리</div>
	                <a href = "/mypage/profile_edit">
	                  <button class="join-btn btn" >프로필 편집</button>
	                </a>
                <div class="line"></div>
                
                
                <sec:authentication property="principal" var="user"/>
                
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-profile">
                        <ul>
                            <li>
                                <span class="pfText">프로필 </span>
                                
                                <div class="pfInfoOuter">
                                    <div clas="pfInfoInner">
                                        <div class="pfInfoInnerLeft">
                                        
                                        <c:set var="len" value="${fn:length(file.fileName)}" />
												                <c:set var="filetype"
												                  value="${fn:toUpperCase(fn:substring(file.fileName, len-4, len))}" />
												                <c:choose>
												                  <c:when
												                    test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
												                    <img class="profile-img" width="200px" height="200px" src='<c:url value="/mypage/img/${file.fileId}"/>'
												                      width="1000" class="img-thumbnail">
												                    <br>
												                  </c:when>
												                  <c:otherwise>
												                    <a href='<c:url value="/mypage/pds/${file.fileId}"/>'>${file.fileName}</a>
												                    <br>
												                  </c:otherwise>
												                </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">기본 정보</span><br><br>
                                <span class="pfInfo" >${user.phoneNum} </span>
                                <span class="pfInfo" >${user.email}</span>
                            </li>
                            <li>
                                <span class="pfText">Github 주소</span>
                                <input class="pfIntro" type="text" value = "${profile.githubUrl}"readonly>
                            </li>
                            <li>
                                <span class="pfText">주요 기술<span class="sm-grey"></span></span>
                                <div style="display: block;margin-top: 10px;">
                                    <button class="btn dark" type="button">Java</button>
                                    <button class="btn dark" type="button">Spring</button>
                                    <button class="btn dark" type="button">MyBatis</button>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">한줄 소개</span>
                                <textarea class="pfIntro pfTextLight" rows="3" readonly>${profile.bio}</textarea>
                            </li>
                        </ul>
                            
                    </div> 
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


