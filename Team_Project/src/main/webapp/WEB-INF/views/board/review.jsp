<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 공통 스타일 -->
<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일 -->
<link rel="stylesheet" href="/style/board_review.css">
</head>
<body>
	<!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 구분선 -->
	<div class="line"></div>

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
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

		<!-- 타이틀 더미 -->
		<div class="dummy"></div>

		<!-- 페이지 타이틀 -->
		<div class="board-edit">
			<div class="total-count">
				<span>${pageInfo.listCount}</span>개의 글
			</div>


			<div class="edit-btn-box">
			
				<sec:authorize access="isAuthenticated()">
					<!-- 임시저장 글 목록 보기 -->
					<a href="./write_tempreview">
					<button class="btn edit-btn">임시저장 글 보기</button>
					</a>    
				</sec:authorize>

				<!-- 키워드검색기능 -->
				<form action="/review/board_review_key" method="post"
					class="board_review_key" name="board_review_key">
					<div class="detail-row">
						<div>
							<input type="text" name="keyword" id="keyword"
								required="required" />
						</div>
					</div>

					<div class="detail-row">
						<button type="submit" id="0" name="0" class="btn keyword">검색</button>
					</div>
				</form>
				
				<sec:authorize access="isAuthenticated()">
					<!-- 글쓰기 -->
					<a href="./write_review">
					<button class="btn edit-btn">글쓰기</button>
					</a>    
				</sec:authorize>

				
			</div>
		</div>

		<!-- 구분선 -->
		<div class="line"></div>

		<!-- 메인화면 게시판 -->
		<div class="board-total mypage">
			<!-- 게시판 메뉴 -->
			<jsp:include page="board_common/board_nav.jsp" />

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
										<th>포지션</th>
										<th>회사</th>
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

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>


