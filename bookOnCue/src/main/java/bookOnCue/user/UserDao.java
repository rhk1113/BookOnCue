package bookOnCue.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import bookOnCue.util.data.DBManager;


public class UserDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}

	private static UserDao instance = new UserDao();

	public static UserDao getinstance() {
		return instance;
	}

//	public int getLastNo()
//	CRUD
//	1.Create
//	public createUser(UserDto userDto)
//	2. Read
//	전부 가져오는거(관리자용)
//	user(세션 로그인 유지) 값 하나로 나머지 값 가져오기
//	3. update
//	말그대로 필요한 업그레이드
//	4.delete
//	필요한 지우기.

	public int getMaxId() {
		int id = 0;
		String sql = "select MAX(id) from user";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return id + 1;
	}

	public void createUser(UserDto userDto) {
		String sql = "INSERT INTO `user`(`id`,`user`,`password`,`name`,phone,`address`, nickname) VALUES(?, ?, ?, ?, ?, ?, ?)";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);

			this.pstmt.setLong(1, userDto.getId());
			this.pstmt.setString(2, userDto.getUser());
			this.pstmt.setString(3, userDto.getPassword());
			this.pstmt.setString(4, userDto.getName());
			this.pstmt.setString(5, userDto.getPhone());
			this.pstmt.setString(6, userDto.getAddress());
			this.pstmt.setString(7, userDto.getNickname());

			this.pstmt.execute();
			System.out.println("가입성공!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입실패!");
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<UserDto> readUserAll() {

		ArrayList<UserDto> list = new ArrayList<UserDto>();
		String sql = "select * From `user`";
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String user = rs.getString(2);
				String password = rs.getString(3);
				String name = rs.getString(4);
				String phone = rs.getString(5);
				String address = rs.getString(6);
				String nickname = rs.getString(7);
				Timestamp regdate = rs.getTimestamp(8);
				boolean manager = rs.getBoolean(9);

				list.add(new UserDto(id, user, password, name, phone, address, nickname, regdate, manager));
			}

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
		return list;
	}

	
	
	public UserDto readUserById(String userid) {

		UserDto userDto = null;
		String sql = "select * from `user` where `user`=?";
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, userid);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String password = rs.getString(3);
				String name = rs.getString(4);
				String phone = rs.getString(5);
				String address = rs.getString(6);
				String nickname = rs.getString(7);
				Timestamp regdate = rs.getTimestamp(8);
				boolean manager = rs.getBoolean(9);

				userDto = new UserDto(id, userid, password, name, phone, address, nickname, regdate, manager);
			}

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
		return userDto;
	}

	//모든 아이디를 불러오는 것.
	public ArrayList<String> getAllId() {

		ArrayList<String> list = new ArrayList<>();
		
		String sql = "select `user`from `user`";
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				String user = rs.getString(1);

				list.add(user);
			}

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
		return list;
	}
	
	public ArrayList<String> getAllNickName() {

		ArrayList<String> list = new ArrayList<>();
		
		String sql = "select nickname From `user`";
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();

			while (rs.next()) {
				String user = rs.getString(1);

				list.add(user);
			}

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
		return list;
	}
	
	
	
	
	
	public void UpdateUserById(UserDto userDto) {
		String user= userDto.getUser();
		String password = userDto.getPassword();
		String name = userDto.getName();
		String phone = userDto.getPhone();
		String address = userDto.getAddress();
		String nickname = userDto.getNickname();
		Timestamp regdate = userDto.getRegdate();
		boolean manager = userDto.isManager();

		String sql = "update user set password = ?, name = ?, phone= ?, address = ?, nickname = ?, regdate = ?, manager = ? where user = ?";
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, password);
			this.pstmt.setString(2, name);
			this.pstmt.setString(3, phone);
			this.pstmt.setString(4, address);
			this.pstmt.setString(5, nickname);
			this.pstmt.setTimestamp(6, regdate);
			this.pstmt.setBoolean(7, manager);
			this.pstmt.setString(8, user);

			this.pstmt.execute();
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
	
	public void deleteUser(String user) {
		String sql = "delete from `user` where `user` = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.execute();
			System.out.println("유저 삭제 완료!");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("유저 삭제 실패!");
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
