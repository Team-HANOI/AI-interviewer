// 폼 작성완료 메시지 효과
const submit = document.querySelector('.apply')
if (submit) {
    submit.addEventListener('click', (e) => {
        e.preventDefault()
        document.body.classList.add('complete')
    })
}

// 키워드 팝업효과
const keywordPopups = document.querySelectorAll('.keyword-popup')
if (keywordPopups) {
    keywordPopups.forEach(keywordPopup => {
        keywordPopup.addEventListener('click', () => {
            document.body.classList.add('show-keyword-popup')
        })
    })
}

// 비밀번호 찿기 팝업효과
const pwSearch = document.querySelector('.pw-search')
if (pwSearch) {
    pwSearch.addEventListener('click', () => {
        console.log("clicked")
        document.body.className = ''
        setTimeout(() => {
            document.body.classList.add('show-search-popup')
        }, 500);
    })
}

// 기업회원 가입 팝업효과
const joinCom = document.querySelector('.join-com')
if (joinCom) {
    joinCom.addEventListener('click', () => {
        document.body.classList.add('show-join-com-popup')
    })
}

// 개인회원 가입 팝업효과
const joinIndividua = document.querySelector('.join-individual')
if (joinIndividua) {
    joinIndividua.addEventListener('click', () => {
        document.body.classList.add('show-join-indi-popup')
        const confirms = document.querySelectorAll('.join-confirm .join-btn')
        confirms.forEach(confirm => {
            confirm.addEventListener('click', () => {
                document.body.classList.remove('show-join-indi-popup')
                document.body.classList.add('show-join-indi-extra-popup')
            })
        });
    })
}

// 기업회원 로그인 팝업효과
const loginCom = document.querySelector('.login-com')
if (loginCom) {
    loginCom.addEventListener('click', () => {
        document.body.classList.add('show-login-com-popup')
    })
}

// 개인회원 로그인 팝업효과
const loginIndividuals = document.querySelectorAll('.login-individual')
if (loginIndividuals) {
    loginIndividuals.forEach(loginIndividual => {
        loginIndividual.addEventListener('click', () => {
            document.body.classList.add('show-login-individual-popup')
        })
    });
}

// join-person 주요기술 팝업
function showTech(){
    document.getElementById("popTech").style.display="block";
}

function subAdmit(){
    document.getElementById("popTech").style.display="none";
}

function subCancel(){
    document.getElementById("popTech").style.display='none';
}


// login-person 비밀번호 오류 경고 팝업
function showPwAlert(){
    document.getElementById("popPwAlert").style.display="block";
}

function subPwAdmit(){
    document.getElementById("popPwAlert").style.display="none";
}

function subPwCancel(){
    document.getElementById("popPwAlert").style.display='none';
}