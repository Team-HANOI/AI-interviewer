<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav_main.jsp"/>
  
  <!-- ======= Hero Section ======= -->
  <section id="" class="h-100" 
  style="background-image: url('/image/i_recruit.jpg');
  background-size:cover; background-position:center;
  position: relative;">
  	<div class="w-100 h-100 bg-dark" style="position:absolute;
  	top:0; opacity:.5;"></div>
  </section><!-- End Hero -->
  
  <main id="main">
  
  <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">
          
          
          
          </div>
          <!-- End blog entries list -->
          <!--  <!-- 사이드 메뉴 -->
          <div class="col-lg-4">

            <div class="sidebar">
                 <ul>
			            <a href="/mypage/"><li >프로필</li></a>
			            <a href="/mypage/myinterview"><li>내 면접 기록</li></a>
			            <a href="/mypage/mentoring"><li>(개인)멘토링</li></a>
			            <a href="/mypage/mentoring/com" ><li>(기업)멘토링</li></a>
			            <a href="/mypage/pwchange"><li>비밀번호 변경</li></a>
			            <a href="/mypage/delete"><li>계정 삭제</li></a>
                 </ul>
            </div>

          </div>


        </div>

      </div>
    </section>
    <!-- End Blog Section -->
  
  
  
  
  
  
  
		<!-- 작업공간 시작-->
		  
		<!-- 작업공간 끝-->
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

</body>
</html>








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
                <div class="mypage-content-title">⚡️${user.name}의 면접 기록</div>
                <div class="line"></div>
                
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-list">
                        <ul> 
                              <c:forEach items="${list}" var="interviewRecord">
                              
                              <li>
                                    <a class='move' href='<c:out value="${interviewRecord.iRecordId}"/>'>
                                     <fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${interviewRecord.regdate}"/> 의 면접 기록
                                    </a>
                                    <a>
                                      <c:choose>
                                        <c:when test="${interviewRecord.iTypeId eq '1'}"><span class="badge rounded-pill bg-primary type1" >💡일반 모드</span></c:when>
                                        <c:when test="${interviewRecord.iTypeId eq '2'}"><span class="badge rounded-pill bg-success type2" >✅맞춤 모드</span></c:when>
                                        <c:when test="${interviewRecord.iTypeId eq '3'}"><span class="badge rounded-pill bg-danger type3" >🚀멘토 모드</span></c:when>
                                        <c:when test="${interviewRecord.iTypeId eq '4'}"><span class="badge rounded-pill bg-warning text-dark type4" >👔채용공고 모드</span></c:when>
                                      </c:choose>
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
        <input type='text' name='q' value='<c:out value="${pageMaker.cri.q}"/>'/>
        <button>검색</button>
      </form>


