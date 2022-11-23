package bookOnCue.like;

public class LikeDto {
	private long no; // 데이터베이서 내 고유번호
	private String user;
	private String isbn;
	
	public LikeDto(long no, String user, String isbn) {
		super();
		this.no = no;
		this.user = user;
		this.isbn = isbn;
	}

	public LikeDto(String user,String isbn) {
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
