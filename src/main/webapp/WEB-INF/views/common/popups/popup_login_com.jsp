<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 기업회원 로그인 -->
<div class="popup-card login-com-form">
    <form action="" method="GET" class="login-business join">
        <h1 class="join-title">기업회원 로그인</h1>
     
        <div class="join-holder">
            <!-- 구분선 -->
            <div class="line"></div> 
            <div style="clear:both"></div>
           
            <label for="">이메일</label>
            <input class="join-input holder" type="text" placeholder="이메일">
            <label for="">비밀번호
                <span class="pwReset">
                    <small class="btn pw-search">비밀번호 재설정</small>
                </span>
            </label>
            <input class="join-input holder" type="text" placeholder="비밀번호">

            <div class="mkAccCheck">
                <span class="mkAccText">아직 계정이 없으신가요?</span><span class="mkAccBtn"><a href="join_business.html">계정만들기 ></a></span>
            </div>
          
            <div class="join-confirm">
                <input class="join-btn btn" type="submit" value="이메일 로그인">
                <div class="cookieCfm">
                    <input type="checkbox" id="term_2_login_com">
                    <label for="term_2_login_com">
                        <small>로그인 상태 유지</small>
                    </label>
                </div>
            </div>
        </div>

        <div class="join-text">
            <a href=""><small>이용약관</small></a> |
            <a href=""><small>개인정보 처리방침</small></a> |
            <a href=""><small>FAQ / 문의</small></a>
        </div>
        <div class="join-text">
            <a href="#" onclick="javascript:showPwAlert()" style="color:red;">비밀번호 경고</a>
        </div>
    </form>

     <!-- 비밀번호 오류 팝업 -->
     <div class="popPwAlert" id="popPwAlert">
        <div class="popPwAlertBg"></div>
        <div class="popPwAlertFg">
            <div class="join-confirm">
                <div class="pwAlertText">비밀번호를 n회 실패하셨습니다.<br>다시 입력해 주세요</div>
                <div class="pwAlertTextRed">10회 실패하실 경우 1시간 잠금 상태가 됩니다.</div>
            </div>
            <div class="join-confirm">
                <input class="join-btn" type="button" onclick="javascript:subPwAdmit()" value="확인">
            </div>
        </div>
    </div>
</div>