<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<!-- 공통 스타일 -->
<jsp:include page="../common/top.jsp" />

<!-- style -->
<link rel="stylesheet" href="/style/board_review.css">
<link rel="stylesheet" href="/style/board_comment.css">

<!-- java script -->
<script defer src="/js/board_detail.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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

		<!-- 메인화면 게시판 -->
		<div class="board-total mypage">
			<!-- 게시판 메뉴 -->
			<jsp:include page="board_common/board_nav.jsp" />

			<!-- 게시판 -->
			<div class="board mypage-right">
				<!-- 페이지 타이틀 -->
				<h1 class="page-title-left">면접후기 상세보기</h1>

				<!-- 구분선 -->
				<div class="line"></div>

				<div class="board-edit">
					<a href="./write_review">
						<button class="btn edit-btn">글쓰기</button>
					</a> <a href="/review/modifyForm?reviewId=${review.reviewId}">
						<button class="btn edit-btn">수정</button>
					</a> <a
						href="./boarddelete?reviewId=${review.reviewId}&page=${pageInfo.page}">
						<button class="btn edit-btn">삭제</button>
					</a> <a
						href="./r_detail_pre?reviewId=${review.reviewId}&page=${pageInfo.page}">
						<button class="btn edit-btn">이전글</button>
					</a> <a
						href="./r_detail_next?reviewId=${review.reviewId}&page=${pageInfo.page}">
						<button class="btn edit-btn">다음글</button>
					</a> <a href="./board_review?page=${pageInfo.page}">
						<button class="btn edit-btn">목록보기</button>
					</a>
				</div>

				<div class="board-detail">
					<p class="text item detail-row">${review.pos}|
						${review.company} | ${review.title}</p>

					<div class="group-detail-row">
						<div class="detail-row">
							<img class="detail-img" src="image/sky.jpg" alt="">
							<%-- <img src='<c:url value="/review/img/${profile.fileId}"/>'
								width="100" class="img-thumbnail"> --%>

						</div>
						<div class="detail-row">
							<p class="text item">${review.name}</p>
							<p class="text item">${review.regdate}</p>
							<p class="text item">
								조회수: <span>${review.viewCnt}</span>
							</p>

							<!-- 좋아요-->

							<article class="board-view text-center">
								<div class="btn-group">
									<button type="button" id="" name="" data-bs-toggle="modal"
										data-bs-target="#exampleModal"
										onclick="javascript:likeCnt(${review.reviewId});">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-suit-heart"
											viewBox="0 0 16 16">
							                            <path
												d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"></path>
							                        </svg>
										좋아요
									</button>
									<button type="button" class="likeCnt" id="likeCnt">
										<fmt:formatNumber value="${review.likeCnt}"
											pattern="###,###,###,###" />
									</button>
								</div>
							</article>



						</div>
					</div>

					<div class=content>

						<!-- 첨부파일 -->
						<tr>
							<td><c:set var="len" value="${fn:length(file.fileName)}" />
								<c:set var="filetype"
									value="${fn:toUpperCase(fn:substring(file.fileName, len-4, len))}" />
								<c:choose>
									<c:when
										test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
										<img src='<c:url value="/review/img/${file.fileId}"/>'
											width="1000" class="img-thumbnail">
										<br>
									</c:when>
									<c:otherwise>
										<a href='<c:url value="/review/pds/${file.fileId}"/>'>${file.fileName}</a>
										<br>
									</c:otherwise>
								</c:choose></td>
						</tr>




						<!-- 본문내용 -->
						<p>${review.content}</p>
					</div>
					<!-- 본문내용 끝 -->


					<!-- 댓글목록 -->

					<div class="comments-container">
						<h2>댓글</h2>

						<c:forEach items="${commList}" var="comm" varStatus="status">

							<ul id="comments-list" class="comments-list">
								<li><c:choose>
										<c:when test="${comm.lev==0}">


											<div class="comment-main-level">

												<div class="comment-avatar">
													<img
														src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg"
														alt="">
												</div>

												<div class="comment-box">
													<div class="comment-head">
														<div class="comment-head-left">
															<h6 class="comment-name">
																<a href="http://creaticode.com/blog">${comm.name}</a>
															</h6>
															<span>${comm.regdate}</span>
														</div>
														<div class="comment-head-right">

															<button>수정</button>
															<button>삭제</button>
