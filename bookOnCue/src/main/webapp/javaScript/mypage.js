user = document.getElementById("curUser").value;
let mpage =0;
let lastmpage=0;

function getPost(div){

	flag=false;
	let min=0;
	let max=7;
	
	if (div===1){
		min=1;
		max=3;
	}
	if (div===2){
		min=0;
		max=7;
	}
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
		lastmpage= Math.floor(list.length / 10);
		
			
		if(list.length/10>lastmpage){
			lastmpage++;
		}
		console.log(lastmpage);
		let j = mpage*10;
		let posts = 0;
		for(let i = 0+mpage*10 ; ; i++){
			if(i==list.length){
				flag=true;
				break;
			}
			const no = list[i].no;
			const title = list[i].title;
			const text= list[i].text;
			const div=parseInt(list[i].division);
			if(min<div&&max>div){				
			$(".written").append(
				`<tr class = "post${no}">
					<td>${j+1}</td>
					<td><a href="boardView.jsp?no=${no}">${title}</a></td>
					<td>${text}</td>
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

        if(mpage!==0){
            $('.back').show();
        }
		console.log(flag);
		
		if(mpage !== lastmpage-1){
			
            $('.next').show();
        }

		if(flag){
			$('.next').hide();
		}
	});
}