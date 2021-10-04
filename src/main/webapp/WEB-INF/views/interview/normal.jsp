<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <h2>일반면접 세부선택(백/프론트)</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>일반면접</li>
          </ol>
        </div>

      </div>
    </section><!-- End Our Portfolio Section -->

    <!-- ======= Portfolio Section ======= -->
    <section class="portfolio">
      <div class="container">

        <div class="row portfolio-container" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">

          <div class="col-lg-4 col-md-6 portfolio-wrap filter-app">
            <a href="/interview/backEnd">
              <div class="portfolio-item">
                <img src="/image/i_backend.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3>백엔드</h3>
                </div>
              </div>
            </a>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-wrap filter-app"></div>

          <div class="col-lg-4 col-md-6 portfolio-wrap filter-web">
            <a href="/interview/frontEnd">
              <div class="portfolio-item">
                <img src="/image/i_frontend.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3 class="text-warning">프론트 엔드</h3>
                </div>
              </div>
            </a>
          </div>
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