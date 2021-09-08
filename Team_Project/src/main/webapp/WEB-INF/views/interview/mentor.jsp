<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 공통 스타일  -->
<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일  -->
<link rel="stylesheet" href="/style/interview_mentor.css">
<link rel="stylesheet" href="/style/recruit_list.css">
</head>
<body>
	<!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
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
				<h1 class="text">1:1멘토</h1>
				<small class="text">자신과 맞는 멘토와 1:1매칭..</small>
			</div>
		</div>
		<sec:authorize access="hasRole('COMPANY')">
			<div class="post">
				<a href="/interview/mentor/register">
					<button class="post-btn">멘토 등록하기</button>
				</a>
			</div>
		</sec:authorize>

		<!-- 메인화면 게시판 -->
		<c:if test="${articleList!=null}">

			<c:forEach var="article" items="${articleList}">
				<c:choose>
					<c:when test="${article.applEmail=null}">
						<ul class="mentor-box">
							<li class="mentor">
								<div class="mentor-item">
									<div class="mentor-cover"></div>
									<div class="mentor-info">
										<p class="mentor-title">${article.company}기업에서
											${article.field}가르쳐드립니다~~</p>
										<p class="mentor-time">${article.startDate}부터${article.endDate}까지</p>
										<p class="mentor-date">${article.mentorDate}날에!</p>
										<p class="mentor-email">문의사항: ${article.mentorEmail}</p>
									</div>
									<a href="./apply?mentorEmail=${article.mentorEmail}">
										<button class="btn apply-mentee-btn">신청하기</button>
									</a>

								</div>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="mentor-box">
							<li class="mentor">
								<div class="mentor-item">
									<div class="mentor-cover"></div>
									<div class="mentor-info">
										<p class="mentor-title">${article.company}기업에서
											${article.field}가르쳐드립니다~~</p>
										<p class="mentor-time">${article.startDate}부터${article.endDate}까지</p>
										<p class="mentor-date">${article.mentorDate}날에!</p>
										<p class="mentor-email">문의사항: ${article.mentorEmail}</p>
										<button class="btn apply-mentee-btn">마감</button>
									</div>
								</div>
							</li>

						</ul>
					</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:if>

		<!-- 메인화면 게시판 -->


		<section id="pageList">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="mentor?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }"
				end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">[${i }]</c:when>
					<c:otherwise>
						<a href="mentor?page=${i}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="mentor?page=${pageInfo.page+1}">[다음]</a>
				</c:otherwise>
			</c:choose>
		</section>
		

		<!-- <li class="mentor">
				<div class="mentor-item">
					<div class="mentor-cover"></div>
					<div class="mentor-info">
						<p class="mentor-title">ㅇㅇ기업다니는 ㅇㅇㅇ입니다 css가르쳐드립니다~~</p>
						<p class="mentor-time">화금14:00~15:30</p>
						<p class="mentor-date">2021.08.11~2021.9.14</p>
					</div>
					<button class="btn apply-mentee-btn">신청하기</button>
				</div>
			</li>
			<li class="mentor">
				<div class="mentor-item">
					<div class="mentor-cover"></div>
					<div class="mentor-info">
						<p class="mentor-title">ㅇㅇ기업다니는 ㅇㅇㅇ입니다 css가르쳐드립니다~~</p>
						<p class="mentor-time">화금14:00~15:30</p>
						<p class="mentor-date">2021.08.11~2021.9.14</p>
					</div>
					<button class="btn apply-mentee-btn">신청하기</button>
				</div>
			</li>
			<li class="mentor">
				<div class="mentor-item">
					<div class="mentor-cover"></div>
					<div class="mentor-info">
						<p class="mentor-title">ㅇㅇ기업다니는 ㅇㅇㅇ입니다 css가르쳐드립니다~~</p>
						<p class="mentor-time">화금14:00~15:30</p>
						<p class="mentor-date">2021.08.11~2021.9.14</p>
					</div>
					<button class="btn apply-mentee-btn">신청하기</button>
				</div>
			</li>
			<li class="mentor">
				<div class="mentor-item">
					<div class="mentor-cover"></div>
					<div class="mentor-info">
						<p class="mentor-title">ㅇㅇ기업다니는 ㅇㅇㅇ입니다 css가르쳐드립니다~~</p>
						<p class="mentor-time">화금14:00~15:30</p>
						<p class="mentor-date">2021.08.11~2021.9.14</p>
					</div>
					<button class="btn apply-mentee-btn">신청하기</button>
				</div>
			</li>
			<li class="mentor">
				<div class="mentor-item">
					<div class="mentor-cover"></div>
					<div class="mentor-info">
						<p class="mentor-title">ㅇㅇ기업다니는 ㅇㅇㅇ입니다 css가르쳐드립니다~~</p>
						<p class="mentor-time">화금14:00~15:30</p>
						<p class="mentor-date">2021.08.11~2021.9.14</p>
					</div>
					<button class="btn apply-mentee-btn">신청하기</button>
				</div>
			</li>
		</ul> -->
	</main>

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>


