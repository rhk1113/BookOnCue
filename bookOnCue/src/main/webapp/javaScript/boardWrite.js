//필요한 함수 목록
//1. admin일 경우 특정 섹션 보이게 하기
//2. BookReaview 일 경우  책 세션 보이게 하기(컨테이너에 추가)
//3. 글 쓴 정보 저장하게 만들기.

//1. admin일 경우 특정 섹션 보이게 하기

let division=1;
let admin = document.getElementById("admin").value;
let id = document.getElementById("user").value;
console.log(admin);
//이벤트 날짜 자구 떠있네 ㅠ 숨겨
eventDateOff();
if(admin==="true"){
	console.log("관리자확인!");
	showAdmin();
}else if(admin==="false"){
	console.log("관리자아님!");
}


//기본값 설정
document.getElementById('division').value=getdiv();

let getisbn = document.getElementById("getisbn").value;
let isisbn = document.getElementById("isisbn").value;

// 책인지 여부 체크
if(isisbn==="true"){
	console.log("책들어왔네!");
	bookWrite();
	$(`.bookcheck`).show();
	$(".selectbox option:eq(1)").prop("selected", true);
	document.getElementById('division').value="2";
	document.getElementById('isbook').value = "true";
}else if(isisbn==="false"){
		console.log("책이없어!");
	$(`.bookcheck`).hide();
}
console.log("isisbn: ",isisbn);
console.log("getisbn: ",getisbn);
function selected(num){
	if(num==="1"){
		eventDateOff();
		division=1;
		document.getElementById('division').value = getdiv();
		console.log(division,document.getElementById('division').value);
	}else if(num=="2"){
		if(isisbn==="true"){
		$("input:checkbox[id='bookcheck']").prop("checked", true);
				document.getElementById('isbook').value = "true";
				$(`.container`).show();
		eventDateOff();
		division=2;
		document.getElementById('division').value = getdiv();
		console.log(division,document.getElementById('division').value);
		}else if(admin==="false"){
			 if(confirm('책 평론을 쓰기 위해 책을 찾으러 갈까요?')) {
          $(location).attr('href', 'searchBook.jsp?query=오늘의 책');
      } else {
		$(".selectbox option:eq(0)").prop("selected", true);
	document.getElementById('division').value="1";
	document.getElementById('isbook').value = "false";
      }
		}
	}else if (num=="3"){
		$("input:checkbox[id='bookcheck']").prop("checked", false);
				$(`.container`).hide();
		eventDateOff();
		division=3;
		document.getElementById('division').value = getdiv();
		console.log(division,document.getElementById('division').value);
	}else if(num=="4"){
				$("input:checkbox[id='bookcheck']").prop("checked", false);
						$(`.container`).hide();
		eventDateOn();
		division=4;
		document.getElementById('division').value = getdiv();
		console.log(division,document.getElementById('division').value);
	}
}

function showAdmin(){
	$(`.selectbox`).append(
		`
		<OPTION disabled>==============</option>
		<OPTION VALUE=3>공지사항</OPTION>
		<OPTION VALUE=4>기간제 이벤트</OPTION>
		`
	)
	
}

function eventDateOn(){
		$(`.eventdate`).show();
}
function eventDateOff(){
		$(`.eventdate`).hide();
	}


function bookWrite(){ // isbn이 있을 때 처음 추가되는 형식으로하자.
	$(`.bookcheck`).append(
		`
		책 넣기 <input type ="checkbox" id ="bookcheck" onclick="eventbook(event)" checked>
		`
	)
}

function getdiv(){
	return division;
}


function eventbook(event) {
	if (event.target.checked) {
		$(`.container`).show();
		document.getElementById('isbook').value = "true";
		console.log(division,document.getElementById('division').value,document.getElementById('isbook').value)
		if (division >= 3) {
			division += 2;
			console.log(division);
			let title = document.getElementById("postTitle").value;
			let text = document.getElementById("postText").value;
			document.getElementById('division').value = getdiv();
			console.log(division,document.getElementById('division').value,document.getElementById('isbook').value)
		}
	} else {
		$(`.container`).hide();
		document.getElementById('isbook').value = "false";
		console.log(division,document.getElementById('division').value,document.getElementById('isbook').value)
		if (division >= 5) {
			division -= 2;
			document.getElementById('division').value = getdiv();
			console.log(division,document.getElementById('division').value,document.getElementById('isbook').value);
		}
	}
}

var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dateString = year + '-' + month  + '-' + day;

console.log(dateString);




