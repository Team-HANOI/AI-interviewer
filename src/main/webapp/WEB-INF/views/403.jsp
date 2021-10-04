<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html xmlns:sec="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>403 에러</h1>

<sec:authorize access="hasRole('USER')">USER 권한이 있는 사용자만 보입니다<br></sec:authorize>
<sec:authorize access="hasRole('COMPANY')">COMPANY 권한이 있는 사용자만 보입니다<br></sec:authorize>
<sec:authorize access="hasRole('ADMIN')">ADMIN 권한이 있는 사용자만 보입니다<br></sec:authorize>

<p>사용자이름 : <sec:authentication property="name"/></p> 
<p>사용자 권한 리스트  : <sec:authentication property="principal.authorities"/></p>
</body>
</html>