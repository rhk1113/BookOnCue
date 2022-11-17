package datas.book;

public class BookDto {
	private long id;
	private String title;
	private String author;
	private String isbn;
	private String img;
	private int price;
	private String url;
	private String publisher;

	
	public BookDto(long id, String title, String author, String isbn, String img, int price, String url, String publisher) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.isbn = isbn;
		this.img = img;
		this.price = price;
		this.url = url;
		this.publisher = publisher;
	}

	public long getId() {
		return id;
	}

//	public void setId(int id) {
//		this.id = id;
//	}

	public String getTitle() {
		return title;
	}

//	public void setTitle(String title) {
//		this.title = title;
//	}

	public String getAuthor() {
		return author;
	}

//	public void setAuthor(String author) {
//		this.author = author;
//	}

	public String getIsbn() {
		return isbn;
	}

//	public void setIsbn(String isbn) {
//		this.isbn = isbn;
//	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPublisher() {
		return publisher;
	}


//	public void setPublisher(String publisher) {
//		this.publisher = publisher;
//	}          <<ISBN에는 출판사 코드도 포함되어있기 때문에 출판사 세팅이 불가능하다.
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
