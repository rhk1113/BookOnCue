package datas.board;

import java.sql.Timestamp;

public class BoardDto {
	private long no; //게시판 내 고유번호
	private int division;//1.일반 커뮤니티 글 2. 책 서평글 3.일반 공지사항 4. 강조 공지사항 5. 일반 이벤트 6 서평 이벤트
	private String title;
	private String text;
	private String user;
	private String isbn;
	private Timestamp regdate;
	private Timestamp moddate;
	private Timestamp strdate; //이벤트 항목 선택시 
	private Timestamp enddate; //이벤트 항목 선택시
	
	public BoardDto(long no, int division, String title, String text, String user, String isbn, Timestamp regdate,
			Timestamp moddate, Timestamp strdate, Timestamp enddate) {
		super();
		this.no = no;
		this.division = division;
		this.title = title;
		this.text = text;
		this.user = user;
		this.isbn = isbn;
		this.regdate = regdate;
		this.moddate = moddate;
		this.strdate = strdate;
		this.enddate = enddate;
	}

	public long getNo() {
		return no;
	}

//	public void setNo(int no) {
//		this.no = no;
//	}

	public int getDivision() {
		return division;
	}

//	public void setDivision(int division) {
//		this.division = division;
//	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUser() {
		return user;
	}

//	public void setUser(String user) {
//		this.user = user;
//	}

	public String getIsbn() {
		return isbn;
	}

//	public void setIsbn(String isbn) {
//		this.isbn = isbn;
//	}

	public Timestamp getRegdate() {
		return regdate;
	}

//	public void setRegdate(Timestamp regdate) {
//		this.regdate = regdate;
//	}

	public Timestamp getModdate() {
		return moddate;
	}

	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}

	public Timestamp getStrdate() {
		return strdate;
	}

	public void setStrdate(Timestamp strdate) {
		this.strdate = strdate;
	}

	public Timestamp getEnddate() {
		return enddate;
	}

	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}
	
	
}
