


//좋아요 기능
function likeCnt(reviewId) {
	$.ajax({
		type: "GET",
		url: "./reviewLikeCall", //요청 URL 
		data: { reviewId: reviewId }, //요청과 함께 서버에 보내는 string 또는 json
		dataType: "text", // 서버에서 내려온 data 형식. ( default : xml, json, script, text, html )
		success: function(data, textStatus) { // 요청에 성공하면 함수 실행 data는 응답 데이터가 들어간다
			if (textStatus == 'success') {
				const cn1 = data.toLocaleString('ko-KR');
				$("#likeCnt").text(cn1);
				
			};
		},
		error: function(response, textStatus) { // 에러가 났을 경우의 작업
			alert("오류가 발생했습니다.");
		}
	});
	return false; // 페이지 리로딩을 막는다. 
};


//본댓글달기
function addComment(reviewId) {
	//alert(reviewId);
	if ($("#content").val() == null || $("#content").val() == "") {
		alert("댓글을 입력하세요");
		return false;
	}
	//alert("comment-form");
	$("#comment-form").submit();

}


//본댓글의 답글달기
let comms = document.querySelectorAll('.comm')
const btnCommFns = document.querySelectorAll('.btn-commChildFn')
btnCommFns.forEach((btn, idx) => {
	btn.addEventListener('click', () => {
		console.log(idx)
		comms[idx].style.display = 'block'
	})
})

function removeActive() {
comms.forEach((comm, idx) => {
	console.log(idx)
	comm.style.display = 'none'
})
}

function commentChildFn() {
}

//대댓글의 답글달기
let recomms = document.querySelectorAll('.recomm')
const btnReCommFns = document.querySelectorAll('.btn-reCommChildFn')
btnReCommFns.forEach((btn, idx) => {
	btn.addEventListener('click', () => {
		console.log(idx)
		recomms[idx].style.display = 'block'
	})
})


function removeActive() {
recomms.forEach((recomm, idx) => {
	console.log(idx)
	recomm.style.display = 'none'
})
}


function addCommentChild(reviewId, prtComId) {
	alert(reviewId);
	alert($("#"+prtComId).val());
	
	if ($("#"+prtComId).val() == null || $("#"+prtComId).val() == "") {
		alert("댓글을 입력하세요");
		return false;
	}
	alert("commentChild-form");
	$("#commentChild-form").submit();

}

$(function() {
	$('.commChildForm').submit(function(event) {
		var value = $(this).find('.commentChild')[0].value;		
		if (value==null || value==""){
			event.preventDefault();
		}
	});
});

