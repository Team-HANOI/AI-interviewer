
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
        
        
        <!-- 일반회원 로그인 -->
				<div class="login-individual-form">
				    
				        <h1 class="join-title">ALPACA 로그인</h1>
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
		            <form action="/login_proc" method="post" class="login-person join">
				        <div class="join-holder">
				            <!-- 구분선 -->
				            <div class="line"></div> 
				            
				            <c:if test="${param.error != null}">
					            <div class="join-text">
	                      <a href="#" onclick="javascript:showPwAlert()" style="color:red;">${error_message}</a>
	                    </div>
			              </c:if>
				            <div style="clear:both"></div>
				           
				            <label for="">이메일</label>
				            <input class="join-input holder" type="text" name="username" placeholder="이메일">
				            <label for="">비밀번호
				                <span class="pwReset">
				                    <small class="btn pw-search">비밀번호 재설정</small>
				                </span>
				            </label>
				            <input class="join-input holder" type="text" name="password" placeholder="비밀번호">
				           
				            
				            <div class="mkAccCheck">
				                <span class="mkAccText">아직 계정이 없으신가요?</span><span class="mkAccBtn"><a href="/join_indv">계정만들기 ></a></span>
				            </div>
				          
				            <div class="join-confirm">
				                <input class="join-btn" type="submit" value="이메일 로그인">
				                <div class="cookieCfm">
				                    <input type="checkbox" id="term_2">
				                    <label for="term_2">
				                        <small>로그인 상태 유지</small>
				                    </label>
				                </div>
				            </div>
				        </div>
				
				        
				    </form>
				</div>
        
        
       <%--  <sec:authorize access="isAnonymous()">
		      <div class="container">
		        <h1>ALPACA 로그인</h1>
		      <form action="/login_proc" method="post">
		          <c:if test="${param.error != null}">
		          <p>
		              Login Error! <br />
		              ${error_message}
		          </p>
		          </c:if>
		          <div class="form-group">
		              <input type="text" name="username" class="form-control" placeholder="이메일 입력해주세요">
		          </div>
		          <div class="form-group">
		              <input type="password" class="form-control" name="password" placeholder="비밀번호">
		          </div>
		          <button type="submit" class="btn btn-primary">Submit</button>
		      </form>
		      <br/>
		    </div>
      <a href="/oauth2/authorization/google">구글 아이디로 로그인</a> <!-- 시큐리티가 제공하는 url. 그래서 별도의 컨트롤러를 생성할 필요가 없다 -->
    </sec:authorize>

    <sec:authentication property="name"/>
    <a href="/logout">로그아웃</a> <!-- 시큐리티가 제공하는 url. 그래서 별도의 컨트롤러를 생성할 필요가 없다 --> --%>

    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>



