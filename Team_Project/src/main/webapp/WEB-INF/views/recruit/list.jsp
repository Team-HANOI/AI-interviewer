<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일  -->
    <jsp:include page="../common/top.jsp"/>
	<!-- 페이지 스타일  -->
	<link rel="stylesheet" href="/style/recruit_list.css">
</head>
<body>
    <!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 본문 시작 -> 여기서 작업하세요 -->
    <main>
    	<!-- 태양 -->
    	<div class="sun">
            <img src="https://pngimg.com/uploads/sun/sun_PNG13439.png" alt="">
        </div>
        
    	<!-- 팝업 -->
        <jsp:include page="../common/popups/popups.jsp"/>

        <!-- 본문 타이틀 -->
        <div class="title">
            <div class="title-text">
                <h1 class="text">채용공고</h1>
            </div>
        </div>

        <div class="post">
            <a href="/recruit/form">
                <button class="post-btn btn">채용공고 올리기</button>
            </a>
        </div>

        <!-- 공고 -->
		<div class="card-box">
			<c:forEach var="r" items="${recruits }">
            <a href="${r.url }">
                <div class="card">
                    <div class="text-wrap">
                        <h1>회사이름: ${r.cName }</h1>
                        <p>경력: ${r.career }</p>
                        <c:set var="keywords" value="${fn:split(r.kw, ',') }"></c:set>
                        <c:forEach var="k" items="${keywords }">
	                        <small>#${k }</small>&nbsp;
                        </c:forEach>
                    </div>
                    <img class="card-img" src="${r.fileData }" alt="" srcset="">
                    <!-- 첨부파일 -->
						<c:set var="len" value="${fn:length(file.fileName)}" />
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
								<a href='<c:url value="/review/pds/${r.fileData }"/>'>${file.fileName}</a>
								<br>
							</c:otherwise>
						</c:choose>
					</div>
            </a>
            </c:forEach>
        </div>
	</main>

    <!-- 꼬리 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>


