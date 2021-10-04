<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 기업회원가입 팝업 -->
<div class="popup-card join-business-form">
    <form action="" method="POST" class="login join-business"> 
        <h1 class="join-title">기업 회원가입</h1>
        <span class>로고 이미지</span>
        <div class="join-sub">
            <!--로고 이미지-->
            <div class="profile-outer">
                <div class="profile-inner">
                    <img class="profile-img" width="60px" height="60px" src="https://media-exp1.licdn.com/dms/image/C560BAQFhLg-t7O-vWw/company-logo_200_200/0/1519867699220?e=2159024400&v=beta&t=FH0Kso7uqTQv8C3aGfKAF9xDF6OgsmYmk1mg8ZHTNNI">
                    <span class="profile-img-name">corp-ci.png</span>
                    <button class="btn profile-upload-btn">upload</button>
                </div>
            </div>
        </div>    
            
        <div class="join-holder">    
            <!-- 구분선 -->
            <div class="line"></div> 
            <div style="clear:both"></div>

            <label for="">회사명</label>
            <input class="join-input holder" type="text" placeholder="회사명">
            <label for="">회사 이메일</label>
            <input class="join-input holder" type="email" placeholder="회사 이메일">
            <label for="">비밀번호</label>
            <input class="join-input holder" type="password" placeholder="비밀번호">
            <label for="">비밀번호 확인</label>
            <input class="join-input holder" type="password" placeholder="비밀번호 확인">
            <label for="">담당자 성명</label>
            <input class="join-input holder" type="text" placeholder="담당자 성명">
            <label for="">담당자 전화번호</label>
            <input class="join-input holder" type="text" placeholder="담당자 전화번호">
            
            <div class="join-check">
                <input type="checkbox" id="term_1_com_join">
                <label for="term_1_com_join">
                    <small>이용약관 및 개인접 처리방침에 동의합니다.</small>
                </label>
            </div>
            <div class="join-check"> 
                <input type="checkbox" id="term_2_com_join">
                <label for="term_2_com_join">
                    <small>마케팅 활용 동의 및 광고 수신에 동의합니다.</small>
                </label>
            </div>
            <div class="join-confirm">
                <input class="btn join-btn" type="submit" value="기업회원 가입하기">
            </div>
        </div>

        <div class="join-text">
            <a href=""><small>이용약관</small></a> |
            <a href=""><small>개인정보 처리방침</small></a> |
            <a href=""><small>FAQ / 문의</small></a>
        </div>
    </form>
</div>