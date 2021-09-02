// 스크롤 다운 효과
const nav = document.querySelector('.nav')
window.addEventListener('scroll', () => {
    // 헤더 색 변환
    if (window.scrollY > nav.getBoundingClientRect().bottom) {
        nav.classList.add('down')
    } else {
        nav.classList.remove('down')
    }
    const sun = document.querySelector('.sun')
    // 태양 숨김
    if (sun) {
        if (window.scrollY > 450) {
            sun.style.opacity = '0'
            sun.style.animation = 'none'
        } else {
            sun.style.opacity = '1'
        }
    }
})

// 네비게이션 메뉴 클릭 시 위치표시 효과
const navMenus = document.querySelectorAll('.nav-menu li')
window.addEventListener('load', () => {
    let url = window.location.href
    let urlParts = url.split('/')
    let fileName = urlParts[3]
    removeActive(navMenus)
    if (!fileName) {
        navMenus[0].classList.add('active')
    } else if (fileName.startsWith('board')) {
        navMenus[6].classList.add('active')
    } else if(fileName.startsWith('interview')) {
        navMenus[1].classList.add('active')
    } else if(fileName.startsWith('recruit')) {
        navMenus[12].classList.add('active')
    } else if(fileName.startsWith('mypage')) {
        const myPageLink = document.querySelector('.my-page-link')
        myPageLink.style.transform = 'scale(1.2)'
        myPageLink.style.backgroundColor = '#fff'
        myPageLink.style.color = '#333'
    } else {
        removeActive()
    }
})

// 게시판 사이드 네비게이션 메뉴 클릭 시 위치표시 효과
const navMenusSide = document.querySelectorAll('.side-menu-board li')
window.addEventListener('load', () => {
    let url = window.location.href
    let urlParts = url.split('/')
    let fileName = urlParts[4]
    removeActive(navMenusSide)
    if (!fileName) {
        navMenusSide[0].classList.add('activated')
    } else if (fileName.startsWith('review')) {
        navMenusSide[1].classList.add('activated')
    } else if(fileName.startsWith('free')) {
        navMenusSide[2].classList.add('activated')
    } else if(fileName.startsWith('recommend')) {
        navMenusSide[3].classList.add('activated')
    } else if(fileName.startsWith('best_answer')) {
        navMenusSide[4].classList.add('activated')
    } else {
        removeActive(navMenusSide)
    }
})

// 게시판 사이드 네비게이션 메뉴 클릭 시 위치표시 효과
const navMenusSideMy = document.querySelectorAll('.side-menu-mypage li')
window.addEventListener('load', () => {
    let url = window.location.href
    let urlParts = url.split('/')
    let fileName = urlParts[4]
    removeActive(navMenusSideMy)
    if (!fileName) {
        navMenusSideMy[0].classList.add('activated')
    } else if (fileName.startsWith('pwchange')) {
        navMenusSideMy[1].classList.add('activated')
    } else if(fileName.startsWith('myarticle')) {
        navMenusSideMy[2].classList.add('activated')
    } else if(fileName.startsWith('myinterview')) {
        navMenusSideMy[3].classList.add('activated')
    } else if(fileName.startsWith('delete')) {
        navMenusSideMy[4].classList.add('activated')
    } else if(fileName.startsWith('mentoring')) {
        if (!urlParts[5]) {
            navMenusSideMy[5].classList.add('activated')
        } else {
            navMenusSideMy[6].classList.add('activated')
        }
    }  else {
        removeActive(navMenusSide)
    }
})

// 네비게이션 메뉴 마우스 커서 올릴 때 하위 메뉴 배경 효과
const navBoxes = document.querySelectorAll('.nav-sub-box')
const navSubLists = document.querySelectorAll('.nav-sub-sub li')

navBoxes.forEach((navBox, menuIndex) => {
    let subIndex = 0
    navBox.addEventListener('mouseenter', () => {
        navSubLists.forEach(navSubList => {
            if (subIndex % 2 === 0) {
                navSubList.style.transform = `translateX(${35}px)`
            } else {
                navSubList.style.transform = `translateX(${-135}px)`
            }
            if (navSubList.className === 'sub-last-item') {
                subIndex = -1
            }
            subIndex++ 
        });
    })
});

navBoxes.forEach(navBox => {
    navBox.addEventListener('mouseleave', () => {
        navSubLists.forEach((navSubList, idx) => {
            navSubList.style.transform = `translateX(${-50}px)`
        });
    })
});

// copyright 날짜
const copyDate = document.querySelector('.copyright-date')
const date = new Date()
copyDate.innerHTML = date.getFullYear() + '. ' 
                    + date.getMonth() + '. ' + 
                    date.getDay() + '.'

/// utility functions
function removeActive(Els) {
    Els.forEach(El => {
        El.classList.remove('active')
    });
}
