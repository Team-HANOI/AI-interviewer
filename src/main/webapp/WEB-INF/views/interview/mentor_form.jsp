<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script>

$('#sandbox-container input').datepicker({
    minViewMode: 1,
    language: "ko"
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

				<div class="card-box">
					<!-- 채용공고 -->
					<form action="./mentorform" method="POST" class="mentor-form join">
						<h1 class="join-title">멘토 등록페이지</h1>

						<div>

							<div class="mb-3">
								<label for="mentorDate">날짜</label> <input id="mentorDate"
									class="login-input" type="date" name="mentorDate"
									placeholder=""> <label for="startDate">시작시간</label> <input
									id="startDate" class="login-input" type="time" name="startDate"
									placeholder=""> <label for="endDate">종료시간</label> <input
									id="endDate" class="login-input" type="time" name="endDate"
									placeholder="">
							</div>




							<div class="mb-3">
								<label for="company" class="form-label">회사명</label>
								<textarea class="form-control" id="company" name="company" rows="1"
									placeholder="멘토 회사이름"></textarea>
							</div>


							<div class="mb-3">
								<label for="title" class="form-label">제목</label>
								<textarea class="form-control" id="title" name="title" rows="1"
									placeholder="멘토링 제목"></textarea>
							</div>


							<div class="mb-3">
								<label for="content" class="form-label"> content </label>
								<textarea class="form-control" id="content" name="content"
									rows="1" placeholder="멘토링 내용"></textarea>
							</div>


							<div class="mb-3">
								<label for="field" class="form-label"> mentor_Position </label>
								<textarea class="form-control" id="field" name="field" rows="1"
									placeholder="멘토링 직무"></textarea>
							</div>


							<div class="mb-3">
								<label for="bio" class="form-label"> mentor_Info </label>
								<textarea class="form-control" id="bio" name="bio" rows="8"
									placeholder="멘토 정보"></textarea>
							</div>

							<input class="btn btn-success" type="submit" value="신청하기">
							<input class="btn btn-success" type="reset" value="작성취소">


						</div>

					</form>
				</div>



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


