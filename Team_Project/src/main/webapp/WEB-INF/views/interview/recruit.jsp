<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
<!-- 공통 스타일  -->
<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일  -->
<link rel="stylesheet" href="/style/interview_recruit.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>


<script>
	
$(function() {
	$('.card').click(function(e) {
		
		$(this).find('.kwform')[0].submit();
	});
});

	
</script>

</head>
<body>
	<!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
		
		
		<%-- 	var cName = new Array();
	var cList = new Array();
	
	<c:forEach items="${voList}" var="list">
		cName.push("${list.name}");		
		var keywordList = new Array();

		<c:forEach items="${list.kwList}" var="kw">
			keywordList.push("${kw}");
		</c:forEach>

		cList.push(keywordList);
		
	</c:forEach> --%>
			<!-- 태양 -->
			<div class="sun">
				<img src="https://pngimg.com/uploads/sun/sun_PNG13439.png" alt="">
			</div>

			<!-- 팝업 -->
			<!-- 팝업배경 더미 -->
			<div class="popup-dummy"></div>

			<!-- 키워드 카드 팝업 -->
			<jsp:include page="../common/popups/popup_keyword.jsp" />

			<!-- 기업회원가입 팝업 -->
			<jsp:include page="../common/popups/popup_join_com.jsp" />

			<!-- 일반회원가입 팝업 -->
			<jsp:include page="../common/popups/popup_join_indv.jsp" />

			<!-- 일번회원가입 추가입력 폼 팝업 -->
			<jsp:include page="../common/popups/popup_join_indv_extra.jsp" />

			<!-- 기업회원 로그인 -->
			<jsp:include page="../common/popups/popup_login_com.jsp" />

			<!-- 일반회원 로그인 -->
			<jsp:include page="../common/popups/popup_login_indv.jsp" />

			<!-- 본문 타이틀 -->
			<div class="title">
				<div class="title-text">
					<h1 class="text">채용공고모드</h1>
				</div>
			</div>

			<div class="row intro">
				<p class="row-text">원하는 공고를 선택하면 솰라솰라</p>
			</div>

			<!-- 구분선 -->
			<div class="line"></div>

		<%-- 			<div class="card" id="pick" 					
						OnClick="location.href ='/interview/recruitMode?kwList=${fn:join(list.kwList,',')}'"> --%>
		
		<%-- <div class="card" id="pick" 					
						OnClick="location.href ='/interview/recruitMode?kwList=${list.kwList}'"> --%>
			<!-- 공고 -->
			<div class="container">
			
				<c:forEach items="${voList}" var="list">
				<%-- <div class="card" id="pick" OnClick="location.href ='/interview/recruitMode?kwList=${list.kwList}'"> --%>
					<div class="card" id="pick">
						<!-- 정보를 가지고 넘어가야됨 -->
						<div class="img-gradient">
						<img class="play-button1" src="${list.logoUrl}"
							alt="${list.cname}">
						<!-- <div class="text-wrap"> -->
						
						<form class="kwform" action="/interview/customMode" method="GET">
						
							<h1>${list.cname}</h1>
							<input type="hidden" name="type" value="${type }">
							
							<c:forEach items="${list.kwList}" var="kw">
								<%-- <button>${kw}</button> --%>
								<input id="kw${list.cname }" type="checkbox" checked="checked" name="keyword" value="${kw}"> <label for="kw${list.cname }">${kw}</label>
							</c:forEach>
						</form>
						</div>
					</div>
						<div></div>
				</c:forEach>
			</div>
					<!-- card -->
			
				

				<div id="pageList" class="pageList">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
						[이전]&nbsp;
					</c:when>
						<c:otherwise>
							<a href="/interview/recruit?page=${pageInfo.page-1}">[이전]</a>&nbsp;
					</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="/interview/recruit?page=${i}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						[다음]
					</c:when>
						<c:otherwise>
							<a href="/interview/recruit?page=${pageInfo.page+1}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</div>
			
			<!-- container -->

	</main>

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>


