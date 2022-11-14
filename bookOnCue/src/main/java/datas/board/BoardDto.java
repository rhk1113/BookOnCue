package datas.board;

import java.sql.Timestamp;

public class BoardDto {
	private long no; //�Խ��� �� ������ȣ
	private int division;//1.�Ϲ� Ŀ�´�Ƽ �� 2. å ����� 3.�Ϲ� �������� 4. ���� �������� 5. �Ϲ� �̺�Ʈ 6 ���� �̺�Ʈ
	private String title;
	private String text;
	private String user;
	private String isbn;
	private Timestamp regdate;
	private Timestamp moddate;
	private Timestamp strdate; //�̺�Ʈ �׸� ���ý� 
	private Timestamp enddate; //�̺�Ʈ �׸� ���ý�
	
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
