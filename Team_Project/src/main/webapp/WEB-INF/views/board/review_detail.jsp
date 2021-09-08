<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- css -->
<link rel="stylesheet" href="/style/board_comment.css">
<link rel="stylesheet" href="/style/board_detail2.css">

<!-- js -->
<script defer src="/js/board_detail.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<body>
	<sec:authentication property="principal" var="user" />

	<header>
		<div class="wrap-profile">


			<style>
			.profile-main {
				display: flex;
				height: 100px;
				width: 100px;
				border-radius: 50%;
				text-align: center;
				overflow: hidden;
				margin: 0 auto;
				background-image: url(/review/pfImg/${pfId});
				background-size: cover;
			}
			</style>

			<div class="profile-main">
				<%-- <img src='<c:url value="/review/pfImg/${pfId}"/>'width="100" class="img-thumbnail"> --%>

			</div>
		</div>
		<h3 class="review-name">${review.name}| ${review.regdate}</h3>
		<h1>${review.pos}| ${review.company} | ${review.title}</h1>



		<div class="tagbtn_box">
			<div class="tagbtn_row">
				<a href="./write_review" class="button2">글쓰기</a>
				<c:set var="reviewEmail" value="${review.email}" />
				<c:set var="userEmail" value="${user.username}" />
				<c:if test="${reviewEmail eq userEmail}">
					<a href="/review/modifyForm?reviewId=${review.reviewId}"
						class="button2">수정</a>
					<a
						href="./boarddelete?reviewId=${review.reviewId}&page=${pageInfo.page}"
						class="button2">삭제</a>
				</c:if>
			</div>
			<div class="tagbtn_row">
				<a
					href="./r_detail_pre?reviewId=${review.reviewId}&page=${pageInfo.page}"
					class="button2">이전글</a> <a
					href="./r_detail_next?reviewId=${review.reviewId}&page=${pageInfo.page}"
					class="button2">다음글</a> <a
					href="./board_review?page=${pageInfo.page}" class="button2">목록보기</a>
			</div>
			<div class="tagbtn_row">
				<a href="#" class="button2">조회수 : ${review.viewCnt}</a>

				<!-- 좋아요-->

				<article class="board-view text-center">
					<div class="btn-group">
						<button type="button" class="button2" id="" name=""
							data-bs-toggle="modal" data-bs-target="#exampleModal"
							onclick="javascript:likeCnt(${review.reviewId});">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
							                            <path
									d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"></path>
							                        </svg>
							좋아요
							<fmt:formatNumber value="${review.likeCnt}"
								pattern="###,###,###,###" />
						</button>
					</div>
				</article>



			</div>
		</div>
	</header>


	<article>

		<main>
			<h2 class="context-h2">${review.pos}| ${review.company} |
				${review.title}</h2>
			<p class="context-p">${review.content}
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec
				odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla
				quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent
				mauris. Fusce nec tellus sed augue semper porta. <b>Lorem ipsum
					dolor sit amet, consectetur adipiscing elit</b>. Mauris massa.
				Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad
				litora torquent per conubia nostra, per inceptos himenaeos.
			</p>

			<!-- 구분선 -->
			<br>
			<hr noshade />
			<br>
			<!-- 첨부파일 -->
			<tr>
				<td><c:set var="len" value="${fn:length(file.fileName)}" /> <c:set
						var="filetype"
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
			<!-- 첨부파일 끝-->
			<details open>
				<summary>Will lorem ispum last forever ?</summary>
				Who knos : orbi in dui quis est pulvinar ullamcorper. Nulla
				facilisi. Integer lacinia sollicitudin massa. Cras metus. Sed
				aliquet risus a tortor. Integer id quam. Morbi mi.
				<b>Curabitur sit amet mauris</b>. Quisque nisl felis, venenatis
				tristique, dignissim in, ultrices sit amet, augue. Proin sodales
				libero eget ante. Nulla quam. Aenean laoreet.Vestibulum ante ipsum
				primis in fauci
			</details>


		</main>
	</article>





	<div id="comments">
		<!-- 댓글목록 -->

		<div class="comments-h2">
			<h2>댓글</h2>
		</div>
		<div class="comments-container">
			<c:forEach items="${commList}" var="comm" varStatus="status">

				<ul id="comments-list" class="comments-list">
					<li><c:choose>
							<c:when test="${comm.lev==0}">


								<div class="comment-main-level">
									<style>
									.comments-list .comment-avatar {
										width: 65px;
										height: 65px;
										position: relative;
										z-index: 99;
										float: left;
										border: 3px solid #fff;
										-webkit-border-radius: 4px;
										-moz-border-radius: 4px;
										border-radius: 4px;
										-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
										-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
										box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
										overflow: hidden;
										background-image: url(/review/commImg/${comm.email});
										background-size: cover;
									}
									</style>
									<div class="comment-avatar">
										<%-- <img src="/review/commImg/${comm.email}"> --%>
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

												<c:set var="commEmail" value="${comm.email}" />
												<c:set var="userEmail" value="${user.username}" />
												<c:if test="${commEmail eq userEmail}">
													<div class="comment-head-right-btn">
														<button>수정</button>
													</div>
													<div class="comment-head-right-btn">
														<button>삭제</button>
													</div>
												</c:if>
												<!-- 대댓글 버튼 -->
												<div class="comment-head-right-btn">
													<button onclick="commentChildFn()">답글 달기</button>
												</div>
												<!-- 대댓글 버튼 끝 -->
											</div>
										</div>
										<div class="comment-content">${comm.content}</div>
									</div>
								</div>

								<%-- <!-- 대댓글 달기 -->
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
<!-- 대댓글 달기 끝 --> --%>
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

													<c:set var="commEmail" value="${comm.email}" />
													<c:set var="userEmail" value="${user.username}" />
													<c:if test="${commEmail eq userEmail}">
														<button>수정</button>
														<button>삭제</button>
													</c:if>

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




		<div>
			<form name="comment-form" id="comment-form" action="/review/addComm"
				method="post">


				<div class="card-header">

					<!-- 댓글 로그인 시작 -->
					<c:choose>
						<c:when test="${user.username eq null }">
							<a class="btn btn-sm btn-info" href="/userLogin">로그인 하기</a>
							<span style="width: 10px"></span>
						</c:when>

						<c:otherwise>
							<p>${user.name}님</p>
							<span style="width: 10px"></span>
						</c:otherwise>
					</c:choose>
					<!--  댓글 로그인 끝  -->
				</div>

				<textarea class="form-control" name="content" id="content"
					placeholder="댓글을 입력하세요"></textarea>
				<input type="hidden" name="reviewId" value="${review.reviewId}">
				<input type="hidden" name="email" value="${user.username}">

				<button type="button" id="comment-btn"
					onclick="addComment(${review.reviewId});">댓글달기</button>
			</form>
		</div>
	</div>

</body>
</html>