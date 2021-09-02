<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 팝업배경 더미 -->
<div class="popup-dummy"></div>

<!-- 키워드 카드 팝업 -->
<jsp:include page="popup_keyword.jsp"/>

<!-- 기업회원가입 팝업 -->
<jsp:include page="popup_join_com.jsp"/>

<!-- 일반회원가입 팝업 -->
<jsp:include page="popup_join_indv.jsp"/>

<!-- 일번회원가입 추가입력 폼 팝업 -->
<jsp:include page="popup_join_indv_extra.jsp"/>

<!-- 기업회원 로그인 -->
<jsp:include page="popup_login_com.jsp"/>

<!-- 일반회원 로그인 -->
<jsp:include page="popup_login_indv.jsp"/>

<!-- 비번찿기 -->
<jsp:include page="popup_pw_search.jsp"/>