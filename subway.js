// 버튼 누르면 다이얼로그가 나오게
function showDialog() {
  $(".button").click(function() {
    $(".modal").dialog({
      autoOpen: true,
    });
  });
}

// 확인하면 주문 완료하기
function complete() {}

// 주문 완료하면 주문 내역에 기록하기
function writeRecord() {}

function init() {
  const button = document.querySelector(".button");
  button.addEventListener("click", showDialog);
}

init();
