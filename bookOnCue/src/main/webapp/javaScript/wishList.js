let page =0;
let lastPage=0;
getPost();



function getBook(isbn){
	let arr;
$.ajax({
		method:"POST",
		url:"/bookOnCue/GetBookByIsbnAction",
		async: false,
		data:{
			isbn:isbn
		}		
}).done(function (response){
console.log(response);
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
let user = document.getElementById("curUser").value;
	$(".posts").empty();
	$.ajax({
		method:"POST",
		url:"/bookOnCue/GetWishByUserAction",
		data:{
			user:user
		}
		}).done(function(response){
		const list = response;
		lastPage= Math.floor(list.length / 10);
		
		if(list.length/10>lastPage){
			lastPage++;
		}
		console.log(lastPage);
		let j = page*12;
		let posts = 0;
		for(let i = 0+page*12 ; ; i++){
			if(i==list.length){
				flag=true;
				break;
			}
			const no = list[i].no;
			const user = list[i].isbn;
			const isbn= list[i].user
			const book = getBook(isbn);
			console.log("isbn:",isbn);
			console.log("book:",book);
			const img = book.img;
			const title = book.title;
			work();
			$(".lists").append(
				`<ul class = "post${no}">
					<li><a href="detailBooks?isbn=${isbn}"><img src=${img}/></li>
					<li><a href="'detailBooks?isbn=${isbn}">${title}</a></li>
					<li><button onclick="location.href='detailBooks?isbn=${isbn}'">책 보러가기</button></li>
				</ul>`
			)
			j++;
			posts++;
			if (posts===10){
				break;
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