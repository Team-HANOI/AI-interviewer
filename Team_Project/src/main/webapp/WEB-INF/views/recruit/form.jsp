<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
  <link rel="stylesheet" href="/style/recruit_form.css">
</head>

<body>
  <div class="logo">
    <h1 class="text-light"><a href="index.html"><span>Moderna</span></a></h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
  </div>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>
  
  <main id="main">
  	<!-- ======= Our Portfolio Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>채용공고 작성하기</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>채용공고</li>
          </ol>
        </div>

      </div>
    </section><!-- End Our Portfolio Section -->

    <!-- ======= Portfolio Section ======= -->
    <section class="portfolio">
      <div class="container">
      	<!-- 채용공고 작성 -->
        <form action="/recruit/form" method="POST" class="form-box">

            <!-- 구분선 -->
            <div class="line"></div>

            <div class="login-sub">
                <div class="post_page-box">
                    <div class="post_page-sub-box">
                        <label for="com-name">회사이름</label>
                        <input id="com-name" name="cName" class="login-input" type="text" placeholder="">
                    </div>
                    <div class="post_page-sub-box">
                        <label for="com-email">이메일</label>
                        <input id="com-email" name="email" class="login-input" type="email" placeholder="">
                    </div>
                    <div class="post_page-sub-box">
                        <label for="r-position">모집 포지션</label>
                        <input id="r-position" name="pos" class="login-input" type="text" placeholder="">
                    </div>
                    <div class="post_page-sub-box">
                        <label for="r-period">기간</label>
                        <input id="r-period" name="rStartdate" class="login-input" type="date">
                        <p class="from-to"> ~ </p>
                        <input id="" name="rEnddate" class="login-input" type="date">
                    </div>

                    <div class="post_page-sub-box">
                        <label>키워드</label>
                        <div class="post-keywords">
                            <div class="post-keyword">
                                <input id="post-kw1" name="kw" type="checkbox" value="java">
                                <label for="post-kw1">#java</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw2" name="kw" type="checkbox" value="c#">
                                <label for="post-kw2">#c#</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw3" name="kw" type="checkbox" value="c">
                                <label for="post-kw3">#c</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw4" name="kw" type="checkbox" value="c++">
                                <label for="post-kw4">#c++</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw5" name="kw" type="checkbox" value="python">
                                <label for="post-kw5">#python</label>
                            </div>
                            <div class="post-keyword">
                                <input id="post-kw6" name="kw" type="checkbox" value="php">
                                <label for="post-kw6">#php</label>
                            </div>
                        </div>
                    </div>

                    <div class="post_page-sub-box">
                        <label for="">URL</label>
                        <input id="" name="url" class="login-input" type="text" placeholder="">
                    </div>

                    <div class="post_page-sub-box">
                        <label for="">경력</label>
                        <input id="" name="career" class="login-input" type="number" placeholder="ex) 1">
                    </div>
                </div>

                <input class="login-btn apply btn" type="submit" value="채용공고 올리기">
            </div>
        </form>
      	

      </div>
    </section><!-- End Portfolio Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>