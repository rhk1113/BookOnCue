package bookOnCue.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bookOnCue.util.data.DBManager;


public class BookDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private BookDao() {
		this.conn=null;
		this.pstmt=null;
		this.rs=null;
	}
	
	private static BookDao instance = new BookDao();
	
	public static BookDao getInstance() {
		return instance;
	}

	public long getMaxId() {
		long id = 0;
		String sql = "select MAX(id) from book";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getInt(1);
			}
		}catch(Exception e) {
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
		return id+1;
	}
	//Create
	public void createBook(BookDto bookDto) {
		String sql = "INSERT INTO book values(?, ?, ?, ?, ?, ?, ?, ?)";
		long id = getMaxId();
		try {
			this.conn=DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setLong(1,id);
			this.pstmt.setString(2, bookDto.getTitle());
			this.pstmt.setString(3, bookDto.getAuthor());
			this.pstmt.setString(4,bookDto.getIsbn());
			this.pstmt.setString(5,bookDto.getImg());
			this.pstmt.setInt(6,bookDto.getPrice());
			this.pstmt.setString(7,bookDto.getUrl());
			this.pstmt.setString(8,bookDto.getPublisher());
			this.pstmt.execute();
			System.out.println("책 등록 성공!");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("책 등록 실패!");
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<BookDto> getBookAll(){
		ArrayList<BookDto> list = new ArrayList<>();
		String sql = "select * from `book`";
		try {
			this.conn=DBManager.getConnection();
			this.pstmt=conn.prepareStatement(sql);
			this.rs=pstmt.executeQuery();
			
			while(rs.next()) {
				long id = rs.getLong(1);
				String title = rs.getString(2);
				String author = rs.getString(3);
				String isbn = rs.getString(4);
				String img = rs.getString(5);
				int price = rs.getInt(6);
				String url = rs.getString(7);
				String publisher = rs.getString(8);
				
				list.add(new BookDto(id,title,author,isbn,img,price,url,publisher));
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
		return list;
	}
	
	public String getImgbyIsbn(String isbn){
		String img = null;
		String sql = "select img from `book` where isbn=?";
		try {
			this.conn=DBManager.getConnection();
			this.pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			this.rs=pstmt.executeQuery();
			
			if(rs.next()) {
				img = rs.getString(1);
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
		return img;
	}
	
	//Read ISBN으로 불러오기.
	public BookDto getBookByIsbn(String isbn) {
		BookDto bookDto = null;
		String sql = "select * from `book` where isbn = ?";
		
		try {
			conn=DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			long id = rs.getLong(1);
			String title = rs.getString(2);
			String author = rs.getString(3);
			String img = rs.getString(5);
			int price = rs.getInt(6);
			String url = rs.getString(7);
			String publisher = rs.getString(8);
			
			bookDto = new BookDto(id, title, author, isbn, img, price, url, publisher);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookDto;
	}
	
	
	
}
