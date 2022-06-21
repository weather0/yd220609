let likesId = 0;
let check_status = false;
var like_cnt = $("#like-cnt");
var like_parent = $(".like-container");

var t1 = new TimelineLite();
var t2 = new TimelineLite();

// 좋아요 상태
let checkOn = function () {
  t1.set(like_cnt, { scale: 0 });
  t1.set('.like-btn', { scale: 0 });
  t1.to(like_cnt, 0.6, { scale: 1, background: '#e53637', ease: Expo.easeOut });
  t2.to('.like-btn', 0.65, { scale: 1, ease: Elastic.easeOut.config(1, 0.3) }, '+=0.2');
  //    t1.timeScale(5);
  check_status = true;
}


// 비좋아요 상태
let checkOff = function () {
  t1.to(like_cnt, 1, { scale: 1 }).
    to(like_cnt, 1, { scale: 1, background: 'rgba(255,255,255,0.3)', ease: Power4.easeOut });
  t1.timeScale(7);
  check_status = false;
}


// 터짐 효과
var burst = new mojs.Burst({
  parent: like_parent,
  radius: { 20: 60 },
  count: 15,
  angle: { 0: 30 },
  children: {
    delay: 250,
    duration: 700,
    radius: { 10: 0 },
    fill: ['#e53637'],
    easing: mojs.easing.bezier(.08, .69, .39, .97)
  }
});


// 좋아요 액션
let likeFn = function () {
  $("#like-cnt").click(function () {
    if (!check_status) { // 비좋아요 상태면
      checkOn(); // 좋아요로 전환
      burst.replay();
      // 좋아요 DB입력
      fetch('likes.do', {
        method: 'post',
        headers: { 'Content-type': 'application/x-www-form-urlencoded' },
        body: 'email=' + uid + '&id=' + getParameter('id')
      })
        .catch(err => console.log(err));
    } else { // 기좋아요 상태면
      checkOff(); // 비좋아요로 전환
      // 좋아요 DB삭제
      fetch('likesDelete.do', {
        method: 'post',
        headers: { 'Content-type': 'application/x-www-form-urlencoded' },
        body: 'likes_Id=' + likesId
      })
        .catch(err => console.log(err));
    }
  })
}



// 좋아요 종합
let uid = document.getElementById('uid').value;
console.log(uid);
if (uid != 'null') {
  fetch('likesSelectList.do', {
    method: 'post',
    headers: { 'Content-type': 'application/x-www-form-urlencoded' },
    body: 'email=' + uid + '&id=' + getParameter('id')
  })
    .then(result => result.json()) // 일단 필수 구문. 콘솔.log 안에 넣는 것만으로는 json()이 작동이 안 됨
    .then(result => {
      likesId = result.likes_Id;
      if (result.likes_Id == 0) {
        console.log('현재상태: 로그인O 좋아요X');
        checkOff();
        likeFn();
      } else {
        console.log('현재상태: 로그인O 좋아요O');
        checkOn();
        likeFn();
      }
    })
    .catch(err => console.log(err));
} else {
  console.log('현재상태: 로그인X')
  checkOff();
  $("#like-cnt").click(function () {
    alert('로그인을 해주세요');
  })
}



