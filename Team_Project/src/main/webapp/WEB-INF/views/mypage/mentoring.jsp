<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                <div class="mypage-content-title">
                    <p>내가 신청한 멘토링</p>
                </div> 

                <div class="line"></div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="dialyMT">
                    
	                        <!-- <span class="dateMT">2021-08-17</span> -->
                        <table class="mypageTb">
                           <c:forEach items="${list}" var="mentorMode">
                              <a class='move' href='<c:out value="${mentorMode.mentorId}"/>'>
                              </a>
	                            <tr>
	                               
	                                <td class="mypageTb-0lax">
                                   <a class='move' href='<c:out value="${interviewRecord.iRecordId}"/>'>
		                                <fmt:formatDate pattern="MM월 dd일" value="${mentorMode.mentorDate }"/>
	                                 </a>
		                                </td>
		                                <td class="mypageTb-0lax">
		                                    <input type="time" class="tbCell" value="${mentorMode.startDate }">
		                                </td>
		                                <td class="mypageTb-0lax">
		                                    <span>시부터</span>
		                                </td>
		                                <td class="mypageTb-0lax">
		                                    <input type="time" class="tbCell" value="${mentorMode.endDate }">
		                                </td>
		                                <td class="mypageTb-0lax">
		                                    <span>시까지</span>
		                                </td>
		                                <td class="mypageTb-0lax">
		                                    <span>${mentorMode.company } ${mentorMode.mentorName } 멘토님</span>
		                                </td>
	                                <td class="mypageTb-0lax">
	                                    <button type="button" class="dltBtn btn btn">취소</button>
	                                </td>
	                            </tr>
                            </c:forEach>
                        </table> 
                    </div>  
                    
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


