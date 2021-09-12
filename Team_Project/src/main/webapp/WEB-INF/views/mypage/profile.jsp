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

  <!-- 페이지 스타일 -->
    <jsp:include page="../common/top.jsp"/>


<jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>
  
  <main id="main">
  
  <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>프로필 관리</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>프로필 관리</li>
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
                       
                <sec:authentication property="principal" var="user"/>
                <!-- 유저정보 제목 -->
                <div class="mypage-content-title" style="font-size: x-large;
    font-weight: normal;">프로필
                  <a style="float: right;"href = "/mypage/profile_edit">
                    <button type="button" class="btn btn-secondary">편집</button>
                  </a>
                </div> 
                
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <div class="mypage-content-profile">
                        <ul style="padding-left:0px;">
                        
                            <li>
                                <div class="pfInfoOuter">
                                    <div clas="pfInfoInner">
                                        <div class="pfInfoInnerLeft">
                                        
                                        <c:set var="len" value="${fn:length(loginUserProfileImageFile.fileName)}" />
                                        <c:set var="filetype"
                                          value="${fn:toUpperCase(fn:substring(loginUserProfileImageFile.fileName, len-4, len))}" />
                                        <c:choose>
                                          <c:when
                                            test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
                                            <img class="profile-img" width="200px" height="200px" src='<c:url value="/mypage/img/${loginUserProfileImageFile.fileId}"/>'
                                              width="1000" class="img-thumbnail">
                                            <br>
                                          </c:when>
                                          <c:otherwise>
                                            <a href='<c:url value="/mypage/pds/${loginUserProfileImageFile.fileId}"/>'>${loginUserProfileImageFile.fileName}</a>
                                            <br>
                                          </c:otherwise>
                                        </c:choose>
                                        
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">기본 정보</span><br><br>
                                
                                <span class="pfInfo" >${user.name}</span>
                                <span class="pfInfo" >${user.email}</span>
                                <span class="pfInfo" >${user.phoneNum}</span>
                            </li>
                            <li>
                                <span class="pfText">Github 주소</span>
                                <input class="pfIntro" type="text" value = "${profile.githubUrl}"readonly>
                            </li>
                            <li>
                                <span class="pfText">주요 기술<span class="sm-grey"></span></span>
                                <div style="display: block;margin-top: 10px;">
                                <c:forEach var="pSkill" items="${pSkillList}">
                                <span style="font-weight: normal;" class="badge rounded-pill bg-secondary">${pSkill}</span>
                                </c:forEach>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">희망 직무<span class="sm-grey"></span></span>
                                <span class="pfInfo" >${profile.pos}</span>
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
     <!-- 잔디 시작 -->
        <div class="graph">
          <ul class="months">
            <li>Sep</li>
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
          </ul>
          <ul class="days">
            <li>Sun</li>
            <li>Mon</li>
            <li>Tue</li>
            <li>Wed</li>
            <li>Thu</li>
            <li>Fri</li>
            <li>Sat</li>
          </ul>
          <ul class="squares">
            <!-- added via javascript -->
          </ul>
        </div>
        <!-- 잔디 끝 -->
        
        
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
      squares.insertAdjacentHTML('beforeend', `<li data-level="\${arr[i]}" type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="\${dayArr[i]}: 면접 \${arr[i]}번 완료"></li>`);
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


