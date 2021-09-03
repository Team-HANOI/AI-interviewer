<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 키워드 카드 팝업 -->
<div class="popup-card keyword-box">

	<h2 class="popup-text">키워드를 선택하세요</h2>

	<!-- 구분선 -->
	<div class="line"></div>


	<div class="keywords">
		<c:forEach items="${keywordList }" var="keywordList">
			<div class="keyword">
				<input id="kw1" type="checkbox"> <label for="kw1">${keywordList.kw }</label>
			</div>
		</c:forEach>
	</div>


	<!-- 구분선 -->
	<div class="line"></div>

	<a href="interview_normal.html">
		<button class="btn popup-btn">확인</button>
	</a>
</div>