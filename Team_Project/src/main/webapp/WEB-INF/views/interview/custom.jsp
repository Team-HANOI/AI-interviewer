<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 공통 스타일  -->
<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일  -->
<link rel="stylesheet" href="/style/interview_normal.css">

</head>
<body>
	<!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
		<!-- 태양 -->
		<!-- 팝업 -->
		<!-- 팝업배경 더미 -->
	<form action="/interview/customMode" method="GET" >
		<!-- 타이틀 더미 -->
		<div class="dummy"></div>

		<div class="keyword-box" align="center">
			<h2 class="popup-text">키워드를 선택하세요</h2>

			<!-- 구분선 -->
			<div class="line"></div>

			<div class="keywords">
				<c:forEach items="${keywordList}" var="keywordList" varStatus="idx">
					<div class="keyword">
						<input id="kw${idx.count }" type="checkbox" name="keyword" value="${keywordList.kw }"> <label for="kw${idx.count }">${keywordList.kw }</label>
					</div>
				</c:forEach>
			</div>

			<!-- 구분선 -->
			<div class="line"></div>
				<button class="btn popup-btn" type="submit">확인</button>
		</div>
	</form>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>




