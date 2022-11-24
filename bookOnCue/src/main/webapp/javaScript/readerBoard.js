let user = document.getElementById("curUser").value;
let page =0;
let lastPage=0;

function getImg(isbn){
	let arr;
$.ajax({
		method:"POST",
		url:"/bookOnCue/GetImgByIsbnAction",
		async: false,
		data:{
			isbn:isbn
		}		
}).done(function (response){
arr= response
return arr
})
return arr
}

function work() {
  const start = Date.now();
  for (let i = 0; i < 1000000000; i++) {}
  const end = Date.now();
  console.log(end - start + 'ms');
}

function getPost(){
	$(".posts").empty();
	$.ajax({
		method:"POST",
		url:"/bookOnCue/GetUserPostAction",
		data:{
			user:user
		}
		}).done(function(response){
		const list = response;
		console.log("list:",list);
		lastPage= Math.floor(list.length / 10);
		
			
		if(list.length/10>lastPage){
			lastPage++;
		}
		console.log(lastPage);
		let j = page*10;
		let posts = 0;
		for(let i = 0+page*10 ; ; i++){
			if(i==list.length){
				flag=true;
				break;
			}
			const no = list[i].no;
			const title = list[i].title;
			const text= list[i].text;
			const div=parseInt(list[i].division);
			const isbn = list[i].isbn;
			const img = getImg(isbn);
			
			if(div===2){
				work();
			$(".written").append(
				`<ul class = "post${no}">
					<li><a href="boardView.jsp?no=${no}"><img src=${img}/></li>
					<li><a href="boardView.jsp?no=${no}">${title}</a></li>
					<li><button onclick="location.href='detailBooks.jsp?isbn=${isbn}'">책 보러가기</button></li>
				</ul>`
			)
			j++;
			posts++;
			if (posts===10){
				break;
			}			
			}else{
			}
		}
		$('.back').hide();
        $('.next').hide();

        if(page!==0){
            $('.back').show();
        }
		console.log(flag);
		
		if(page !== lastPage-1){
			
            $('.next').show();
        }

		if(flag){
			$('.next').hide();
		}
	});
}