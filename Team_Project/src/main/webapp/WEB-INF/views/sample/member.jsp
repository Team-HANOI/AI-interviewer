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
<h1>For Member ....................</h1>

<sec:authorize access="hasRole('USER')">Has USER Role<br></sec:authorize>
<sec:authorize access="hasRole('COMPANY')">Has COMPANY Role<br></sec:authorize>
<sec:authorize access="hasRole('ADMIN')">Has ADMIN Role<br></sec:authorize>
<sec:authorize access="hasAnyRole('USER','COMPANY','ADMIN')">애니롤이다애니롤<br></sec:authorize>

<sec:authorize access="isAuthenticated()">
    Only Authenticated user can see this Text
</sec:authorize>

 <p>사용자이름 : <sec:authentication property="name"/></p> 
<p>사용자 권한 리스트  : <sec:authentication property="principal.authorities"/></p>

</body>
</html>