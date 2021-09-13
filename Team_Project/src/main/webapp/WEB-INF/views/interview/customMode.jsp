<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
								일반면접모드 -> 백엔드 직무 면접 화면
								일반면접모드 -> 백엔드 직무 면접 화면
								일반면접모드 -> 백엔드 직무 면접 화면
								일반면접모드 -> 백엔드 직무 면접 화면
								일반면접모드 -> 백엔드 직무 면접 화면
																 -->
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../common/top_t.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>

<script>
var idx=0;
var qIds = new Array();
var answers = new Array();
var chosenKw = "${keyword}";
var type = "${type }";
var contents = new Array();


<c:forEach items="${questions}" var="question">
	qIds.push("${question.qId}");
	contents.push("${question.content}");
</c:forEach>

var step=qIds.length;

$(function() {
	$("#question").text(contents[idx]);
	$("#speaker").click(function() {
		alert($("#question").text());
		requestVoice($("#question").text());
	});
	$("#nextBtn").click(function() {
		
		if($("#answer").val() == ""){
			alert("답변을 해주세요.");
			return ;
		}
		++idx;
		if(idx<step) {
			$("#question").text(contents[idx]);
			$("#answer").val("");
		} else {
			alert("마지막 질문 입니다.");
			reqeustNextPage();

		}
	});
	
	
});

function requestVoice(questionText) {
	var request = new XMLHttpRequest();
	request.responseType = "blob";
	request.onload = function() {
 		var audioURL = URL.createObjectURL(this.response);	
 		var audio = new Audio();
		audio.src = audioURL;
		audio.play();
 	}
	request.open("POST", '/interview/questionvoice');
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	var params = "question="+questionText;
	request.send(params);
}

function reqeustNextPage() {

	let formdata = new FormData();
	
	formdata.append("type", type);
	formdata.append("kws",chosenKw);
    formdata.append("qIds", qIds);
    formdata.append("answers", answers);
    formdata.append("cnt", bloblist.length);
    
    
    for(var i = 0; i < bloblist.length; i++){
    
   		formdata.append("data"+String(i), bloblist[i]);
   		
    }
   
    let xhr = new XMLHttpRequest();
    xhr.onload = () => {
    
    	if (xhr.status === 200) {// HTTP가 잘 동작되었다는 뜻.
			console.log("response:"+xhr.response);
    		location.href="/mypage/myinterview";
    		     
    	}                 
    }
    xhr.open("POST", "/interview/saveanswervoice", true);
    xhr.send(formdata);
}

</script>

<style>
#question{
	color: white;
	font-size: 30px;
}

</style>


</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="../common/nav.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="" class=""
		style="background-image: url('/image/i_backend.jpg'); background-size: cover;">
	</section>
	<!-- End Hero -->
	<main id="main">
		<!-- ======= Our Portfolio Section ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">

					<ol>
						<li><a href="/">Home</a></li>

					</ol>
				</div>
			</div>
		</section>
		<!-- End Our Portfolio Section -->

		<!-- ======= Portfolio Section ======= -->
		<section class="portfolio">
			<div class="container">

				<div class="row portfolio-container" data-aos="fade-up"
					data-aos-easing="ease-in-out" data-aos-duration="500">
					<div
						class="col-lg-12 col-md-6 portfolio-wrap filter-app interview-question interview-text">
						<div class="portfolio-item row text-wrap" id="question">


						</div>
						<ul id="portfolio-flters">

							<li data-filter="*" class="filter">
								<button class="btn btn-light" id="speaker">질문 듣기</button>
							</li>

						</ul>
					</div>
				</div>



				<div class="row" data-aos="fade-up" data-aos-easing="ease-in-out"
					data-aos-duration="500">
					<textarea name="" id="answer" rows="10" class="interview-answer interview-text col-lg-12 col-md-6 portfolio-wrap filter-app interview-question interview-text">
</textarea>
				</div>
				<ul id="portfolio-flters">
					<li data-filter="*" class="filter">
						<button class="btn btn-light" id="record">녹음</button>
					</li>

					<li data-filter=".filter-app">
						<button class="btn btn-light" id="stop">정지</button>
					</li>
				</ul>

				<ul id="portfolio-flters">

					<li data-filter="*" class="filter">
						<button class="btn btn-light" id="nextBtn">다음질문</button>
					</li>

				</ul>

			</div>
		</section>
		<!-- End Portfolio Section -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../common/footer.jsp" />

	<!-- Vendor JS Files -->
	<jsp:include page="../common/vendor_js.jsp" />

	<!-- Template Main JS File -->
	<script src="../assets/js/main.js"></script>


	<script>
    const record = document.getElementById("record")
    const stop = document.getElementById("stop")
    const textarea = document.getElementById("answer")
	const audioCtx = new(window.AudioContext || window.webkitAudioContext)() // 오디오 컨텍스트 정의
	const analyser = audioCtx.createAnalyser()
	let bloblist = [];
	
	if (navigator.mediaDevices) {
		
        console.log('getUserMedia supported.')
        const constraints = {
            audio: true
        }
        let chunks = []

        navigator.mediaDevices.getUserMedia(constraints)
            .then(stream => {
                const mediaRecorder = new MediaRecorder(stream)  
                record.onclick = () => {
                	chunks = [];
                    mediaRecorder.start()
                    console.log(mediaRecorder.state)
                    console.log("recorder started")
                    record.style.background = "red"
                    record.style.color = "black"
                }

                stop.onclick = () => {
                    mediaRecorder.stop()
                    console.log(mediaRecorder.state)
                    console.log("recorder stopped")
                    record.style.background = ""
                    record.style.color = ""
                }

                mediaRecorder.onstop = e => {
                    const blob = new Blob(chunks, {
                        'type': 'audio/ogg codecs=opus'
                    })
                    bloblist.push(blob);
                    let formdata = new FormData();
                    formdata.append("fname", "audio.webm");
                    formdata.append("data", blob);
                    let request = new XMLHttpRequest();
                    request.onload = () => {
    	               	if (request.status === 200) {// HTTP가 잘 동작되었다는 뜻.
	                       	console.log("response:"+request.response);
                       		textarea.value=request.response;  
                       		answers.push(textarea.value);
                       	}                 
                    }
                    
                    request.open("POST", "/interview/answertext", true);
                    request.send(formdata);
                    
                }

                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data)
                }
            })
            .catch(err => {
                console.log('The following error occurred: ' + err)
            })
    }	
  </script>
</body>
</html>

