<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

						<!--
								맞춤모드에서 키워드 선택 화면
								맞춤모드에서 키워드 선택 화면
								맞춤모드에서 키워드 선택 화면
								맞춤모드에서 키워드 선택 화면
								맞춤모드에서 키워드 선택 화면
														 -->


<!DOCTYPE html>
<html lang="en">
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 공통 스타일  -->
<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일  -->
<link rel="stylesheet" href="/style/interview_normal.css">
<script>
	

	$(function(){
		$("form").submit(function(e){
		
			var flag = false;
						
			$(this).find("input[type=checkbox]").each(function(index, item){
				if($(item).is(':checked')){
					flag = true;
				}
			});
	
			if(flag === false){		
			
				alert("키워드를 선택해 주세요.");
				e.preventDefault();
				
			}
						
		});
	});

</script>


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
				<input type="hidden" name="type" value="${type }">	<!-- 400에러가 이거 없어서 -->
				<button class="btn popup-btn" type="submit">확인</button>
		</div>
	</form>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>




