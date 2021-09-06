<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- 공통 스타일  -->

<jsp:include page="../common/top.jsp" />
<!-- 페이지 스타일  -->

<link rel="stylesheet" href="/style/interview_normal.css">
<script>
var idx=0;

var qIds = new Array();
var answers = new Array();

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
			
		} else if(idx == step){
		
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
	
	formdata.append("type", "1");
	formdata.append("pos", "front");
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
    		location.href="/interview/result";  
    		     
    	}                 
    }
    xhr.open("POST", "/interview/saveanswervoice", true);
    xhr.send(formdata);
}

</script>


</head>
<body>
	<!-- 머리말: 앱 타이틀, 네비메뉴, 마이페이지 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 본문 시작 -> 여기서 작업하세요 -->
	<main>
		<!-- 태양 -->
		<div class="sun">
			<img src="https://pngimg.com/uploads/sun/sun_PNG13439.png" alt="">
		</div>

		<!-- 팝업 -->
		<!-- 팝업배경 더미 -->
		<div class="popup-dummy"></div>

		<!-- 키워드 카드 팝업 -->
		<jsp:include page="../common/popups/popup_keyword.jsp" />

		<!-- 기업회원가입 팝업 -->
		<jsp:include page="../common/popups/popup_join_com.jsp" />

		<!-- 일반회원가입 팝업 -->
		<jsp:include page="../common/popups/popup_join_indv.jsp" />

		<!-- 일번회원가입 추가입력 폼 팝업 -->
		<jsp:include page="../common/popups/popup_join_indv_extra.jsp" />

		<!-- 기업회원 로그인 -->
		<jsp:include page="../common/popups/popup_login_com.jsp" />

		<!-- 일반회원 로그인 -->
		<jsp:include page="../common/popups/popup_login_indv.jsp" />

		<!--본문 면접모드-->
		<div class="interview">
			<div class="interview-content">

				<h2>질문:</h2>
				<div class="interview-question interview-text" id="question">

				</div>
				<button type="button" id="speaker">듣기</button>

				<h2>답변:</h2>
				<textarea name="" id="answer"
					class="interview-answer interview-text"></textarea>
				<button id="record">녹음</button>
				<button id="stop">정지</button>

				<div class="interview-time">
					<p>
						남은시간: <span class="time-left">00:00</span>
					</p>
				</div>

			</div>



			<div class="btn-box">
				<button class="btn interview-btn" id="nextBtn">다음질문</button>
			</div>


		</div>
	</main>

	<!-- 꼬리 -->
	<jsp:include page="../common/footer.jsp" />

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>




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
