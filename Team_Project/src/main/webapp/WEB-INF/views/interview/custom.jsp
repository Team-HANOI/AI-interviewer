<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

	<!-- ======= Header ======= -->
	<jsp:include page="../common/nav_main.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="" class="h-100"
		style="background-image: url('/image/i_recruit.jpg'); background-size: cover; background-position: center; position: relative;">
		<div class="w-100 h-100 bg-dark"
			style="position: absolute; top: 0; opacity: .5;"></div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<section class="portfolio">
			<div class="container">
				<!-- 작업공간 시작-->

				<form action="/interview/customMode" method="GET">
					<!-- 타이틀 더미 -->
					<div class="dummy"></div>

					<div class="keyword-box" align="center">
						<h2 class="popup-text">키워드를 선택하세요</h2>

						<!-- 구분선 -->
						<div class="line"></div>

						<div>

							<c:forEach items="${keywordList}" var="keywordList"
								varStatus="idx">

								<input class="form-check-input" id="kw${idx.count }"
									type="checkbox" name="keyword" value="${keywordList.kw }">
								<label class="form-check-label" for="kw${idx.count }"><button
										type="button" class="btn btn-secondary btn-sm" disabled>${keywordList.kw }</button></label>				
				
				</c:forEach>

						</div>
						<!-- 구분선 -->
						<div class="line"></div>
						<input type="hidden" name="type" value="${type }">
						<!-- 400에러가 이거 없어서 -->
						<button type="submit" class="btn btn-outline-secondary btn-sm">확인</button>

					</div>
				</form>


				<!-- 작업공간 끝-->
			</div>
		</section>
		<!-- End Portfolio Section -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../common/footer.jsp" />

	<!-- Vendor JS Files -->
	<jsp:include page="../common/vendor_js.jsp" />

	<!-- Template Main JS File -->
	<script src="../assets/js/main.js"></script>

</body>
</html>


