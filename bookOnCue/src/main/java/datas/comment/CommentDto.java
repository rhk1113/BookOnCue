package datas.comment;

import java.sql.Timestamp;

public class CommentDto {
	private long no;
	private String id;
	private long post; // ¿øº» ±Û
	private String text;
	private Timestamp regdate;
	private Timestamp moddate;
	public CommentDto(long no, String id, long post, String text, Timestamp regdate, Timestamp moddate) {
		super();
		this.no = no;
		this.id = id;
		this.post = post;
		this.text = text;
		this.regdate = regdate;
		this.moddate = moddate;
	}
	public long getNo() {
		return no;
	}
//	public void setNo(long no) {
//		this.no = no;
//	}
	public String getId() {
		return id;
	}
//	public void setId(String id) {
//		this.id = id;
//	}
	public long getPost() {
		return post;
	}
//	public void setPost(long post) {
//		this.post = post;
//	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
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
	
	
}
