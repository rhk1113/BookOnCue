let divC = 1;
let Cpage =0;
let lastCpage=0;
let flag = false;
getPost(divC);

function divC1(){
	Cpage=0;
		flag=false;
divC=1;
getPost(divC);	
}
function divC2(){
	Cpage=0;
		flag=false;
	divC=2;
getPost(divC);	
}
function divC3(){
	Cpage=0;
		flag=false;
	divC=3;
getPost(divC);	
}
function divC4(){
	Cpage=0;
		flag=false;
	divC=4;
getPost(divC);	
}


function getPost(divC){

	flag=false;
	let min=0;
	let max=7;
	if(divC===1){
		min=0;
		max=7;		
	}else if(divC===2){
		min=2;
		max=8;
	}else if (divC===3){
		min=0;
		max=2;
	}else if (divC===4){
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
		lastCpage= Math.floor(list.length / 10);
		
			
		if(list.length/10>lastCpage){
			lastCpage++;
		}
		console.log(lastCpage);
		let j = Cpage*10;
		let posts = 0;
		for(let i = 0+Cpage*10 ; ; i++){
			if(i==list.length){
				flag=true;
				break;
			}
			const no = list[i].no;
			const title = list[i].title;
			const user= list[i].user;
			const divC=parseInt(list[i].division);
			if(min<divC&&max>divC){				
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

        if(Cpage!==0){
            $('.back').show();
        }
		console.log(flag);
		
		if(Cpage !== lastCpage-1){
			
            $('.next').show();
        }

		if(flag){
			$('.next').hide();
		}
	});
}

function CpageUp(){
    if(Cpage!==lastCpage-1){

        Cpage++;
		getPost(divC)
        $('.back_button').show();
    }
}

function CpageDown(){
    if(Cpage > 0){
        Cpage--;
		getPost(divC)
    }
}
