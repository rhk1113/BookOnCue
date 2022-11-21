package bookOnCue.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;


import bookOnCue.util.data.DBManager;

public class CommentDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private CommentDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static CommentDao instance = new CommentDao();
	
	public static CommentDao getInstance() {
		return instance;
	}
	
	public long getMaxNo() {
		long no = 0;
		String sql = "select Max(`no`) from comment";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				no = rs.getLong(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return no+1;
	}
		
		
	
	
	
	public void createComment(CommentDto commentDto){
		String sql = "insert into comment (`no`, `user`, `post`, `text`)values(?,?,?,?)";
		long no = getMaxNo();
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.setString(2, commentDto.getId());
			pstmt.setLong(3, commentDto.getPost());
			pstmt.setString(4, commentDto.getText());
			pstmt.execute();
			System.out.println("댓글 등록 성공!");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패!");
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public ArrayList<CommentDto> readAllCommentByPost(long post){
		String sql = "select * from comment where `post`=?";
		ArrayList<CommentDto> list = new ArrayList<>();		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, post);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				long no = rs.getLong(1);
				String id = rs.getString(2);
				String text = rs.getString(4);
				Timestamp regdate = rs.getTimestamp(5);
				Timestamp moddate = rs.getTimestamp(6);
			list.add(new CommentDto(no, id, post, text, regdate, moddate));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	return list;
	}
	
	public CommentDto readOneCommentByNo(long no){
		String sql = "select * from comment where `no`=?";
		CommentDto dto = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(2);
				long post = rs.getLong(3);
				String text = rs.getString(4);
				Timestamp regdate = rs.getTimestamp(5);
				Timestamp moddate = rs.getTimestamp(6);
			dto= new CommentDto(no, id, post, text, regdate, moddate);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	return dto;
	}
	
	
	
	
	
}
