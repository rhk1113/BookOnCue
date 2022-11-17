package datas.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import datas.util.data.DBManager;

public class BoardDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private BoardDao(){
		this.conn=null;
		this.pstmt=null;
		this.rs=null;
	}
	
	public static BoardDao instance = new BoardDao();
	
	public BoardDao getInstance() {
		return instance;
	}
	public long getMaxNo() {
		long no = 0;
		String sql = "select Max(no) from board";
		
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
	
	
	
	//Create
	public void createBoard(BoardDto boardDto) {
		String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		long no = getMaxNo();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, no);
			this.pstmt.setInt(2, boardDto.getDivision());
			this.pstmt.setString(3,boardDto.getTitle());
			this.pstmt.setString(4,boardDto.getText());
			this.pstmt.setString(5,boardDto.getUser());
			this.pstmt.setString(6,boardDto.getIsbn());
			this.pstmt.setTimestamp(7, boardDto.getRegdate());
			this.pstmt.setTimestamp(8, boardDto.getModdate());
			this.pstmt.setTimestamp(9, boardDto.getStrdate());
			this.pstmt.setTimestamp(10, boardDto.getEnddate());
			System.out.println("작성글 등록 성공!");
			this.pstmt.execute();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("작성글 등록 실패!");
		}finally {
			try {
				this.conn.close();
				this.pstmt.close();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
//	private long no; //게시판 내 고유번호
//	private int division;//1.일반 커뮤니티 글 2. 책 서평글 3.일반 공지사항 4. 강조 공지사항 5. 일반 이벤트 6 서평 이벤트
//	private String title;
//	private String text;
//	private String user;
//	private String isbn;
//	private Timestamp regdate;
//	private Timestamp moddate;
//	private Timestamp strdate; //이벤트 항목 선택시 
//	private Timestamp enddate; //이벤트 항목 선택시
	public ArrayList<BoardDto> readBoardAllByDiv(int division) {
		String sql = "select * from board where division = ? order by `no` desc";
		ArrayList<BoardDto> list = new ArrayList<>();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setInt(1, division);
			this.rs = pstmt.executeQuery();
			
			while(rs.next()) {
				long no = rs.getLong(1);
				String title = rs.getString(3);
				String text = rs.getString(4);
				String user = rs.getString(5);
				String isbn = rs.getString(6);
				Timestamp regdate =rs.getTimestamp(7);
				Timestamp moddate =rs.getTimestamp(8);
				Timestamp strdate=rs.getTimestamp(9);
				Timestamp enddate=rs.getTimestamp(10);
				
				BoardDto dto = new BoardDto(no, division, title, text, user, isbn, regdate, moddate, strdate, enddate);
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	//게시글 하나
	public BoardDto readBoardByNo(long no) {
		String sql = "select * from board where no = ?";
		BoardDto boardDto = null;
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, no);
			this.rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int division = rs.getInt(2);
				String title = rs.getString(3);
				String text = rs.getString(4);
				String user = rs.getString(5);
				String isbn = rs.getString(6);
				Timestamp regdate =rs.getTimestamp(7);
				Timestamp moddate =rs.getTimestamp(8);
				Timestamp strdate=rs.getTimestamp(9);
				Timestamp enddate=rs.getTimestamp(10);
				
				boardDto = new BoardDto(no, division, title, text, user, isbn, regdate, moddate, strdate, enddate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return boardDto;
	}
	
}
