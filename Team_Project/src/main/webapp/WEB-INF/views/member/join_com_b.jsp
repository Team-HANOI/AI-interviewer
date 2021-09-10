<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
  <!-- 페이지 스타일 -->
  <link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 구분선 -->
    <div class="line"></div>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
      <!-- 팝업 -->
	    <!-- 팝업배경 더미 -->
	    <div class="popup-dummy"></div>
	    
	    <!-- 키워드 카드 팝업 -->
	    <jsp:include page="../common/popups/popup_keyword.jsp"/>
	    
	    <div class="dummy"></div>
	        
	        
	     <!-- 기업회원가입 팝업 -->
<div class="join-business-form">
    <form action="/join_com" method="POST" enctype="multipart/form-data" class="login join-business"> 
        <h1 class="join-title">기업 회원가입</h1>
        <span class>로고 이미지</span>
        <div class="join-sub">
            <!--로고 이미지-->
            <div class="profile-outer">
                <div class="profile-inner">
                
                <input type="file" accept="image/*"  name = "logoImg"onchange="showMyImage(this)" id="file" style="display:none"/>
                <img id="thumbnail" class="profile-img" width="60px" height="60px" src="../image/default_pf_img.jpg">
                </div>
            </div>
        </div>    
            
        <div class="join-holder">    
            <!-- 구분선 -->
            <div style="clear:both"></div>

            <label for="">회사명</label>
            <input class="join-input holder" type="text" name="cName" placeholder="회사명" required>
            <label for="">회사 이메일</label>
            <input class="join-input holder" type="email" name="cEmail" placeholder="회사 이메일" required>
            <label for="">비밀번호</label>
            <input class="join-input holder" type="password" name="pw" placeholder="비밀번호" required>
            <label for="">비밀번호 확인</label>
            <input class="join-input holder" type="password" placeholder="비밀번호 확인" required>
            <label for="">담당자 성명</label>
            <input class="join-input holder" type="text" name="name" placeholder="담당자 성명" required>
            <label for="">담당자 이메일</label>
            <input class="join-input holder" type="email" name="email" placeholder="담당자 이메일" required>
            
            <div class="join-confirm">
                <input class="btn join-btn" type="submit" value="기업회원 가입하기">
            </div>
        </div>

    </form>
</div>

    </main>

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
    </script>
    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>



