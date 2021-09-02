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
                <div class="dateMT">2021. 8. 21 맞춤면접 기록</div>
                <div class="line"></div>
                <!-- 사용자 정보 -->
                <form action="" method="POST" class="mypage-content">
                    <!-- 질의 응답-->
                    <div class="dialyMT">
                        <table class="mypageTb">
                            <tr>
                                <td class="mypageTb-02ax">
                                    <p>질문 1. 누구십니까?</p>
                                </td>
                                <td class="mypageTb-03ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="mypageTb-01ax">
                                    <p>초보 개발자 입니다.</p>
                                </td>
                                <td class="mypageTb-04ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- 질의 응답-->
                    <div class="dialyMT">
                        <table class="mypageTb">
                            <tr>
                                <td class="mypageTb-02ax">
                                    <p>질문 2. 누구십니까?</p>
                                </td>
                                <td class="mypageTb-03ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="mypageTb-01ax">
                                    <p>초보 개발자 입니다.</p>
                                </td>
                                <td class="mypageTb-04ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- 질의 응답-->
                    <div class="dialyMT">
                        <table class="mypageTb">
                            <tr>
                                <td class="mypageTb-02ax">
                                    <p>질문 3. 누구십니까?</p>
                                </td>
                                <td class="mypageTb-03ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="mypageTb-01ax">
                                    <p>초보 개발자 입니다.</p>
                                </td>
                                <td class="mypageTb-04ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- 질의 응답-->
                    <div class="dialyMT">
                        <table class="mypageTb">
                            <tr>
                                <td class="mypageTb-02ax">
                                    <p>질문 4. 누구십니까?</p>
                                </td>
                                <td class="mypageTb-03ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="mypageTb-01ax">
                                    <p>초보 개발자 입니다.</p>
                                </td>
                                <td class="mypageTb-04ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- 질의 응답-->
                    <div class="dialyMT">
                        <table class="mypageTb">
                            <tr>
                                <td class="mypageTb-02ax">
                                    <p>질문 5. 누구십니까?</p>
                                </td>
                                <td class="mypageTb-03ax">
                                    <button type="button" class="playBtn">듣기</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="mypageTb-01ax">
                                    <p>초보 개발자 입니다.</p>
                                </td>
                                <td class="mypageTb-04ax">
                                    <button type="button" class="playBtn">듣기</button>
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


