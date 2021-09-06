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
<h1>로그인 사용자 정보 jsp에 출력하기</h1>
<!-- JSP 상단에 스프링 시큐리티 관련 태그 라이브러리를 선언합니다-->

<sec:authorize access="hasRole('USER')">USER 권한이 있는 사용자만 보입니다<br></sec:authorize>
<sec:authorize access="hasRole('COMPANY')">COMPANY 권한이 있는 사용자만 보입니다<br></sec:authorize>
<sec:authorize access="hasRole('ADMIN')">ADMIN 권한이 있는 사용자만 보입니다<br></sec:authorize>
<sec:authorize access="hasAnyRole('USER','COMPANY')">USER나 COMPANY 권한이 있는 사용자만 보입니다</sec:authorize>
<br>
<sec:authorize access="isAuthenticated()">
    로그인한 사용자만 보입니다. 즉, USER, COMPANY, ADMIN 모두한테 보입니다.
</sec:authorize>
<br>
<sec:authorize access="isAnonymous()">
    비로그인 사용자만 보입니다
</sec:authorize>



<sec:authorize access="isAuthenticated()">
<h2>회원정보 출력</h2>

<!--   @GetMapping("/example")
  public void security(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
  }
  에서 authMemberDTO가 principal입니다
-->
<sec:authentication property="principal" var="user"/> 

타입 : ${user} <br>
권한 리스트 : ${user.authorities} <br>
email : ${user.username} <br> <!-- email이 아니라 username  -->
pw : ${user.password} <br> <!-- pw가 아니라 password -->
pfId : ${user.pfId } <br>
name : ${user.name } <br> <!-- username과 혼동 주의 -->
enabled : ${user.enabled} <br>
fromSocial : ${user.fromSocial} <br>
phoneNum : ${user.phoneNum} <br>
type : ${user.type} <br>
lockdate : ${user.lockdate} <br>
failureCnt : ${user.failureCnt} <br>
regdate : ${user.regdate} <br>
updatedate : ${user.updatedate} <br>

<br>

<h3>소셜 로그인 사용자 관련 정보입니다</h3>
attr : ${user.attr} <br>
sub : ${user.attr.sub} <br>
picture : ${user.attr.picture} <br>
<img alt="구글 프로필 이미지" src="${user.attr.picture}"><br>
email : ${user.attr.email} <br>
email_verified : ${user.attr.email_verified} <br>

<br>

<h3>기업 회원 관련 정보입니다</h3>
logoImgId : ${user.logoImgId} <br>
cEmail : ${user.cEmail} <br>
cName : ${user.cName} <br>
</sec:authorize>

<%-- <c:if test="${user.username == 글 작성자 이메일}">
    내글만 수정삭제 버튼 보이게
</c:if> --%>


<!-- Access Denied의 경우에는 403에러메시지가 발생합니다. JSP에서는 HttpServletRequest안에  
'SPRING_SECURITY_403_EXCEPTION'라는 이름으로 AccessDeniedException 객체가 전달됩니다.-->
<c:out value = "${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/> 




</body>
</html>