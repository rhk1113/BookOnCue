const container = document.querySelector(".container");




let page = 1;
let is_End = false;
let word = "오늘의 책"
$(".back_button").hide();

getData();
function getData() {
    $(".container").empty(); // 결과비우기
word = document.getElementById("searchbar").value;

console.log(word);
    $.ajax({
        method: "GET",
        url: "http://dapi.kakao.com/v3/search/book",
        data: {query:word,
				page:page,
				size:12}
        ,
        headers : {
            Authorization : "KakaoAK 2b45b3e5239161ad1d52d1d7d07ca4fe"
        }
    }).done(function (response) {
        console.log("response : ", response);
        const list = response.documents;    //10개의 오브젝트
        list.forEach(e => {
            const url =e.url;
            const thumbnail = e.thumbnail;
            const title = e.title;
            const contents = e.contents;
            const author = e.authors[0];
            const publisher = e.publisher;
            const price = e.price;
			const isbn = e.isbn;
			
			const isbnarr = isbn.split(" ");
			const isbnshort = isbnarr[1];
			console.log(isbnshort);
            $(`.container`).append(
                `<ul class="contained">
                    <li><a href='detailBooks?query=${isbnshort}'><img src = "${thumbnail}"></a></li>
                    <li>${title}</li>
                    <li>저자:		${author}</li>
                    <li>출판사:	${publisher}</li>
                </ul>`
            );

        });
        is_End = response.meta.is_end;
        if (is_End === true) {
            $('.next_button').hide();

        }else{
	            $('.next_button').show();
}
        if (page === 1) {
            $('.next_button').show();
            $('.back_button').hide();
        }

    });
}



function getDataBack() {
    if (page > 1) {
        page--;
        getData();
    }

}

function getDataNext() {

    if (is_End === false) {
        page++;
        getData();
        $('.back_button').show();
    }
}