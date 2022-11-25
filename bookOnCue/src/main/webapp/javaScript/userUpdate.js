let expw = document.querySelector('#exPw');
let pw = document.querySelector("#pw");
let pw1 = document.querySelector("#pw1");
let pw2 = document.querySelector("#pw2");


function checkPass(){
	if(pw.value!==exPw.value){
	alert("올바른 비밀번호를 입력해주세요.");
	}else{
		if(pw1.value!==pw2.value){
			alert("변경할 비밀번호를 확인해주세요");
		}else{
			$(".editMe").submit();
			work();
			alert("수정완료!");
		}
	}

 };


function work() {
  const start = Date.now();
  for (let i = 0; i < 1000000000; i++) {}
  const end = Date.now();
  console.log(end - start + 'ms');
}


function commitChange(){
	let user = document.getElementById("curUser").value;
	let password = document.getElementById("pw").value;
	let changepw = document.getElementById("pw2").value;
	let name = document.getElementById("name").value;
	let nickname = document.getElementById("nickname").value;
	let address = document.getElementById("address").value;
	console.log(changepw);
	if(changepw!=""){
		password=changepw;
	}
	console.log(password);
	$.ajax({
		method :"POST",
		url:"/bookOnCue/UserUpdateAction",
		data:{
				user:user,
				pw:password,
				name:name,
				nickname:nickname,
				address :address
		}
	}).done(function(response){
			work();
			
	}).always(function (){
		console.log("여기까지 오냐")
		location.href="myPage"; 
	});
}
	
