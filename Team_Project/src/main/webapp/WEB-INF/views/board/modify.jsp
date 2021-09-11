<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 공통 스타일 -->
    <jsp:include page="../common/top_t.jsp"/>
	<!-- 페이지 스타일 -->
	<link rel="stylesheet" href="/style/board_write.css">
	
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	
	<style>
	   #commandCell{
      text-align: center;
   		}
	</style>
	
</head>
<body>

    <!-- 본문 시작 -> 여기서 작업하세요 -->
     <!-- ======= Header ======= -->
  <jsp:include page="../common/nav.jsp"/>

  <main id="main">
  	<!-- ======= Blog Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>글 수정하기</h2>

          <ol>
            <li><a href="/">Home</a></li>
            <li>글 수정하기</li>
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
                
                <form action="/review/modify" method="post" class="write" name="modifyform">
                    <input type = "hidden" name = "reviewId" value = "${review.reviewId}"/>
                    
                    <div class="detail-row">
                        <div>
                            <label for="">포지션</label> 
                            <input type="text" name="pos"
						id="pos" required="required" value = "${review.pos}"/>
                        </div>
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="">회사명</label>
                            <input type="text" name="company"
						id="company" required="required" value = "${review.company}"/>
                        </div>             
                    </div>
                
                    <div class="detail-row">
                        <div>
                            <label for="title">제목</label>
                            <input type="text" name="title"
						id="title" required="required" value = "${review.title}"/>
                        </div>
                    </div>
                
                    <label for="content">내용</label>
                    <textarea name="content" id="content" cols="30" rows="10" required="required">${review.content}</textarea>
                
                    <section id = "commandCell">
						<a href="javascript:modifyboard()">[수정완료]</a>&nbsp;&nbsp;
						<a href="javascript:history.go(-1)">[뒤로가기]</a>
					</section>
                </form>
            </div>
        </div>
    </main>

  <!-- ======= Footer ======= -->
  <jsp:include page="../common/footer.jsp"/>
  
  <!-- Vendor JS Files -->
  <jsp:include page="../common/vendor_js.jsp"/>
  
  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>
</html>


