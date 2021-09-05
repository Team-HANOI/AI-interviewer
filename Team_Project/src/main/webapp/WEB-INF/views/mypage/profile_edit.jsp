<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                  
                <form action="" method="POST" class="mypage-content">
                <button class="join-btn btn" type="submit">저장</button>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                    <div class="mypage-content-profile">
                        <ul>
                            <li>
                                <span class="pfText">프로필 </span>
                                
                                <div class="pfInfoOuter">
                                    <div clas="pfInfoInner">
                                        <div class="pfInfoInnerLeft">
                                            <input type="file" accept="image/*"  onchange="showMyImage(this)" id="file" style="display:none"/>
                                            <img id="thumbnail" class="profile-img" width="200px" height="200px" src="../image/alpaca.jpg">
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">기본 정보</span><br><br>
                                <span class="pfInfo" >핸드폰 번호 </span>
                                <input class="pfIntro" type="text" value="zz">
                                <span class="pfInfo" >이메일 주소</span>
                                <input class="pfIntro" type="text" value="zz">
                            </li>
                            <li>
                                <span class="pfText">Github 주소</span>
                                <input class="pfIntro" type="text" value="zz">
                            </li>
                            <li>
                                <span class="pfText">주요 기술<span class="sm-grey"></span></span>
                                <div style="display: block;margin-top: 10px;">
									                  <div class="tech-component">
									                      <input type="checkbox" name="tech-group" value="CSS"><span class="btn lightgrey btnlabel">CSS</span>     
									                      <input type="checkbox" name="tech-group" value="HTML"><span class="btn lightgrey btnlabel">HTML</span> 
									                      <input type="checkbox" name="tech-group" value="JAVA"><span class="btn lightgrey btnlabel">JAVA</span> <br>
									                      <input type="checkbox" name="tech-group" value="JavaScript"><span class="btn lightgrey btnlabel">JavaScript</span> 
									                      <input type="checkbox" name="tech-group" value="Spring"><span class="btn lightgrey btnlabel">Spring</span> 
									                      <input type="checkbox" name="tech-group" value="MyBatis"><span class="btn lightgrey btnlabel">MyBatis</span> 
									                  </div>
                                </div>
                            </li>
                            <li>
                                <span class="pfText">한줄 소개</span>
                                <textarea class="pfIntro pfTextLight" rows="3">안녕하세요</textarea>
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
   </script>
</body>
</html>


