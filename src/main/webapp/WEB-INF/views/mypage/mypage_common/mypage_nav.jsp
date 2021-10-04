<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 게시판 메뉴 -->
<div class="board-container mypage-left">                
    <div class="mypage-left-bottom side-menu-mypage">
        <ul style="padding-left: 0px;">
            <a href="/mypage/"><li >👔 프로필 관리</li></a>
            <a href="/mypage/myinterview"><li>📄 내 면접 기록</li></a>
            
            <sec:authorize access="hasRole('USER')">
            <a href="/mypage/mentoring"><li>👥 내 멘토링 일정</li></a>
            </sec:authorize>
						<sec:authorize access="hasRole('COMPANY')">
            <a href="/mypage/mentoring/com" ><li>👥 멘토링 지원자 리스트</li></a>
						</sec:authorize>
            <a href="/mypage/pwchange"><li>🔧 비밀번호 변경</li></a>
            <a href="/mypage/delete"><li>🗑️ 계정 삭제</li></a>
        </ul>
    </div>
</div>