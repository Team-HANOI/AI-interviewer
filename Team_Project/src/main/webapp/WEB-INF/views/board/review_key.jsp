<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mr. Alpaca</title>
<link rel="shortcut icon" href="favicon/favicon1.ico">

<!-- font awesome CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- bootstrap
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous"> -->

<!-- custom styles -->
<link rel="stylesheet" href="/style/main.css">
<link rel="stylesheet" href="/style/board_review.css">
<link rel="stylesheet" href="/style/pop_ups.css">
<link rel="stylesheet" href="/style/interview_keyword.css">
<link rel="stylesheet" href="/style/mypage.css">
<link rel="stylesheet" href="/style/board_detail.css">

<!-- java script -->
<script defer src="/js/index.js"></script>
<script defer src="/js/pop_ups.js"></script>
</head>
<body>
	<!-- 머리말 시작 -->
	<header>
		<nav class="nav">
			<!-- my page 링크 -->
			<a href="mypage-profile.html" class="my-page-link">M</a>

			<!-- 사이트 명 -->
			<ul class="nav-sub nav-title">
				<a href="main.html">
					<li class="nav-sub-li"><span class="nav-title-mr">Mr.</span> <span
						class="nav-title-alpaca"> Alpaca </span>
						<div class="line"></div></li>
				</a>
			</ul>

			<!-- 네비게이션 메뉴 -->
			<ul class="nav-sub nav-menu">
				<a href="main.html">
					<li>홈</li>
				</a>
				<a href="interview_main.html">
					<li class="nav-sub-box">면접하기
						<ul class="nav-sub-sub">
							<!-- test class needs to be deleted -->
							<a href="interview_normal.html"><li>일반면접모드</li></a>
							<a href="interview_recruit.html"><li>채용공고모드</li></a>
							<li class="keyword-popup btn">맞춤모드</li>
							<a href="interview_mentor.html"><li class="sub-last-item">멘토모드</li></a>
						</ul>
				</li>
				</a>
				<a href="board_total.html">
					<li class="nav-sub-box">커뮤니티
						<ul class="nav-sub-sub">
							<a href="board_write.html"><li>후기 작성하기</li></a>
							<a href="board_interview_review.html"><li>인터뷰 후기보기</li></a>
							<a href="board_free.html"><li>자유게시판보기</li></a>
							<a href="board_recommend.html"><li>제안 질문보기</li></a>
							<a href="board_best_answers.html"><li>모범 답안보기</li></a>
							<a href="board_total.html"><li class="sub-last-item">질문
									답변보기</li></a>
						</ul>
				</li>
				</a>
				<a href="recruit_list.html">
					<li class="nav-sub-box">채용공고</li>
				</a>
				<a href="login_person.html">
					<li class="nav-sub-box">로그인
						<ul class="nav-sub-sub">
							<a href="login_person.html"><li>일반회원</li></a>
							<a href="login_business.html"><li class="sub-last-item">기업회원</li></a>
						</ul>
				</li>
				</a>
				<a href="join_person.html">
					<li class="nav-sub-box">회원가입
						<ul class="nav-sub-sub">
							<a href="join_person.html"><li>일반회원</li></a>
							<a href="join_business.html"><li class="sub-last-item">기업회원</li></a>
						</ul>
				</li>
				</a>
			</ul>
		</nav>
	</header>

	<!-- 구분선 -->
	<div class="line"></div>

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
		<!-- 키워드 카드 팝업 -->
		<div class="popup-card keyword-box">
			<h2 class="popup-text">키워드를 선택하세요</h2>

			<!-- 구분선 -->
			<div class="line"></div>

			<div class="keywords">
				<div class="keyword">
					<input id="kw1" type="checkbox"> <label for="kw1">백엔드</label>
				</div>
				<div class="keyword">
					<input id="kw2" type="checkbox"> <label for="kw2">백엔aaa드</label>
				</div>
				<div class="keyword">
					<input id="kw3" type="checkbox"> <label for="kw3">백드</label>
				</div>
				<div class="keyword">
					<input id="kw4" type="checkbox"> <label for="kw4">백드</label>
				</div>
				<div class="keyword">
					<input id="kw5" type="checkbox"> <label for="kw5">백드</label>
				</div>
				<div class="keyword">
					<input id="kw6" type="checkbox"> <label for="kw6">백드</label>
				</div>
			</div>

			<!-- 구분선 -->
			<div class="line"></div>

			<a href="interview_normal.html">
				<button class="btn popup-btn">확인</button>
			</a>
		</div>

		<!-- 타이틀 더미 -->
		<div class="dummy"></div>

		<!-- 페이지 타이틀 -->
		<div class="board-edit">
			<div class="total-count">
				<span>${pageInfo.listCount}</span>개의 글
			</div>
			<div class="edit-btn-box">
				<button class="btn edit-btn">임시저장 글 보기</button>
				<button class="btn edit-btn">검색</button>
				<a href="board_write.html">
					<button class="btn edit-btn">글쓰기</button>
				</a>
			</div>
		</div>

		<!-- 구분선 -->
		<div class="line"></div>

		<!-- 메인화면 게시판 -->
		<div class="mypage">
			<div class="board-container mypage-left">
				<!-- 게시판 메뉴 -->
				<div class="mypage-left-bottom">
					<ul>
						<a href="board_review.html"><li class="activated">면접후기게시판</li></a>
						<a href="board_free.html"><li>자유게시판</li></a>
						<a href="board_total.html"><li>전체질문</li></a>
						<a href="board_recommend.html"><li>면접질문</li></a>
						<a href="board_best_answers.html"><li>모범답안</li></a>
					</ul>
				</div>
			</div>

			<!-- 게시판 -->
			<div class="board mypage-right">
				<!-- 페이지 타이틀 -->
				<h1 class="page-title-left">면접후기게시판</h1>

				<!-- 구분선 -->
				<div class="line"></div>

				<c:choose>
					<c:when test="${articleList!=null && pageInfo.listCount>0 }">
						<section id="listForm">
							<table class="board-table">
								<thead class="board-head">
									<tr>
										<th>번호</th>
										<th>구분</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
										<th>좋아요</th>
									</tr>
								</thead>

								<c:forEach var="article" items="${articleList}">
									<tbody class="board-body">
										<tr>
											<td><a href="#">${article.pos}</a></td>
											<td><a href="#">${article.company}</a></td>
											<td><a
												href="./board_review_detail?reviewId=${article.reviewId}&page=${pageInfo.page}"><span></span>${article.title}</a></td>
											<td><a href="#">${article.name}</a></td>
											<!--  name -->
											<td><a href="#">${article.regdate}</a></td>
											<td><a href="#">${article.viewCnt}</a></td>
											<td><a href="#">${article.likeCnt}</a></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</section>

						<section id="pageList">
							<div class="board-control">
								<c:choose>
									<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp; 
				</c:when>
									<c:otherwise>
										<a href="boardlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${pageInfo.startPage }"
									end="${pageInfo.endPage }">
									<c:choose>
										<c:when test="${pageInfo.page==i }">[${i}]</c:when>
										<c:otherwise>
											<a href="boardlist?page=${i}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageInfo.page>=pageInfo.maxPage }">
                [다음]
                </c:when>
									<c:otherwise>
										<a href="boardlist?page=${pageInfo.page+1}">[다음]</a>
									</c:otherwise>
								</c:choose>
							</div>
						</section>
					</c:when>
					<c:otherwise>
						<section id="emptyArea">등록된 글이 없습니다.</section>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>

	<!-- 꼬리 시작 -->
	<footer>
		<!-- 깃 허브 링크 -->
		<div class="developers">
			<a class="hayoon" href="https://github.com/orgs/Team-HANOI/dashboard">
				<i class="fab fa-github-square fa-4x"></i>
				<p class="developers-id">Team-HANOI</p>
			</a> <a class="hayoon" href="https://github.com/HAYOON26"> <i
				class="fab fa-github-square fa-4x developers-git"></i>
				<p class="developers-id">HAYOON26</p>
			</a> <a class="hayoon" href="https://github.com/AngryPig123"> <i
				class="fab fa-github-square fa-4x developers-git"></i>
				<p class="developers-id">AngryPig123</p>
			</a> <a class="hayoon" href="https://github.com/hs95blue"> <i
				class="fab fa-github-square fa-4x developers-git"></i>
				<p class="developers-id">hs95blue</p>
			</a> <a class="hayoon" href="https://github.com/jin-co"> <i
				class="fab fa-github-square fa-4x developers-git"></i>
				<p class="developers-id">jin-co</p>
			</a>
		</div>

		<!-- copyright, 소개글 -->
		<div class="footer-text">
			<p>&copy;2021</p>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos
				earum odit similique ratione ipsam quisquam nam architecto veritatis
				expedita porro pariatur nemo modi neque officia eligendi
				reprehenderit doloribus, optio blanditiis.</p>
		</div>
	</footer>
</body>
</html>


