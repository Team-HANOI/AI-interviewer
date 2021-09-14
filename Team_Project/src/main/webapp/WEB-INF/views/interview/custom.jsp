<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />
<script
	src="https://code.jquery.com/jquery-latest.min.js"></script>
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
	<jsp:include page="../common/nav.jsp" />


	<main id="main">
	
	<section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>맞춤면접</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>맞춤면접</li>
          </ol>
        </div>

      </div>
    </section>
	
		<section class="portfolio">
			<div class="container">
				<!-- 작업공간 시작-->

				<form action="/interview/customMode" method="GET">
					<!-- 타이틀 더미 -->
					<div class="dummy"></div>

					<div class="keyword-box" align="center">
						<h2 class="popup-text">키워드를 선택해주세요✅</h2>
          <br>
						<!-- 구분선 -->
						<div class="line"></div>

						<div style="margin-left: 260px">
								<%-- <input class="form-check-input" 
									type="checkbox" name="keyword" value="${keywordList.kw }">
								<label class="form-check-label" for="kw${idx.count }"><button
										type="button" class="btn btn-secondary btn-sm" disabled>${keywordList.kw }</button></label>		 --%>
										
								<ul class="list-group list-group-horizontal">
								<c:forEach items="${keywordList}" var="keywordList"
									varStatus="idx" begin="0" end="6" >
									  <li class="list-group-item"><input class="form-check-input me-1" type="checkbox" name="keyword" value="${keywordList.kw }" aria-label="...">${keywordList.kw }</li>
					      </c:forEach>
								</ul>
								<ul class="list-group list-group-horizontal-sm">
								<c:forEach items="${keywordList}" var="keywordList"
									varStatus="idx" begin="7" end="13" >
									  <li class="list-group-item"><input class="form-check-input me-1" type="checkbox" name="keyword" value="${keywordList.kw }" aria-label="...">${keywordList.kw }</li>
					      </c:forEach>
								</ul>
								<ul class="list-group list-group-horizontal-md">
	              <c:forEach items="${keywordList}" var="keywordList"
	                varStatus="idx" begin="14" end="19" >
	                  <li class="list-group-item"><input class="form-check-input me-1" type="checkbox" name="keyword" value="${keywordList.kw }" aria-label="...">${keywordList.kw }</li>
	              </c:forEach>
								</ul>
								<ul class="list-group list-group-horizontal-lg">
	              <c:forEach items="${keywordList}" var="keywordList"
	                varStatus="idx" begin="20" end="27" >
	                  <li class="list-group-item"><input class="form-check-input me-1" type="checkbox" name="keyword" value="${keywordList.kw }" aria-label="...">${keywordList.kw }</li>
	              </c:forEach>
								</ul>
						</div>
						<br>
						<!-- 구분선 -->
						<div class="line"></div>
						<input type="hidden" name="type" value="${type }">
						<!-- 400에러가 이거 없어서 -->
						<button type="submit" class="btn btn-outline-secondary btn-sm">다 골랐어요</button>

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


