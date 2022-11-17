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
        data: {query:word}
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
                `<tr>
                    <td><a href='detailBooks.jsp?isbn=${isbnshort}'><img src = "${thumbnail}"></a></td>
                    <td>${title}</td>
                    <td>${contents}</td>
                    <td>${author}</td>
                    <td>${publisher}</td>
                    <td>${price}</td>
					<td>${isbnshort}</td>
                </tr>`
            );


        });
        is_End = response.meta.is_end;
        if (is_End === true) {
            $('.next_button').hide();

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