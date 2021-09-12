<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- 잔디 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="/style/jandi.css">
<!-- 잔디 css 끝 -->

  <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
  <!-- 페이지 스타일 -->
  <link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">


<jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>
  
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
                    <c:when test="${interviewRecord.iTypeId eq '1'}">일반 모드</c:when>
                    <c:when test="${interviewRecord.iTypeId eq '2'}">맞춤 모드</c:when>
                    <c:when test="${interviewRecord.iTypeId eq '3'}">멘토 모드</c:when>
                    <c:when test="${interviewRecord.iTypeId eq '4'}">채용공고 모드</c:when>
                  </c:choose> 면접 기록</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <div class="mypage-content">
                
                <c:if test="${not empty interviewRecord.answerVOList}">
                  <c:forEach items="${interviewRecord.answerVOList}" var="answer" varStatus="status">
                  
                      <!-- 질의 응답-->
                      <div class="dialyMT">
                          <table class="mypageTb">
                              <tr>
                                  <td class="mypageTb-02ax">
                                      <span style="font-weight: bold;">질문 ${status.count}. </span><span id="question${status.count}"> ${answer.questionVO.content}</span>
                                  </td>
                                  <td class="mypageTb-03ax">
                                      <button type="button" class="playBtn" id="speaker${status.count}">🔊질문 듣기</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="mypageTb-01ax">
                                      <p style="text-align: left;">${answer.content}</p>
                                  </td>
                                  <td class="mypageTb-04ax">
                                        <audio controls>
                                          <source src='<c:url value="/mypage/audio/${answer.fileVO.fileId}"/>' type="audio/ogg">
                                        </audio>
                                  </td>
                              </tr>
                          </table>
                      </div>
                  </c:forEach>
                </c:if>
                  <br>
                  <h4 style="float: left;">✏️메모</h4> <button style="float: right;"type="button" class="btn btn-success">저장</button>
                  <textarea class="form-control" rows="5" cols="100"></textarea>
                  <br>
                  <button data-oper='list' class="btn btn-secondary" >목록으로 돌아가기</button>
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
  
  
  
  <script>
for(let i = 0; i < 20; i++) {
  $(function() {
    $("#speaker"+i).click(function() {
      requestVoice($("#question"+i).text());
    });
  });
  
}
function requestVoice(questionText) {
  var request = new XMLHttpRequest();
  request.responseType = "blob";
  request.onload = function() {
    var audioURL = URL.createObjectURL(this.response);  
    var audio = new Audio();
    audio.src = audioURL;
    audio.play();
  }
  request.open("POST", '/interview/questionvoice');
  request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  var params = "question="+questionText;
  request.send(params);
}
</script>    
    
    
    
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
  
</body>
</html>


