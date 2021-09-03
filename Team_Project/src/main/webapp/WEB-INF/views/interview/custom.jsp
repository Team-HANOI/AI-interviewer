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

		<!-- 타이틀 더미 -->
		<div class="dummy"></div>

		<div class="keyword-box">
			<h2 class="popup-text">키워드를 선택하세요</h2>

			<!-- 구분선 -->
			<div class="line"></div>


			<div class="keywords">
				<c:forEach items="${keywordList}" var="keywordList" varStatus="idx">
					<div class="keyword">
						<input id="kw${idx.count }" type="checkbox"> <label for="kw${idx.count }">${keywordList.kw }</label>
					</div>
				</c:forEach>
			</div>

			<!-- 구분선 -->
			<div class="line"></div>

			<a href="run">
				<button class="btn popup-btn">확인</button>
			</a>
		</div>


		<%-- 
		<!-- 구분선 -->
		<div class="line"></div>

		<c:forEach items="${keywordList }" var="keywordList">
			<div class="toggleArea">
				<label class="switch"> <input id="kw1"
					name="keywordCheckBox" type="checkbox" value="${keywordList.kw }" />
					<span class="slider round">${keywordList.kw }</span>
				</label>
			</div>
		

			
				<span class="keywords" id="keywords"> <input id="kw1"
					type="checkbox" name="keywordCheckBox"> <label for="kw1">${keywordList.kw }</label>
	
				</span> 
			

		</c:forEach>




		<!-- 구분선 -->
		<div class="line"></div>


		<a href="/interview/run">
			<button class="btn popup-btn">확인</button>
		</a> --%>

	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>




