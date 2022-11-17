//필요한 함수 목록
//1. admin일 경우 특정 섹션 보이게 하기
//2. BookReaview 일 경우  책 세션 보이게 하기(컨테이너에 추가)
//3. 글 쓴 정보 저장하게 만들기.

//1. admin일 경우 특정 섹션 보이게 하기

let division=1;
let admin = document.getElementById("admin").value;
console.log(admin);
//이벤트 날짜 자구 떠있네 ㅠ 숨겨
eventDateOff();
if(admin==="true"){
	console.log("관리자확인!");
	showAdmin();
}else if(admin==="false"){
	console.log("관리자아님!");
}


let getisbn = document.getElementById("getisbn").value;
let isisbn = document.getElementById("isisbn").value;
if(isisbn==="true"){
	console.log("책들어왔네!");
	bookWrite();
	$(`.bookcheck`).show();
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
		console.log(division);
	}else if(num=="2"){
		$("input:checkbox[id='bookcheck']").prop("checked", true);
				$(`.container`).show();
		eventDateOff();
		division=2;
		console.log(division);
	}else if (num=="3"){
		$("input:checkbox[id='bookcheck']").prop("checked", false);
				$(`.container`).hide();
		eventDateOff();
		division=3;
		console.log(division);
	}else if(num=="4"){
				$("input:checkbox[id='bookcheck']").prop("checked", false);
						$(`.container`).hide();
		eventDateOn();
		division=4;
		console.log(division);
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



function eventbook(event) {
	if (event.target.checked) {
		$(`.container`).show();
		if (division >= 3) {
			division += 2;
			console.log(division);
		}
	} else {
		$(`.container`).hide();
		if (division >= 5) {
			division -= 2;
			console.log(division);
		}
	}
}

var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dateString = year + '-' + month  + '-' + day;

console.log(dateString);


//	private long no; //게시판 내 고유번호
//	private int division;//1.일반 커뮤니티 글 2. 책 서평글 3.일반 공지사항 4. 기간 공지사항 5. 일반 책 이벤트 6 기간 책 이벤트
//	private String title;
//	private String text;
//	private String user;
//	private String isbn;
//	private Timestamp regdate;
//	private Timestamp moddate;
//	private Timestamp strdate; //이벤트 항목 선택시 
//	private Timestamp enddate; //이벤트 항목 선택시
function boardWriting(){
	$.ajax({
		url:"bookWritePro.jsp",
		data:{
			division:division,
			title:title,
			text:text,
	//		user:id,
			isbn:getisbn,
			regdate:dateString,
	//		moddate:moddate,
	//		strdate:strdate,
	//		enddate:enddate
			
		}
	})
}
