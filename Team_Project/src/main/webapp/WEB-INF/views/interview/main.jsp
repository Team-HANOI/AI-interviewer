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
  	

    <!-- ======= Our Services Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>가상면접</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>면접하기</li>
          </ol>
        </div>
      </div>
    </section><!-- End Our Services Section -->
    
    <!-- ======= Tetstimonials Section ======= -->
    <section class="testimonials" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>이용후기</h2>
          <p>많은 분들이 사이트를 통해 구직</p>
        </div>

        <div class="testimonials-carousel swiper-container">
          <div class="swiper-wrapper">
            <div class="testimonial-item swiper-slide">
              <img src="/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
              <h3>Saul Goodman</h3>
              <h4>Developer</h4>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                알파카덕에 취직했어요
                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>

            <div class="testimonial-item swiper-slide">
              <img src="/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
              <h3>Sara Wilsson</h3>
              <h4>Designer</h4>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                실제같은 면접 취업에 많은 도움이 됐어요.
                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>

            <div class="testimonial-item swiper-slide">
              <img src="/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
              <h3>Jena Karlis</h3>
              <h4>Fromt Developer</h4>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                면접준비하시는 분들에게 강추합니다.
                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>

            <div class="testimonial-item swiper-slide">
              <img src="/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
              <h3>Matt Brandon</h3>
              <h4>Freelancer</h4>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                장난아닙니다.
                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>

            <div class="testimonial-item swiper-slide">
              <img src="/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
              <h3>John Larson</h3>
              <h4>Entrepreneur</h4>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                알파카에서 좋은 인재 영입했어요.
                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section><!-- End Ttstimonials Section -->

    <!-- ======= Service Details Section ======= -->
    <section class="service-details">
      <div class="container">

        <div class="row">
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="/image/i_normal.jpg" alt="normal interview image">
              </div>
              <div class="card-body">
                <h5 class="card-title">일반면접</h5>
                <p class="card-text">프론트엔드 또는 백엔드를 선택하여 풀어보는 일반면접모드 도전 해 보세요</p>
                <div class="read-more"><a class="fs-6 bg-light" href="/interview/steps_n"><i class="bi bi-arrow-right"></i> 시작하기</a></div>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="/image/i_recruit.jpg" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title">기업맞춤면접</h5>
                <p class="card-text">가고싶은 기업이 있으신가요? 기업별 자주나오는 면접질문에 도전 해 보세요</p>
                <div class="read-more"><a class="fs-6 bg-light" href="/interview/steps_r"><i class="bi bi-arrow-right"></i> 시작하기</a></div>
              </div>
            </div>

          </div>
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="/assets/img/service-details-3.jpg" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title">키워드면접</h5>
                <p class="card-text">특정 분야를 집중적으로 풀고 싶으세요? 키워드로 관련 질문만 골라서 도전 해 보세요</p>
                <div class="read-more"><a class="fs-6 bg-light" href="/interview/steps_k"><i class="bi bi-arrow-right"></i> 시작하기</a></div>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="/image/i_mentor.jpg" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title">멘토면접</h5>
                <p class="card-text">현업에서 근무 중인 개발자의 메토링을 받아보세요</p>
                <div class="read-more"><a class="fs-6 bg-light" href="/interview/steps_m"><i class="bi bi-arrow-right"></i> 시작하기</a></div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Service Details Section -->

    <!-- ======= Pricing Section ======= -->
    <section class="pricing section-bg" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>Pricing</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="row no-gutters">

          <div class="col-lg-4 box">
            <h3>Free</h3>
            <h4>$0<span>per month</span></h4>
            <ul>
              <li><i class="bx bx-check"></i> 일반면접</li>
              <li><i class="bx bx-check"></i> 맞춤면접</li>
              <li><i class="bx bx-check"></i> 채용면접</li>
              <li><i class="bx bx-check"></i> 멘토면접</li>
              <li class="na"><i class="bx bx-x"></i> <span>피드백</span></li>
            </ul>
            <a href="#" class="get-started-btn">Get Started</a>
          </div>

          <div class="col-lg-4 box featured">
            <h3>Premium</h3>
            <h4>$29<span>per month</span></h4>
            <ul>
              <li><i class="bx bx-check"></i> 일반면접</li>
              <li><i class="bx bx-check"></i> 맞춤면접</li>
              <li><i class="bx bx-check"></i> 채용면접</li>
              <li><i class="bx bx-check"></i> 멘토면접</li>
              <li><i class="bx bx-check"></i> 피드백</li>
            </ul>
            <a href="#" class="get-started-btn">Get Started</a>
          </div>

          <div class="col-lg-4 box">
            <h3>Business</h3>
            <h4>$49<span>per month</span></h4>
            <ul>
              <li><i class="bx bx-check"></i> 채용공고</li>
              <li><i class="bx bx-check"></i> 인재추천</li>
              <li><i class="bx bx-check"></i> 멘토등록</li>
            </ul>
            <a href="#" class="get-started-btn">Get Started</a>
          </div>

        </div>

      </div>
    </section><!-- End Pricing Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>

</body>

</html>


