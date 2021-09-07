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
                <div class="dateMT"><fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${interviewRecord.regdate}"/> 
                  <c:choose>
                    <c:when test="${interviewRecord.iTypeId eq '1'}">일반</c:when>
                    <c:when test="${interviewRecord.iTypeId eq '2'}">맞춤</c:when>
                    <c:when test="${interviewRecord.iTypeId eq '3'}">멘토 모드</c:when>
                    <c:when test="${interviewRecord.iTypeId eq '4'}">채용공고 모드</c:when>
                  </c:choose> 면접 기록</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <div class="mypage-content">
                
                <c:forEach items="${interviewRecord.answerVOList}" var="answer">
                    <!-- 질의 응답-->
                    <div class="dialyMT">
                        <table class="mypageTb">
                            <tr>
                                <td class="mypageTb-02ax">
                                    <p>질문. ${answer.questionVO.content}</p>
                                </td>
                                <td class="mypageTb-03ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="mypageTb-01ax">
                                    <p>${answer.content}</p>
                                </td>
                                <td class="mypageTb-04ax">
                                    <button type="button" class="playBtn">${answer.fileVO.fileName}듣기</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </c:forEach>
                
							    <button data-oper='list'>목록으로 돌아가기</button><br>
                </div>
							    
							    
							    
                
                  <form id="operForm" action="/mypage/myinterview/detail" method="get">
							      <input type="hidden" id="iRecordId" name="iRecordId" value='<c:out value="${interviewRecord.iRecordId}"/>'>
							      <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
							      <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
							      <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
							      <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
						      </form>
            </div>
        </div>
    </main>
<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");
  $("button[data-oper='list']").on("click", function(e) {
    operForm.find("#iRecordId").remove();
    operForm.attr("action", "/mypage/myinterview").submit();
    operForm.submit();
  });
});
</script>
    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


