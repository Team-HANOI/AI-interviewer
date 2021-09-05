<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_write.css">
	
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	
	<style>
	   #commandCell{
      text-align: center;
   		}
	</style>
	
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
                <h1 class="page-title-left">글 수정하기</h1>

                <!-- 구분선 -->
                <div class="line"></div>
                
                <form action="/review/modify" method="post" class="write" name="modifyform">
                    <input type = "hidden" name = "reviewId" value = "${review.reviewId}"/>
                    
                    <div class="detail-row">
                        <div>
                            <label for="">포지션</label> 
                            <input type="text" name="pos"
						id="pos" required="required" value = "${review.pos}"/>
                        </div>
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="">회사명</label>
                            <input type="text" name="company"
						id="company" required="required" value = "${review.company}"/>
                        </div>             
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="title">제목</label>
                            <input type="text" name="title"
						id="title" required="required" value = "${review.title}"/>
                        </div>
                    </div>
                
                    <label for="content">내용</label>
                    <textarea name="content" id="content" cols="30" rows="10" required="required">${review.content}</textarea>
                
                    <section id = "commandCell">
						<a href="javascript:modifyboard()">[수정완료]</a>&nbsp;&nbsp;
						<a href="javascript:history.go(-1)">[뒤로가기]</a>
					</section>
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


