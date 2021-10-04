<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top_t.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_write.css">
</head>
<body>
     <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>

  <main id="main">
  	<!-- ======= Blog Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>면접후기 글쓰기</h2>

          <ol>
            <li><a href="/">Home</a></li>
            <li>면접후기 글쓰기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Blog Section -->
   

        <!-- 메인화면 게시판 -->
        <div class="board-total-mypage">
           
            <!-- 글쓰기 -->
            <div class="board-mypage-right">
                <!-- 구분선 -->
                <div class="line"></div>
                
                <sec:authentication property="principal" var="user"/> 
                <form action="/review/write_review" method="post" class="write" enctype="multipart/form-data" name="write_review">
                    <input type="hidden" name="email" value="${user.username}">
                    
                    <div class="detail-row">
                        <div>
                            <label for="">포지션</label> 
                            <input type="text" name="pos"
						id="pos" required="required" />
                        </div>
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="">회사명</label>
                            <input type="text" name="company"
						id="company" required="required" />
                        </div>             
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="title">제목</label>
                            <input type="text" name="title"
						id="title" required="required" />
                        </div>
                    </div>
                
                    <label for="content">내용</label>
                    <textarea name="content" id="content" cols="30" rows="10" required="required"></textarea>
                
                    <div class="detail-row">
                        <input type="file" name="rImg">
                		<button type="reset" class="btn write-btn">다시쓰기</button>
                        <button type="submit" id="1" name="1" class="btn write-btn">임시저장</button>
                        <button type="submit" id="0" name="0" class="btn write-btn">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>
</html>


