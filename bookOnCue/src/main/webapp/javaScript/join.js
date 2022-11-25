let pw1 = document.querySelector('#userPW');
let pw2 = document.querySelector('#pwCheck');
let sub = document.querySelector('#loginSubmit');
let login = document.querySelector('#loginForm');
let userbox=document.querySelector("#userID");
let flag = false;
function checkid(){
let signUser = document.getElementById("userID").value;
	if(signUser==""){
		alert("아이디를 입력해주세요.")
	}else{
		console.log(signUser)
	$.ajax({
		method:"POST",
		url:"/bookOnCue/IdCheckAction",
		data:{
			user:signUser
		}
	}).done(function(response){
		if(response=="false"){
	        alert('이미 존재하는 아이디입니다.')
			userbox.value="";
			userbox.focus();
		}else{
	        alert('사용 가능한 아이디입니다.')	
			flag=true;		
		}
	})
}
}


sub.addEventListener('click', ()=>{
	if(!flag){
		alert('아이디 중복확인을 해주세요.')
	}
	
    if(pw1.value==pw2.value){
        login.submit();
    }else{
        alert('패스워드가 일치하지 않습니다 ')
        pw1.value = '';
        pw2.value = '';
        pw1.focus();
    }
});

