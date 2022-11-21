let div = 1;
let page =0;
let lastPage=0;
getPost(div);

function div1(){
div=1;
getPost(div);	
}
function div2(){
	div=2;
getPost(div);	
}
function div3(){
	div=3;
getPost(div);	
}
function div4(){
	div=4;
getPost(div);	
}

function getPost(div){
	let min=0;
	let max=7;
	if(div===1){
		min=0;
		max=7;		
	}else if(div===2){
		min=2;
		max=5;
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
		for(let i = 0+page*10 ; i<10+page*10 ; i++){
			if(i==list.length){
				break;
			}
			const no = list[i].no;
			const title = list[i].title;
			const user= list[i].user;
			const div=parseInt(list[i].division);
			if(min<div&&max>div){				
			$(".posts").append(
				`<tr class = "reviewContent">
					<td>${i+1}</td>
					<td><a href="boardView.jsp?no=${no}">${title}</a></td>
					<td>${user}</td>
				</tr>`
			)			
			}else{
				i--;
			}
		}
		$('.back').hide();
        $('.next').hide();

        if(page!==0){
            $('.back').show();
        }
		if(page !== lastPage-1){
            $('.next').show();
        }
	});
}

function pageUp(){
    if(page!==lastPage-1){
        page++;
		getreview();
        $('.back_button').show();
    }
}

function pageDown(){
    if(page > 0){
        page--;
        getreview();
    }
}
