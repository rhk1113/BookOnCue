let div = 1;
let page =0;
let lastPage=0;
let flag = false;
getPost(div);

function div1(){
	page=0;
		flag=false;
div=1;
getPost(div);	
}
function div2(){
	page=0;
		flag=false;
	div=2;
getPost(div);	
}
function div3(){
	page=0;
		flag=false;
	div=3;
getPost(div);	
}
function div4(){
	page=0;
		flag=false;
	div=4;
getPost(div);	
}


function getPost(div){

	flag=false;
	let min=0;
	let max=7;
	if(div===1){
		min=0;
		max=7;		
	}else if(div===2){
		min=2;
		max=8;
	}else if (div===3){
		min=0;
		max=2;
	}else if (div===4){
		min=1;
		max=3;
	}
	$(".posts").empty();
	$.ajax({
		method:"POST",
		url:"/bookOnCue/BoardListAction"
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
			const user= list[i].user;
			const div=parseInt(list[i].division);
			if(min<div&&max>div){				
			$(".posts").append(
				`<tr class = "reviewContent">
					<td>${j+1}</td>
					<td><a href="boardView?no=${no}">${title}</a></td>
					<td>${user}</td>
				</tr>`
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

function pageUp(){
    if(page!==lastPage-1){

        page++;
		getPost(div)
        $('.back_button').show();
    }
}

function pageDown(){
    if(page > 0){
        page--;
		getPost(div)
    }
}
