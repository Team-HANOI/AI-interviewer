<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="../common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>
  
  <main id="main">
  	<!-- ======= Our Portfolio Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Our Portfolio</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>Our Portfolio</li>
          </ol>
        </div>

      </div>
    </section><!-- End Our Portfolio Section -->

    <!-- ======= Portfolio Section ======= -->
    <section class="portfolio">
      <div class="container">
      
      	<div class="post">
            <a href="/recruit/form">
                <button class="post-btn btn btn-light">채용공고 올리기</button>
            </a>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter=".filter-app"></li>
              <li data-filter=".filter-card"></li>
              <li data-filter=".filter-web"></li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
        <c:forEach var="r" items="${recruits }">
          <a href="${r.url }">
            <div class="col-lg-4 col-md-6 portfolio-wrap filter-app">
              <div class="portfolio-item">
                <img src='<c:url value="/recruit/img/${r.logoId}"/>'
				  width="1000" class="img-thumbnail card-img img-fluid">
             
                <div class="portfolio-info">
                  <h3>${r.cName }</h3>
             	  <div>
                    <c:set var="keywords" value="${fn:split(r.kw, ',') }"></c:set>
                    <c:forEach var="k" items="${keywords }">
              	      <small class="bg-light px-3 rounded">#${k }</small>&nbsp;
                    </c:forEach>
             	  </div>
           	    </div>
		      </div>
  		    </div>
          </a>
        </c:forEach>
        </div>

      </div>
    </section><!-- End Portfolio Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  
</body>
</html>