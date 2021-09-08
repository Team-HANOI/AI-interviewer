<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 구분선 -->
    <div class="line"></div>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 팝업 -->
        <jsp:include page="../common/popups/popups.jsp"/>

		<!-- 타이틀 더미 -->
        <div class="dummy"></div>
        
        <!-- 마이 페이지 -->
        <div class="mypage">
            <!-- 유저정보 좌측 메뉴 정보 -->
            <div class="mypage-left">

                <!-- 좌측 메뉴 링크 -->
                <jsp:include page="mypage_common/mypage_nav.jsp"></jsp:include>
            </div>
            
            <!-- 유저정보 우측 정보 박스 -->
         <!--    <div class="mypage-right">
                유저정보 제목
                <form action="../interview/mentor_form">
                <div class="mypage-content-title">
                    <p>멘토링</p><button type="button" class="mtAddBtn btn">멘토링 글작성</button>
                </div> 
				</form>
                <div class="line"></div> -->
				<!-- 사용자 정보 -->
				<!-- <form action="" method="POST" class="mypage-content"> -->
     	<c:choose>
			<c:when test="${articleList!=null}">
				<!-- 메인화면 게시판 -->
				<ul class="mentor-box">
					<c:forEach var="article" items="${articleList}">
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
								<button class="btn apply-mentee-btn">신청하기</button>
							</div>
						</li>
					</c:forEach>
				</ul>
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
			</c:when>
			<c:otherwise>
				<section id="emptyArea">등록된 글이 없습니다.</section>
			</c:otherwise>
		</c:choose>
     				<%-- 
					<div class="dialyMT">
						<span class="dateMT">${article.mentorDate}</span>
						<table class="mypageTb">
							<tr>
								
								<td class="mypageTb-0lax"><span>${article.startDate}시부터</span></td>
								<!-- <td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td> -->
								<td class="mypageTb-0lax"><span>${article.endDate}시까지</span></td>
								<td class="mypageTb-0lax"><span>분야</span>${article.feild}</td>
								<td class="mypageTb-0lax"><span>구직자명</span>${article.applEmail}</td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</div>
			<%-- 			<section id="pageList"> --%>
		<%-- 	<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="mentor?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
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
	</c:when>	
	<c:otherwise>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	</c:otherwise>
	</c:choose>
 --%> 	<!-- 
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
						</table>
					</div>
					diailyMT

					<div class="dialyMT">
						<span class="dateMT">2021. 8. 22</span>
						<table class="mypageTb">
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
						</table>
					</div>
					diailyMT

					<div class="dialyMT">
						<span class="dateMT">2021. 8. 23</span>
						<table class="mypageTb">
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
						</table>
					</div>
					diailyMT

					<div class="dialyMT">
						<span class="dateMT">2021. 8. 24</span>
						<table class="mypageTb">
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
						</table>
					</div>
					diailyMT

					<div class="dialyMT">
						<span class="dateMT">2021. 8. 25</span>
						<table class="mypageTb">
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시부터</span></td>
								<td class="mypageTb-0lax"><input type="time" class="tbCell">
								</td>
								<td class="mypageTb-0lax"><span>시까지</span></td>
								<td class="mypageTb-0lax"><span>구직자명</span></td>
								<td class="mypageTb-0lax">
									<button type="button" class="mdfBtn btn">수정</button>
								</td>
								<td class="mypageTb-0lax">
									<button type="button" class="dltBtn btn">삭제</button>
								</td>
							</tr> -->
						</table>
					</div>
				</form>
			</div>
        
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


