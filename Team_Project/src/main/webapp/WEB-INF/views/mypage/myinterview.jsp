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
                <div class="mypage-content-title">내 면접</div>
                <div class="line"></div>
                
                
						  
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-list">
                        <ul> 
                              <c:forEach items="${list}" var="interviewRecord">
                              <li>
                                    <a class='move' href='<c:out value="${interviewRecord.iRecordId}"/>'>
                                     <fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${interviewRecord.regdate}"/>
                                     <c:choose>
																			<c:when test="${interviewRecord.iTypeId eq '1'}">일반</c:when>
																			<c:when test="${interviewRecord.iTypeId eq '2'}">맞춤</c:when>
																			<c:when test="${interviewRecord.iTypeId eq '3'}">멘토 모드</c:when>
																			<c:when test="${interviewRecord.iTypeId eq '4'}">채용공고 모드</c:when>
																		</c:choose> 면접
                                    </a>
                              </li>
                              </c:forEach>
                        </ul>
                    <!-- 페이징 시작 -->
										  <c:if test="${pageMaker.prev}">
										    <a class= "paginate_button" href="${pageMaker.startPage-1}">이전</a>
										  </c:if>
										  
										  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										    <a class= "paginate_button"  href="${num}">${num} </a>
										  </c:forEach>
										  
										  <c:if test="${pageMaker.next}">
										    <a class= "paginate_button" href="${pageMaker.endPage+1}">다음</a>
										  </c:if>
										<!-- 페이징 끝 -->
                    </div>    
                </form>
            </div>
        </div>
        
      <form id="actionForm" action="/mypage/myinterview" method="get">
	      <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
	      <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
	            <!-- 페이지 번호를 클릭해서 이동할때도 검색조건, 키워드는 같이 전달 -->
	      <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
	      <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
     </form>
        
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    var actionForm = $("#actionForm");
    /*페이지 번호 클릭했을때 그 페이지로 이동*/
    $(".paginate_button").on("click", function(e) {
        e.preventDefault();
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.submit();
      });
    
    /*조회페이지로 이동.pageNum과 amount도 함꼐 전송한다*/
    $(".move").on("click", function(e) {
      e.preventDefault();
      actionForm.append("<input type='hidden' name='iRecordId' value='" + $(this).attr("href") + "'>");
      actionForm.attr("action", "/mypage/myinterview/detail");
      actionForm.submit();
    });
    </script>
</body>
</html>


