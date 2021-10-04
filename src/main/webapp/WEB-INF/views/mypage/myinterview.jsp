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
  

  
  <main id="main">
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>내 면접 기록</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>내 면접 기록</li>
          </ol>
        </div>

      </div>
    </section>
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
                <sec:authentication property="principal" var="user"/>
                <div class="mypage-content-title" style="font-size: x-large;
    font-weight: normal;">⚡️${user.name}의 면접 기록</div>
                <div class="line" style="width: 102%;"></div>
                
                <div style="font-size: 20px;color: gray;user-select: auto;margin: 30px 0px 10px 0px;"><i class="bi bi-award-fill"></i> 총 ${sum }회</div>
						     <!-- 잔디 시작 -->
						        <div class="graph" style="margin: 0; padding-left: 0; padding-right:0px; width: 1117px; ">
						          <ul class="months"style="margin: 0; color: darkgray;">
						            <li>Oct</li>
						            <li>Nov</li>
						            <li>Dec</li>
						            <li>Jan</li>
						            <li>Feb</li>
						            <li>Mar</li>
						            <li>Apr</li>
						            <li>May</li>
						            <li>Jun</li>
						            <li>Jul</li>
						            <li>Aug</li>
						            <li>Sep</li>
						          </ul>
						          <ul class="days" style="padding-left: 1rem;     font-size: 12px; color: darkgray;">
						            <li>Sun</li>
						            <li>Thu</li>
						            <li>Fri</li>
						            <li>Sat</li>
						            <li>Sun</li>
						            <li>Mon</li>
						            <li>Tue</li>
						          </ul>
						          <ul class="squares" style="padding-left: 0;">
						            <!-- added via javascript -->
						          </ul>
						        </div>
						        <!-- 잔디 끝 -->
					        <div style="color:darkgray;"><i class="bi bi-exclamation-triangle"></i>날짜는 한국 시간 기준으로 매일 자정에 변경됩니다.</div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-list">
                        <ul style="padding-left:0"> 
                        <c:if test="${pageMaker.cri.keyword != null}">
	                        <a href="/mypage/myinterview">
	                        <span class="badge rounded-pill bg-secondary" style="font-weight:normal;">전체 보기</span>
	                        </a>
                        </c:if>
                              <c:forEach items="${list}" var="interviewRecord">
                              
                              <li style="padding-left:0; width: 102%;">
                                    <a class='move' href='<c:out value="${interviewRecord.iRecordId}"/>'>
                                     <fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${interviewRecord.regdate}"/>의 면접 기록
                                    </a>&nbsp;
                                    <a>
                                      <c:choose>
                                        <c:when test="${interviewRecord.iTypeId eq '1'}"><span class="badge rounded-pill bg-primary type1" style="font-weight: normal;cursor:pointer;">💡일반 모드</span></c:when>
                                        <c:when test="${interviewRecord.iTypeId eq '2'}"><span class="badge rounded-pill bg-warning text-dark type2" style="font-weight: normal;cursor:pointer;">👔채용공고 모드</span></c:when>
                                        <c:when test="${interviewRecord.iTypeId eq '3'}"><span class="badge rounded-pill bg-success type3" style="font-weight: normal;cursor:pointer;">✅맞춤 모드</span></c:when>
                                        <c:when test="${interviewRecord.iTypeId eq '4'}"><span class="badge rounded-pill bg-danger type4" style="font-weight: normal;cursor:pointer;">🚀멘토 모드</span></c:when>
                                      </c:choose>
                                    </a>
                              </li>
                              </c:forEach>
                        </ul>
                        
                        <!-- 페이징 시작 -->
                        <nav aria-label="Page navigation example">
											  <ul class="pagination">
											  
		                      <c:if test="${pageMaker.prev}">
												    <li class="page-item"style="border-bottom: 0px solid;padding: 0; margin: 0;">
												      <a class="paginate_button page-link" href="${pageMaker.startPage-1}" aria-label="Previous" style="">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
		                      </c:if>
		                      
		                      
		                      <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                      
											    <li class="page-item 
											    
											     <c:if test="${pageMaker.cri.pageNum == num}">
											     active
                          </c:if>
											    
											    
											    " style="border-bottom: 0px solid;padding: 0;margin: 0;">
											     <a class="page-link paginate_button"  href="${num}">${num}</a>
											    </li>
											    
		                      </c:forEach>
											    
		                      <c:if test="${pageMaker.next}">
			                      <li class="page-item"style="border-bottom: 0px solid;padding: 0;margin: 0;">
	                            <a class="page-link paginate_button" href="${pageMaker.endPage+1}" aria-label="Next">
	                              <span aria-hidden="true">&raquo;</span>
	                            </a>
	                          </li>
		                      </c:if>
											    
											    
											    
											  </ul>
											</nav>
                        <!-- 페이징 끝 -->
                        
                    </div>    
                </form>
            </div>
            
        </div>
        
        
        
        
      <!-- 검색폼 시작 -->
      <form id = 'searchForm' action="/mypage/myinterview" method="get">
       <input type="hidden" name="type" value='T'>
       <input type='hidden' name='keyword' value=''/>
       <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
       <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
      </form>
    <!-- 검색폼 끝 -->
      
        
      <form id="actionForm" action="/mypage/myinterview" method="get">
        <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
              <!-- 페이지 번호를 클릭해서 이동할때도 검색조건, 키워드는 같이 전달 -->
        <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
        <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
     </form>
        
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
    
    /*검색 버튼의 이벤트 처리*/
    var searchForm = $("#searchForm");
    var type1 = $(".type1");
    var type2 = $(".type2");
    var type3 = $(".type3");
    var type4 = $(".type4");
      
    type1.on("click", function(e){
      
      /* 일반모드 1, 멘토모드 3 등*/
      searchForm.find("input[name='keyword']").val("1");
      
      /*pageNum을 현재 페이지 번호에서 1로 바꾼다. 즉 검색 후 1페이지로 이동하게 한다*/
      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      
      searchForm.submit();
    });
    type2.on("click", function(e){
      
      /* 일반모드 1, 멘토모드 3 등*/
      searchForm.find("input[name='keyword']").val("2");
      
      /*pageNum을 현재 페이지 번호에서 1로 바꾼다. 즉 검색 후 1페이지로 이동하게 한다*/
      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      
      searchForm.submit();
    });
    type3.on("click", function(e){
      
      /* 일반모드 1, 멘토모드 3 등*/
      searchForm.find("input[name='keyword']").val("3");
      
      /*pageNum을 현재 페이지 번호에서 1로 바꾼다. 즉 검색 후 1페이지로 이동하게 한다*/
      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      
      searchForm.submit();
    });
    type4.on("click", function(e){
      
      /* 일반모드 1, 멘토모드 3 등*/
      searchForm.find("input[name='keyword']").val("4");
      
      /*pageNum을 현재 페이지 번호에서 1로 바꾼다. 즉 검색 후 1페이지로 이동하게 한다*/
      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      
      searchForm.submit();
    });
    
    
    </script>
    
    <!-- 잔디 -->
  <script type="text/javascript">
    var dayArr = new Array();
    
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;
    dayArr[363] = dateString;
    
    for(var i = 362; i >= 0; i--) {
      today = new Date(today.setDate(today.getDate() - 1));
      year = today.getFullYear();
      month = ('0' + (today.getMonth() + 1)).slice(-2);
      day = ('0' + today.getDate()).slice(-2);
  
      dateString = year + '-' + month  + '-' + day;
      dayArr[i] = dateString;
    }

      var arr = new Array();
      <c:forEach items="${intArr}" var="item">        
              arr.push("${item}");
      </c:forEach>
    const squares = document.querySelector('.squares');
    for (var i = 0; i < 364; i++) {
      console.log(arr[i]);
      const level = Math.floor(Math.random() * 3);  
      squares.insertAdjacentHTML('beforeend', `<li style="border-radius: 3px;" data-level="\${arr[i]}" data-bs-toggle="tooltip" data-bs-placement="top" title="\${dayArr[i]}: 면접 \${arr[i]}번 완료"></li>`);
    }
    </script>
    
    <!-- 부트스트랩 tooltip -->
    <script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl)
    })
    </script>
  
</body>
</html>
