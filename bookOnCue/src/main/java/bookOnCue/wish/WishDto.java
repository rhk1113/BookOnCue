package bookOnCue.wish;

public class WishDto {
	private long no; // 데이터베이서 내 고유번호
	private String user;
	private String isbn;
	
	public WishDto(long no, String isbn, String user) {
		super();
		this.no = no;
		this.isbn = isbn;
		this.user = user;
	}

	public WishDto(String user, String isbn) {
		super();
		this.user = user;
		this.isbn = isbn;
	}

	public long getNo() {
		return no;
	}

//	public void setNo(int no) {
//		this.no = no;
//	}

	public String getIsbn() {
		return isbn;
	}

//	public void setIsbn(String isbn) {
//		this.isbn = isbn;
//	}

	public String getUser() {
		return user;
	}

//	public void setUser(String user) {
//		this.user = user;
//	}

	
}
