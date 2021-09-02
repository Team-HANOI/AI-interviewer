<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="mypage-right">
                <!-- 유저정보 제목 -->
                <div class="mypage-content-title">계정 삭제</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    
                    <div class="dialyMT">
                        
                        <table class="mypageTb" style="border: 1px #eee solid;border-radius: 10px;margin:100px 0;padding: 50px 0;">
                            <tr>
                                <td class="mypageTb-0lax">
                                    <p >계정 삭제시 프로필 및 응시한 테스트 정보가 삭제됩니다.</p>
                                </td>
                                <td class="mypageTb-0lax">
                                    <button type="button" class="dltBtn btn">계정 삭제</button>
                                </td>
                            </tr>
                        </table>
                    </div>        
                </form>
            </div>
        </div>
    </main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


