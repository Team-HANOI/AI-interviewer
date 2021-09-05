<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<header>
<sec:authentication property="principal" var="user"/>
	<nav class="nav">
		<!-- my page 링크 -->
		<sec:authorize access="isAuthenticated()">
		${user.username}
		</sec:authorize>
		<a href="/mypage/" class="my-page-link">M</a>

		<!-- 사이트 명 -->
		<ul class="nav-sub nav-title">
			<a href="/">
				<li class="nav-sub-li">
					<span class="nav-title-mr">Mr.</span> <span
					class="nav-title-alpaca"> Alpaca </span>
					<div class="line"></div>
				</li>
			</a>
		</ul>

		<!-- 네비게이션 메뉴 -->
		<ul class="nav-sub nav-menu">
			<a href="/">
				<li>홈</li>
			</a>
			
			<a href="/interview/">
				<li class="nav-sub-box">면접하기
					<ul class="nav-sub-sub">
						<!-- test class needs to be deleted -->
						<a href="/interview/nomal"><li>일반면접모드</li></a>
						<a href="/interview/recruit"><li>채용공고모드</li></a>
						<a href="/interview/custom"><li>맞춤모드</li></a>
						<a href="/interview/mentor"><li class="sub-last-item">멘토모드</li></a>
					</ul>
				</li>
			</a>
			
			<a href="/board/">
				<li class="nav-sub-box">커뮤니티
					<ul class="nav-sub-sub">
						<a href="/board/"><li>전체질문</li></a>
						<a href="/board/review"><li>면접후기게시판</li></a>
						<a href="/board/free"><li>자유게시판</li></a>
						<a href="/board/recommend"><li>면접질문</li></a>
						<a href="/board/best_answers"><li class="sub-last-item">모범답안</li></a>
					</ul>
				</li>
			</a>

			<a href="/recruit/">
				<li class="nav-sub-box">채용공고</li>
			</a>

<sec:authorize access="isAuthenticated()">
      <a href="/logout"><li class="nav-sub-box">로그아웃</li></a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
      <a href="/userLogin"><li class="nav-sub-box">로그인</li></a>
</sec:authorize>
			<li class="nav-sub-box">회원가입 
				<a>
					<ul class="nav-sub-sub">
						<a href="/join_indv"><li class="join-individual btn">일반회원</li> </a>
						<a href="/join_com"><li class="sub-last-item join-com btn">기업회원</li></a>
					</ul>
				</a>
			</li>
		</ul>
	</nav>
</header>