<!-- 대댓글 버튼 -->
															<button onclick="commentChildFn()">답글 달기</button>
<!-- 대댓글 버튼 끝 -->
														</div>
													</div>
													<div class="comment-content">${comm.content}</div>
												</div>
											</div>

<!-- 대댓글 달기 -->
											<div id="comm" class="comm">
												<form name="${comm.comId}" id="commentChild-form"
													action="/review/addCommChild" method="post">

													<textarea id="${comm.prtComId}" name="content"
														class="commentChild" rows="3">홍길동</textarea>

													<input type="hidden" name="reviewId" id="reviewId" value="${review.reviewId}"> 
													<input type="hidden" name="prtComId" id="prtComId" value="${comm.prtComId}">
													<button type="submit" class="comment-btn">댓글달기</button>
												</form>
											</div>
<!-- 대댓글 달기 끝 -->
										</c:when>




										<c:otherwise>
											<ul class="comments-list reply-list">
												<li>

													<div class="comment-avatar">
														<img
															src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg"
															alt="">
													</div>
													<div class="comment-box">
														<div class="comment-head">
															<div class="comment-head-left">
																<h6 class="comment-name">
																	<a href="http://creaticode.com/blog">${comm.name}</a>
																</h6>
																<span>${comm.regdate}</span>
															</div>
															<div class="comment-head-right">

																<button>수정</button>
																<button>삭제</button>

																<button>답글달기</button>
															</div>
														</div>
														<div class="comment-content">${comm.content}</div>
													</div>
												</li>
											</ul>
										</c:otherwise>
									</c:choose></li>
							</ul>

						</c:forEach>
					</div>

					<!--  댓글 목록 끝  -->









					<!--  댓글 입력 창 시작 -->
					<form name="comment-form" id="comment-form"
						action="/review/addComm" method="post">
						<div class="card">
							<div class="card-header">

								<!-- 댓글 로그인 시작 -->
								<%-- 										<c:choose>
											<c:when test="${userInfo.id eq null }">
												<a class="btn btn-sm btn-info"
													href="./auth-signin?board=diary-detail&bidx=${diary.diaryId}">로그인</a>
												<span style="width: 10px"></span>
											</c:when>

											<c:otherwise>
												<p>${userInfo.name}(${userInfo.id})님</p>
												<span style="width: 10px"></span>
												<input type="hidden" name="diaryId" value="${diary.diaryId}">
												<input type="hidden" name="commenterId"
													value="${userInfo.id}">

											</c:otherwise>
										</c:choose> --%>
								<!--  댓글 로그인 끝  -->
							</div>
							<div style="width: 100%; text-align: center;">
								<div
									style="display: inline-block; width: 50%; text-align: center;">

									<div style="display: inline-block; width: 50%;">

										<textarea class="form-control" name="content" id="content"
											placeholder="댓글을 입력하세요" id="floatingTextarea2"
											style="height: 100px; width: 300px; float: right"></textarea>

										<input type="hidden" name="reviewId"
											value="${review.reviewId}">

									</div>
									<div style="display: inline-block;">

										<button class="btn btn-primary" type="button" id="comment-btn"
											style="height: 100px; float: left;"
											onclick="addComment(${review.reviewId});">댓글 달기</button>

									</div>
								</div>
							</div>
						</div>
					</form>
					<!--  댓글 입력 창 끝 -->
				</div>




			</div>
		</div>
	</main>

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>


