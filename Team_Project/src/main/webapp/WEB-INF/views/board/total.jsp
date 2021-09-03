<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_review.css">
    <link rel="stylesheet" href="/style/board_total.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 구분선 -->
    <div class="line"></div>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 팝업 -->
        <!-- 팝업배경 더미 -->
        <div class="popup-dummy"></div>
        
        <!-- 키워드 카드 팝업 -->
        <jsp:include page="../common/popups/popup_keyword.jsp"/>
        
        <!-- 기업회원가입 팝업 -->
        <jsp:include page="../common/popups/popup_join_com.jsp"/>

        <!-- 일반회원가입 팝업 -->
        <jsp:include page="../common/popups/popup_join_indv.jsp"/>
        
        <!-- 일번회원가입 추가입력 폼 팝업 -->
        <jsp:include page="../common/popups/popup_join_indv_extra.jsp"/>

        <!-- 기업회원 로그인 -->
        <jsp:include page="../common/popups/popup_login_com.jsp"/>

        <!-- 일반회원 로그인 -->
        <jsp:include page="../common/popups/popup_login_indv.jsp"/>

		<!-- 타이틀 더미 -->
        <div class="dummy"></div>
        
        <!-- 페이지 타이틀 -->
        <div class="board-edit">
            <div class="total-count"><span>00000</span>개의 글</div>
            <jsp:include page="board_common/board_article_ctrl.jsp"/>
        </div>
        
        <!-- 구분선 -->
        <div class="line"></div>

        <!-- 메인화면 게시판 -->
        <div class="board-total mypage">
            <!-- 게시판 메뉴 -->
            <jsp:include page="board_common/board_nav.jsp"/>

            <!-- 게시판 -->
            <div class="board mypage-right">
                <!-- 페이지 타이틀 -->
                <div class="board-edit">
                    <h1 class="page-title-left">전체질문</h1>
                    <form action="/allkwlist" method="post">
                    <input type="text" name="kw">
           			<input type="submit" value="키워드 검색">
         			</form>
                </div>

                <!-- 구분선 -->
                	<c:choose>
	<c:when test="${articleList!=null && pageInfo.listCount>0 }">
		<section id="listForm">
		<table>
			
			<c:forEach var="article" items="${articleList}">
				<tr>
				<td>${article.q_id }</td>
				<td>
			
				<a href="./totaldetail?q_id=${article.q_id}">
					${article.content} 
				</a>
				</td>
				<td>${article.q_id }</td>
			
			
				</tr>
			</c:forEach>
		</table>
		</section>
		<section id="pageList">
			<c:choose>
				<c:when test="${pageInfo.pg<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="boardlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">[${i }]</c:when>
					<c:otherwise>
						<a href="boardlist?page=${i}">[${i }]</a>
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
		</section>
	</c:when>	
	<c:otherwise>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	</c:otherwise>
	</c:choose>
                <div class="line"></div>

                <div class="board-table detail-row">
                    <div>
                        <a href="/board/total_detail" title="클릭 시 상세 페이지로 이동합니다.">
                            <p>질문 
                                <span>1.</span>
                                <span>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, fugit?</span>
                            </p>
                        </a>
                        
                        <div>
                            <button class="btn">전체답안</button>
                            <button class="btn">모범답안</button>
                        </div>
                    </div>
                </div>

	            <!-- 하부 컨트롤 -->
    	        <jsp:include page="board_common/board_page_ctrl.jsp"/>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


