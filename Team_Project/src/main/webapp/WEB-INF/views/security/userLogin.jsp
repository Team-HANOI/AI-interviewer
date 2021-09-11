<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
  <!-- 공통 스타일 -->
  <jsp:include page="../common/top.jsp"/>
  
</head>
<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>
  
  <main id="main">
  	<section class="portfolio">
      <div class="container-login">
	
		<!-- 작업공간 시작-->
		      <div class="login-individual-form">
            
                
            <div class="login-person join">
                <h1 class="join-title" style="padding-left:144px">MR. ALPACA 로그인</h1>
                <br>
                <br>
                <div class="join-sub">
                    <a href="/oauth2/authorization/google">
                      <button class="join-input google" >
                          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 48 48" class="abcRioButtonSvg google-logo">
                              <g>
                                  <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
                                  <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
                                  <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
                                  <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
                                  <path fill="none" d="M0 0h48v48H0z"></path>
                              </g>
                            </svg> 
                          <span class="logo-text">Google로 계속하기</span>
                        </button>
                      </a>
                    <div style="clear:both"></div>
                </div>
                <br>
	                
                <form action="/login_proc" method="post" class="login-person join">
	                <div class="join-holder">
	                <!-- 구분선 -->
	                     <div style="width:167%;">
	                      <div class="line" style="width:44%; float:left; background-color: #bdbdbd;"></div> 
		                    <div style="float: left;margin: 0px 15px 0px 15px;
    font-size: small;
    color: #bdbdbd;">또는</div>
	                      <div class="line" style="width:45%; float:left; background-color: #bdbdbd;"></div> 
	                     </div>
	                    <c:if test="${param.error != null}">
	                      <div class="join-text">
	                        <a href="#" onclick="javascript:showPwAlert()" style="color:red;">${error_message}</a>
	                      </div>
	                    </c:if>
	                    <br>
	                    <div style="clear:both"></div>
	                   
	                    <label for="" style="    margin-top: 15px;
	                    ">이메일</label>
	                    <input style="width:167%;" class="join-input holder" type="text" name="username" placeholder="이메일" value = "${joined_email}">
	                    <label for="">비밀번호
	                    </label>
	                    <input style="width:167%;" class="join-input holder" type="password" name="password" placeholder="비밀번호">
	                   
	                    
	                    <div style="width:167%;" class="mkAccCheck">
	                        <span class="mkAccText">아직 계정이 없으신가요?</span><span class="mkAccBtn"><a href="/join_indv">계정만들기 ></a></span>
	                    </div>
	                  
	                    <div style="width:167%;" class="join-confirm">
	                    
	                        <input class="join-btn" type="submit" value="이메일 로그인">
	                        <div class="cookieCfm" style="padding-left:200px;     margin-top: 9px;">
	                            <input type="checkbox" id="term_2">
	                            <label for="term_2">
	                                <small>로그인 상태 유지</small>
	                            </label>
	                        </div>
	                    </div>
	                </div>
                
                </form>
            </div>
        </div> <!-- 작업공간 끝-->
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


