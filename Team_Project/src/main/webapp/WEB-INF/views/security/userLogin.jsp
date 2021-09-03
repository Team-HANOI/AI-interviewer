<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title></title>
</head>
<body>
<div class="container">
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
    <c:if test="${path == '/customLogin/company'}">
      <h1>기업 회원 로그인</h1>
    </c:if>
    <c:if test="${path == '/customLogin'}">
      <h1>개발자 로그인</h1>
    </c:if>
    <form action="/user_login" method="post">
		    <c:if test="${param.error != null}">
		    <p>
		        Login Error! <br />
		        ${error_message}
		    </p>
		    </c:if>
        <div class="form-group">
            <input type="text" name="username" class="form-control" placeholder="이메일 입력해주세요">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="비밀번호">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <br/>
</div>

 
    <c:if test="${path != '/customLogin/company'}">
      <a href="/oauth2/authorization/google">구글 아이디로 로그인</a> <!-- 시큐리티가 제공하는 url. 그래서 별도의 컨트롤러를 생성할 필요가 없다 -->
    </c:if>
 
    <a href="/logout">로그아웃</a> <!-- 시큐리티가 제공하는 url. 그래서 별도의 컨트롤러를 생성할 필요가 없다 -->
    
    <c:if test="${path == '/customLogin/company'}">
      <a href="/customLogin">개발자 로그인</a>
    </c:if>
    
    <c:if test="${path == '/customLogin'}">
      <a href="/customLogin/company">기업 회원 로그인</a>
    </c:if>

</body>
</html>
