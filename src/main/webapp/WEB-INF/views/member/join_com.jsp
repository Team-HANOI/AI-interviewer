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
  <jsp:include page="../common/top_t.jsp"/>
    <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
  <!-- 페이지 스타일 -->
  <link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">

</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>
  
  <main id="main">
  	<section class="portfolio">
      <div class="container">
		<!-- 작업공간 시작-->
		
		
		
	      <!-- 기업회원가입 팝업 -->
			<div class="join-business-form">
			    <form action="/join_com" method="POST" enctype="multipart/form-data" class="login join-business"> 
			        <h1 class="join-title" style="font-size: 29px; margin-bottom: 21px;">기업 계정 만들기</h1>
			        <span style="font-size: small;
    color: darkgray;">로고 이미지</span>
			        <div class="join-sub">
			            <!--로고 이미지-->
			            <div class="profile-outer">
			                <div class="profile-inner">
			                
			                
			                
                              <div class = "box" style="position:relative;width: 59px;">
                               <div class = "front" style="float:left;position:absolute;top: 0; left: 0;">
                                 <img id="what"class="profile-img" width="60px" height="60px" src = "https://user-images.githubusercontent.com/68311318/132971960-7fd53f42-2f85-4c74-bc56-b1b1f9977139.png">
                               </div>
                                <input type="file" accept="image/*"  name = "pfImg"onchange="showMyImage(this)" id="file" style="display:none"/>
                               <div class = "back" style="float:left;position:absolute;top: 0; right: 0;z-index:-1">
                               
                               </div>
                             </div>
			                
			                
			                
			                
			                <input type="file" accept="image/*"  name = "logoImg"onchange="showMyImage(this)" id="file" style="display:none"/>
			                <img id="myThumbnail" class="profile-img" width="60px" height="60px" 
			                 src="https://user-images.githubusercontent.com/68311318/132785291-20570046-88cd-4f46-95df-2d87e2259ce4.png">
			                 
			                 
			                 
			                 
			                 
			                </div>
			            </div>
			        </div>    
			            
			        <div class="join-holder" style="margin-top: 14px;">    
			            <!-- 구분선 -->
			            <div style="clear:both"></div>
			
			            <label for="">회사명<span style="color:red;">*</span></label>
			            <input class="join-input holder" type="text" name="cName" placeholder="회사명" required>
			            <label for="">회사 이메일<span style="color:red;">*</span></label>
			            <input class="join-input holder" type="email" name="cEmail" placeholder="회사 이메일" required>
			            <label for="">비밀번호<span style="color:red;">*</span></label>
			            <input class="join-input holder" type="password" name="pw" placeholder="비밀번호" required>
			            <label for="">비밀번호 확인<span style="color:red;">*</span></label>
			            <input class="join-input holder" type="password" placeholder="비밀번호 확인" required>
			            <label for="">담당자 성명<span style="color:red;">*</span></label>
			            <input class="join-input holder" type="text" name="name" placeholder="담당자 성명" required>
			            <label for="">담당자 이메일<span style="color:red;">*</span></label>
			            <input class="join-input holder" type="email" name="email" placeholder="담당자 이메일" required>
			            
			            <div class="join-confirm">
			                <input class="btn join-btn" type="submit" value="기업회원 가입하기">
			            </div>
			        </div>
			
			    </form>
      </div>
      
      
    <script type="text/javascript">
       function showMyImage(fileInput) {
           var files = fileInput.files;
           for (var i = 0; i < files.length; i++) {           
               var file = files[i];
               var imageType = /image.*/;     
               if (!file.type.match(imageType)) {
                   continue;
               }           
               var img=document.getElementById("myThumbnail");            
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
    	        $('#myThumbnail').click();
    	       });
    	      });
       
       $(function () {
         $('#myThumbnail').click(function (e) {
            e.preventDefault();
           $('#file').click();
          });
         });
       
       function changeValue(obj){
         alert(obj.value);
       }
    </script>
    
    
    
    
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
  
  
  
</body>
</html>


