package bookOnCue.like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bookOnCue.util.data.DBManager;

public class LikeDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private LikeDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}

	public static LikeDao instance = new LikeDao();

	public static LikeDao getInstance() {
		return instance;
	}

	public long getMaxno() {
		long no = 0;
		String sql = "select Max(`no`) from `like`";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				no = rs.getLong(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return no + 1;
	}

	public void createLike(LikeDto likeDto) {
		String sql = "insert into `like` values(?,?,?)";
		Long no = getMaxno();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, no);
			this.pstmt.setString(2, likeDto.getUser());
			this.pstmt.setString(3, likeDto.getIsbn());
			this.pstmt.execute();
			System.out.println("좋아요 등록 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 등록 실패!");
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<LikeDto> readAllLikesByUser(String user) {
		ArrayList<LikeDto> list = new ArrayList<>();
		String sql = "Select * from `like` where user=? ";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, user);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				long no = rs.getLong(1);
				String isbn = rs.getString(3);
				list.add(new LikeDto(no, user, isbn));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	public ArrayList<LikeDto> readAllLikesByIsbn(String isbn) {
		ArrayList<LikeDto> list = new ArrayList<>();
		String sql = "Select * from `like` where `isbn`= ?";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, isbn);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				long no = rs.getLong(1);
				String user = rs.getString(2);
				list.add(new LikeDto(no, user, isbn));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public LikeDto getLikeByUserIsbn(LikeDto sampleDto) {
		LikeDto likeDto = null;
		String sql = "Select * from `like` where `user`=? and `isbn`= ?";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, sampleDto.getUser());
			this.pstmt.setString(2, sampleDto.getIsbn());
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				long no = rs.getLong(1);
				likeDto = new LikeDto(no, sampleDto.getUser(), sampleDto.getIsbn());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return likeDto;
	}

	public LikeDto getLikebyNo(long no) {
		LikeDto likeDto = null;
		String sql = "Select * from `like` where `no`=? ";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, no);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				String user = rs.getString(2);
				String isbn = rs.getString(3);
				likeDto = new LikeDto(no, user, isbn);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return likeDto;
	}

	public void deleteLike(long no) {
		String sql = "delete from `like` where `no` = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
