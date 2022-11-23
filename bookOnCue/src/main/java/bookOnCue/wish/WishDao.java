package bookOnCue.wish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bookOnCue.util.data.DBManager;

public class WishDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private WishDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}

	public static WishDao instance = new WishDao();

	public static WishDao getInstance() {
		return instance;
	}

	public long getMaxno() {
		long no = 0;
		String sql = "select Max(`no`) from wish";

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

	public void createWish(WishDto wishDto) {
		String sql = "insert into `wish` values(?,?,?)";
		Long no = getMaxno();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, no);
			this.pstmt.setString(2, wishDto.getUser());
			this.pstmt.setString(3, wishDto.getIsbn());
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

	public ArrayList<WishDto> readAllWishByUser(String user) {
		ArrayList<WishDto> list = new ArrayList<>();
		String sql = "Select * from `wish` where user=? ";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, user);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				long no = rs.getLong(1);
				String isbn = rs.getString(3);
				list.add(new WishDto(no, user, isbn));
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

	public ArrayList<WishDto> readAllWishByIsbn(String isbn) {
		ArrayList<WishDto> list = new ArrayList<>();
		String sql = "Select * from `wish` where isbn=? ";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, isbn);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				long no = rs.getLong(1);
				String user = rs.getString(2);
				list.add(new WishDto(no, user, isbn));
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

	public WishDto getWishByUserIsbn(String user, String isbn) {
		WishDto wishDto = null;
		String sql = "Select * from `wish` where user=?, isbn=? ";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, user);
			this.pstmt.setString(2, isbn);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				long no = rs.getLong(1);
				wishDto = new WishDto(no, user, isbn);
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
		return wishDto;
	}

	public WishDto getWishbyNo(long no) {
		WishDto wishDto = null;
		String sql = "Select * from `wish` where no=? ";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, no);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				String user = rs.getString(2);
				String isbn = rs.getString(3);
				wishDto = new WishDto(no, user, isbn);
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
		return wishDto;
	}

	public void deleteWish(long no) {
		String sql = "delete from `wish` where `no` = ?";
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