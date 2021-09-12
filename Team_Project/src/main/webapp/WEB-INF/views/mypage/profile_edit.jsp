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
 

 
                
                <form id="form" method="POST" action = "/mypage/profile_edit" class="mypage-content" enctype="multipart/form-data">
                <div class="mypage-content-title" style="font-size: x-large;
    font-weight: normal;">프로필 편집
                  <div style="float: right;">
                  <button class="btn btn-secondary" style="float: right;" id = "submit-btn"  type="submit">저장</button>
                  <a  href = "/mypage/">
                    <button style="float: right;
    margin-right: 5px;" type="button" class="btn btn-light" >취소</button>
                  </a>
                  </div>
                       <a id = "warn"href="#" onclick="javascript:showPwAlert()" style="color:red;display: none;font-weight:normal; font-size: 11px;
                       " >주요 기술을 한 개 이상 체크해주세요</a>
                  </div> 
                
                
                  <sec:authentication property="principal" var="user"/>
                  
                  
                      
                  <div class="line"></div>
                  <!-- 사용자 정보 -->
                    <div class="mypage-content-profile">
                        <ul style="padding-left:0px;">
                            <li style="padding-left: 0;">
                                <div class="pfInfoOuter">
                                    <div class="pfInfoInner">
                                        <div class="pfInfoInnerLeft">
                                            <!-- <img id="thumbnail" class="profile-img" width="200px" height="200px" src="../image/alpaca.jpg"> -->
                                            
                                            
                                            <!-- 사진을 누르면 파일첨부 창이 뜬다 -->
                                          <c:set var="len" value="${fn:length(file.fileName)}" />
                                          <c:set var="filetype"
                                            value="${fn:toUpperCase(fn:substring(file.fileName, len-4, len))}" />
                                          <c:choose>
                                            <c:when
                                              test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
                                              
                                              <div class = "box" style="position:relative;">
	                                              <div class = "front" style="float:left;position:absolute;top: 0; right: 0;">
	                                                <img id="what"class="profile-img" width="200px" height="200px" src = "https://user-images.githubusercontent.com/68311318/132971960-7fd53f42-2f85-4c74-bc56-b1b1f9977139.png">
	                                              </div>
	                                               <input type="file" accept="image/*"  name = "pfImg"onchange="showMyImage(this)" id="file" style="display:none"/>
	                                              <div class = "back" style="float:left;position:absolute;top: 0; right: 0;z-index:-1">
		                                              <img id="thumbnail" class="profile-img" width="200px" height="200px" src='<c:url value="/mypage/img/${file.fileId}"/>'
		                                                width="1000" class="img-thumbnail">
	                                              </div>
                                              </div>
                                              
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
                                <span class="pfInfo" >이름</span>
                                <input class="pfIntro" type="text" name ="name" value="${user.name }">
                                <span class="pfInfo" >이메일 주소</span>
                                <input class="pfIntro" type="text" value="${user.email } " readonly>
                                <span class="pfInfo" >휴대폰 번호</span>
                                <input class="pfIntro" type="text" name ="phoneNum" value="${user.phoneNum }">
                            </li>
                            <li>
                                <span class="pfText">Github 주소</span>
                                <input class="pfIntro" type="text" name = "githubUrl" value="${profile.githubUrl}">
                            </li>
                            <li>
                                <span class="pfText">주요 기술<span class="sm-grey"></span></span>
                                <div style="display: block; margin-top: 10px;">
                                    <div class="tech-component">
                                    
                                      <ul class="list-group" style="display: contents;">
                                        <c:forEach var="item" items="${kwList}">
																				  <li class="list-group-item" style="border-top-left-radius: 0;
    border-top-right-radius: 0;
    padding: 0.5rem 1rem;
    border: 1px solid rgba(0, 0, 0, 0.125);
    user-select: auto;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;">
																				    <input style="padding: 0 0 0 0 !important;" class="form-check-input me-1" type="checkbox" name="kws" value="${item.kw}" <c:forEach var="pSkill" items="${pSkillList}">
                                            <c:if test="${item.kw eq pSkill}">
                                              checked
                                            </c:if>
                                          </c:forEach> 
                                          aria-label="...">
																				    ${item.kw}
																				  </li>
																			   </c:forEach>
																			</ul>
                                    
	                                    <%-- c:forEach var="item" items="${kwList}">
	                                      <input type="checkbox" name="kws" value="${item.kw}"
	                                        <c:forEach var="pSkill" items="${pSkillList}">
	                                          <c:if test="${item.kw eq pSkill}">
	                                            checked
	                                          </c:if>
	                                        </c:forEach>
	                                      > <span class="btn lightgrey btnlabel">${item.kw}</span><br>
	                                    </c:forEach> --%>
	                                    
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">희망 직무<span class="sm-grey"></span></span>
                                <input class="pfIntro" type="text" name ="pos" value="${profile.pos }">
                            </li>
                            <li>
                                <span class="pfText">한줄 소개</span>
                                <textarea class="pfIntro pfTextLight" rows="3" name = "bio">${profile.bio }</textarea>
                            </li>
                        </ul>
                            
                    </div> 
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
  
  
  
  <script type="text/javascript">
     function showMyImage(fileInput) {
         var files = fileInput.files;
         for (var i = 0; i < files.length; i++) {           
             var file = files[i];
             var imageType = /image.*/;     
             if (!file.type.match(imageType)) {
                 continue;
             }           
             var img=document.getElementById("thumbnail");            
             img.file = file;    
             var reader = new FileReader();
             reader.onload = (function(aImg) { 
                 return function(e) { 
                     aImg.src = e.target.result; 
                 }; 
             })(img);
             reader.readAsDataURL(file);
         }    
     }
     
     $(function () {
     $('#what').click(function (e) {
          e.preventDefault();
        $('#thumbnail').click();
       });
      });
     
     $(function () {
    	 

     
       $('#thumbnail').click(function (e) {
          e.preventDefault();
         $('#file').click();
        });
       });
       
      function changeValue(obj){
        alert(obj.value);
                   }
      
      $(function () {
           $('#submit-btn').click(function (e) {
              if($("input:checkbox[name=kws]:checked").length == 0) {
              e.preventDefault();
              $("#warn").show();
                }
            });
           });
    </script>
  
</body>
</html>


