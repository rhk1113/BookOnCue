let postNo = document.getElementById("postNo").value;
let curUser = document.getElementById("curUser").value;
let isManager = document.getElementById("isManager").value;
let page = 0;
let lastpage=0;
let text = document.getElementById("commentBox").value;

function commentUp(){
text = document.getElementById("commentBox").value;
console.log(text);
	$.ajax({
		method:"POST",
		url: "boardViewPro.jsp",
		data:{
			post:postNo,
			id:curUser,
			text:text
		}
	}).done(function(response){
		getComments();
	})
}

getComments();
function getComments(){
	$(".comments").empty();
	$.ajax({
		method:"POST",
		url: "/bookOnCue/CommentOnPostAction",
		data:{
			no:postNo
		}
	}).done(function(response){
		const list =response;
		console.log("list:",list);
		lastPage= Math.floor(list.length / 5);
		if(list.length/5>lastPage){
			lastPage++;
		}
		console.log(lastPage);
		for(let i = 0+page*5 ; i<5+page*5 ; i++){
			if(i==list.length){
				break;
			}
			const text = list[i].text;
			const user= list[i].id;
			const regdate = list[i].regdate;
			const moddate = list[i].moddate;
			const no = list[i].no;
			$(".comments").append(
				`<div class = "commentContent" id = "commentContent${no}">
				<input type="hidden" id = "no${no}" value="${no}">
					<span>${i+1}</span>
					<span class = "coWriter">${user}</span>
					<span>${text}</span>
					<span>${regdate}</span>
					<span>${moddate}</span>
					<button class="modify_co" id = "modify_co${user}">수정하기</button>
					<button class="delete_co" id = "delete_co${user}">삭제하기</button>
				</div>`
			)			
			$(`#delete_co${user}`).hide();
			$(`#modify_co${user}`).hide();
			if(user === curUser){
				$(`#delete_co${curUser}`).show();
				$(`#modify_co${curUser}`).show();
			}
			
		}
			if(isManager==="true"){
				
				$(`.delete_co`).show();
				$(`.modify_co`).show();
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
getComments();
        $('.back_button').show();
    }
}

function pageDown(){
    if(page > 0){
        page--;
        getComments();
    }
}