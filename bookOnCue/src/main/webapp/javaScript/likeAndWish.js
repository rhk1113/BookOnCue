user = document.getElementById("curUser").value;


console.log("받아온거:",isbn);
checkLike()
work();
getLikeLength()
work();
checkWish()

function work() {
  const start = Date.now();
  for (let i = 0; i < 1000000000; i++) {}
  const end = Date.now();
  console.log(end - start + 'ms');
}

function checkLike(){
	console.log("좋아요 체크한다");
	let isbnthis = document.getElementById("getisbn").value;
	$.ajax({
		method:"post",
		url:"/bookOnCue/CheckLikeAction",
		data:({
			user:user,
			likeisbn:isbnthis
		})
	}).done(function(response){
		console.log(response);
		console.log(typeof(response))
		if(response === null){
			$("#isLike").text("♡")
		}else{
			$("#isLike").text("♥")
		}
	})	
}

function toggleLike(){
	CDLike();
	work();
	checkLike();	
	work();
	getLikeLength()
}

function CDLike(){
	
	let isbnthis = document.getElementById("getisbn").value;
	$.ajax({
	method:"post",
	url:"/bookOnCue/LikeToggleAction",
	data:{
		user:user,
		likeisbn:isbnthis
	}
	}).done()
}

function getLikeLength(){
	let isbnthis = document.getElementById("getisbn").value;
	$.ajax({
	method:"post",
	url:"/bookOnCue/GetLikeSizeAction",
	data:{
		likeisbn:isbnthis
	}
	}).done(function(response){
		console.log(response);
		const list = response
		if (list.length > 0) {
			$("#like-count").text(list.length);
		}
	})
}

function CDWish(){
		let isbnthis = document.getElementById("getisbn").value;
	$.ajax({
	method:"post",
	url:"/bookOnCue/WishToggleAction",
	data:{
		user:user,
		likeisbn:isbnthis
	}
	}).done()
}
function checkWish(){
	console.log("찜 체크한다");
	let isbnthis = document.getElementById("getisbn").value;
	$.ajax({
		method:"post",
		url:"/bookOnCue/CheckWishAction",
		data:({
			user:user,
			likeisbn:isbnthis
		})
	}).done(function(response){
		console.log(response);
		console.log(typeof(response))
		if(response === null){
			$("#wantText").text("☆")
		}else{
			$("#wantText").text("★")
		}
	})	
}
