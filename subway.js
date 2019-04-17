// 버튼 누르면 다이얼로그가 나오게
function showDialog() {
  const breadList = document.querySelector(".bread");
  const radio = breadList.getElementsByTagName("input");
  const topList = document.querySelector(".topping");
  const topping = topList.getElementsByTagName("input");
  const vegList = document.querySelector(".veg");
  const veget = vegList.getElementsByTagName("input");
  const sauceList = document.querySelector(".sauce");
  const sauce = sauceList.getElementsByTagName("input");
  const setList = document.querySelector(".set");
  const set = setList.getElementsByTagName("input");
  
  let bread = "";
  let toparray = [];
  let vegarray = []; 
  let saucearray = [];
  let setarray = [];
  for (var input of radio) {
    if (input.checked) {
      bread = input.value;
    }
  }
  
  for(var input of topping){
	  if(input.checked){
		  toparray.push(input.value);
	  }
  }
  for(var input of veget){
	  if(input.checked){
		  vegarray.push(input.value);
	  }
  }
  for(var input of sauce){
	  if(input.checked){
		  saucearray.push(input.value);
	  }
  }
  
  for(var input of set){
	  if(input.checked){
		  setarray.push(input.value);
	  }
  }

  $(".button").click(function() {
    $("#bread").text(bread);
    $("#topping").text(toparray);
    $('#veggie').text(vegarray);
    $('#sauce').text(saucearray);
    $('#set').text(setarray);
    $(".modal").dialog({
      autoOpen: true,
    });
  });
}

// 확인하면 주문 완료하기
function complete() {}

// 주문 완료하면 주문 내역에 기록하기
function writeRecord(bread, topping, veggie,sauce,set) {
  var order = `당신이 주문한 내역은 ${bread},${topping},${veggie},${sauce},${set} `;  
  $('.order').append(order);
}

function init() {
  const button = document.querySelector(".button");
  button.addEventListener("click", showDialog);
}

init();
