<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="common/top_t.jsp"/>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="common/nav_main.jsp"/>

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex justify-cntent-center align-items-center">
    <div id="heroCarousel" class="container carousel carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

      <!-- Slide 1 -->
      <div class="carousel-item active">
        <div class="carousel-container">
          <h2 class="animate__animated animate__fadeInDown">Welcome to <span>MR. Alpaca</span></h2>
          <p class="animate__animated animate__fadeInUp">알파카로 꿈을 이루세요.</p>
          <a href="" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
        </div>
      </div>

      <!-- Slide 2 -->
      <div class="carousel-item">
        <div class="carousel-container">
          <h2 class="animate__animated animate__fadeInDown">Interview</h2>
          <p class="animate__animated animate__fadeInUp">다양한 면접가능</p>
          <a href="#features" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
        </div>
      </div>

      <!-- Slide 3 -->
      <div class="carousel-item">
        <div class="carousel-container">
          <h2 class="animate__animated animate__fadeInDown">커뮤니티</h2>
          <p class="animate__animated animate__fadeInUp">다양한 정보검색</p>
          <a href="#service" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
        </div>
      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bx bx-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bx bx-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Services Section ======= -->
    <section class="services" id="service">
      <div class="container">
		
		<!-- 첫행 -->
        <div class="row">
        
          <a href="/board/" class="col-md-6 col-lg-4 d-flex row align-items-center" data-aos="fade-up">
            <div class="icon-box icon-box-pink">
              <div class="icon"><i class="bx bxs-book"></i></div>
              <h4 class="title">전체질문</h4>
              <p class="description">면접관련 모든 질문</p>
            </div>
          </a>

          <a href="/review/board_review" class="col-md-6 col-lg-4 d-flex row align-items-center" data-aos="fade-up" data-aos-delay="100">
            <div class="icon-box icon-box-cyan">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4 class="title">면접후기</h4>
              <p class="description">솔직한 면접후기</p>
            </div>
          </a>

          <a href="/board/free" class="col-md-6 col-lg-4 d-flex row align-items-center" data-aos="fade-up" data-aos-delay="200">
            <div class="icon-box icon-box-green">
              <div class="icon"><i class="bx bxs-chalkboard"></i></div>
              <h4 class="title">자유게시판</h4>
              <p class="description">자유롭게 글 올리는 곳</p>
            </div>
          </a>
        </div>
		
		<!-- 두번째 행 -->
		<div class="row">
          <a href="/board/recommend" class="col-md-6 col-lg-4 d-flex row align-items-center" data-aos="fade-up" data-aos-delay="200">
            <div class="icon-box icon-box-blue">
              <div class="icon"><i class="bx bx-message-alt-add"></i></div>
              <h4 class="title">면접질문</h4>
              <p class="description">면접질문 제안</p>
            </div>
          </a>
          
          <div class="col-md-6 col-lg-4 d-flex row align-items-center" data-aos="fade-up" data-aos-delay="200">
			
          </div>

          <a href="/board/best_answers" class="col-md-6 col-lg-4 d-flex row align-items-center" data-aos="fade-up" data-aos-delay="200">
            <div class="icon-box icon-box-purple">
              <div class="icon"><i class="bx bx-git-pull-request"></i></div>
              <h4 class="title">모범답안</h4>
              <p class="description">남들 작성</p>
            </div>
          </a>

        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Why Us Section ======= -->
    <section class="why-us section-bg" data-aos="fade-up" date-aos-delay="200">
      <div class="container">

        <div class="row">
          <div class="col-lg-6 video-box">
            <img src="assets/img/why-us.jpg" class="img-fluid" alt="">
            <a target="_blank" href="https://www.youtube.com/watch?v=-9_d-sFhmRM&list=RD-9_d-sFhmRM&start_radio=1" class="venobox play-btn mb-4" data-vbtype="video" data-autoplay="true"></a>
          </div>

          <div class="col-lg-6 d-flex flex-column justify-content-center p-5">

            <div class="icon-box">
              <div class="icon"><i class="bx bx-fingerprint"></i></div>
              <h4 class="title"><a href="/recruit/">채용공고</a></h4>
              <p class="description">공고보고 지원하기</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bxl-baidu"></i></div>
              <h4 class="title"><a href="/recruit/form">채용공고 등록</a></h4>
              <p class="description">기업채용공고 등록</p>
            </div>

          </div>
        </div>

      </div>
    </section><!-- End Why Us Section -->

    <!-- ======= Features Section ======= -->
	<section class="features" id="features">
		<div class="container">

			<div class="section-title">
				<h2>면접모드</h2>
				<p>다양한 면접모드.</p>
			</div>

			<a href="/interview/normal" class="btn">
				<div class="row" data-aos="fade-up">
					<div class="col-md-5">
						<img src="assets/img/features-1.svg" class="img-fluid" alt="">
					</div>
					<div class="col-md-7 pt-4">
						<h3>일반면접</h3>
						<p class="fst-italic">일반적인 면접모드</p>
					</div>
				</div>
			</a> <a href="/interview/recruit" class="btn">
				<div class="row" data-aos="fade-up">
					<div class="col-md-5 order-1 order-md-2">
						<img src="assets/img/features-2.svg" class="img-fluid" alt="">
					</div>
					<div class="col-md-7 pt-5 order-2 order-md-1">
						<h3>채용모드</h3>
						<p class="fst-italic">채용공고 보고</p>
					</div>
				</div>
			</a> <a href="/interview/custom" class="btn">
				<div class="row" data-aos="fade-up">
					<div class="col-md-5">
						<img src="assets/img/features-3.svg" class="img-fluid" alt="">
					</div>
					<div class="col-md-7 pt-5">
						<h3>맟춤모드</h3>
						<p>키워드 보고</p>
					</div>
				</div>
			</a> <a href="/interview/mentor" class="btn">
				<div class="row" data-aos="fade-up">
					<div class="col-md-5 order-1 order-md-2">
						<img src="assets/img/features-4.svg" class="img-fluid" alt="">
					</div>
					<div class="col-md-7 pt-5 order-2 order-md-1">
						<h3>멘토모드</h3>
						<p class="fst-italic">멘토보고</p>
					</div>
				</div>
			</a>
		</div>
	</section>
		<!-- End Features Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>


