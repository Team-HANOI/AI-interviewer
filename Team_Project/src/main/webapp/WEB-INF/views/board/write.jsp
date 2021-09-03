<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_write.css">
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

        <!-- 메인화면 게시판 -->
        <div class="board-total mypage">
            <!-- 게시판 메뉴 -->
            <jsp:include page="board_common/board_nav.jsp"/>

            <!-- 글쓰기 -->
            <div class="board mypage-right">
                <!-- 페이지 타이틀 -->
                <h1 class="page-title-left">글쓰기</h1>

                <!-- 구분선 -->
                <div class="line"></div>
                
                <form action="/review/write_review" method="post" class="write" enctype="multipart/form-data" name="write_review">
                    <div class="detail-row">
                        <div>
                            <label for="">포지션</label> 
                            <input type="text" name="pos"
						id="pos" required="required" />
                        </div>
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="">회사명</label>
                            <input type="text" name="company"
						id="company" required="required" />
                        </div>             
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="title">제목</label>
                            <input type="text" name="title"
						id="title" required="required" />
                        </div>
                    </div>
                
                    <label for="content">내용</label>
                    <textarea name="content" id="content" cols="30" rows="10" required="required"></textarea>
                
                    <div class="detail-row">
                        <input type="file" name="rImg">
                		<button type="reset" class="btn write-btn">다시쓰기</button>
                        <button type="submit" id="1" name="1" class="btn write-btn">임시저장</button>
                        <button type="submit" id="0" name="0" class="btn write-btn">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


