<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a href = "/mypage/">
                <button class="join-btn btn" >취소</button>
                </a>
                
                  <sec:authentication property="principal" var="user"/>
                  
                <form id="form" method="POST" action = "/mypage/profile_edit" class="mypage-content" enctype="multipart/form-data"> 
                  <button id = "submit-btn" class="join-btn btn" type="submit">저장</button>
                      <div class="join-text">
                        <a id = "warn"href="#" onclick="javascript:showPwAlert()" style="color:red;display: none">주요 기술을 한 개 이상 체크해주세요</a>
                      </div>
                  <div class="line"></div>
                  <!-- 사용자 정보 -->
                    <div class="mypage-content-profile">
                        <ul>
                            <li>
                                <span class="pfText">프로필 </span>
                                
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
                                            <input type="file" accept="image/*"  name = "pfImg"onchange="showMyImage(this)" id="file" style="display:none"/>
                                              <img id="thumbnail" class="profile-img" width="200px" height="200px" src='<c:url value="/mypage/img/${file.fileId}"/>'
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
                                    
                                    <c:forEach var="item" items="${kwList}">
                                      <input type="checkbox" name="kws" value="${item.kw}"
                                        <c:forEach var="pSkill" items="${pSkillList}">
                                          <c:if test="${item.kw eq pSkill}">
                                            checked
                                          </c:if>
                                        </c:forEach>
                                      > <span class="btn lightgrey btnlabel">${item.kw}</span><br>
                                    </c:forEach>
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
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
    
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
