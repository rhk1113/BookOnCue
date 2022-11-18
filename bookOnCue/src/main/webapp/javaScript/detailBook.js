//다른 함수에서도 변수를 사용할 예정이기 때문에 바깥에서 정의.
let url;
let thumbnail;
let title;
let contents;
let author;
let publisher;
let price;
let isbn;
let isbnshort;

//책 검색 페이지에서 (혹은 찜목록 페이지에서 isbn을 받고...)

// 생각해보니까 여기서 api로 정보를 끌어온다면 DB에 줄거리고 뭐고 다 안들어가도 되지 않나...?
// 글쓸때 필요한 책제목 이미지 작가 isbn 타이틀 아이디 추란사(최소한의 예의) 줄거리 넣을 필요 없을 것 같은데
// 줄거리 URL 뺄까...? 
let word = document.getElementById("getisbn").value;
getDetail(word);

function getDetail(word) {
    $(".container").empty(); // 결과비우기

console.log("word:",word);
    $.ajax({
        method: "GET",
        url: "http://dapi.kakao.com/v3/search/book",
        data: {query:word}
        ,
        headers : {
            Authorization : "KakaoAK 2b45b3e5239161ad1d52d1d7d07ca4fe"
        }
    }).done(function (response) {
        console.log("response : ", response);
        const list = response.documents;    //10개의 오브젝트
        list.forEach(e => {
            url =e.url;
            thumbnail = e.thumbnail;
            title = e.title;
            contents = e.contents;
            author = e.authors[0];
            publisher = e.publisher;
            price = e.price;
			isbn = e.isbn;
			
			const isbnarr = isbn.split(" ");
			isbnshort = isbnarr[1];
			console.log(isbnshort);
            $(`.container`).append(
                `
                    <div><a href='${url}'><img src = "${thumbnail}"></a></div>
                    <div>${title}</div>
                    <div>${contents}</div>
                    <div>${author}</div>
                    <div>${publisher}</div>
                    <div>${price}</div>
					<div>${isbn} ${isbnshort}</div>
                `
            );
        });
    });
}

function gotoWrite(){
	bookToDB();
	
	$(location).attr('href', `BoardWrite.jsp?isbn=${isbnshort}`);
}

let img;

function bookToDB(){
	$.ajax({
		url: "BookDetailPro.jsp",
		data:{
			title:title,
			author:author,
			isbn:isbnshort,
			img:thumbnail,
			price:price,
			url:url,
			publisher:publisher
		}
	}).done(function(response){
		
	})
}





