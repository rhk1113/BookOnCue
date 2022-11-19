package bookOnCue.user;

import java.sql.Timestamp;

public class UserDto {
	private long id; // 자동 생성되는 일련번호
	private String user; // userid 
	private String password; 
	private String name;
	private String phone;
	private String address;
	private String nickname;
	private Timestamp regdate;
	private boolean manager;
	
	public UserDto(int id, String user, String password, String name, String phone, String address, String nickname) {
		super();
		this.id = id;
		this.user = user;
		this.password = password;
		this.name = name;
		this.phone = phone;		
		this.address=address;
		this.nickname = nickname;
	}
	
	public UserDto(int id, String user, String password, String name, String phone, String address, String nickname,
			Timestamp regdate, boolean manager) {
		super();
		this.id = id;
		this.user = user;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.address=address;
		this.phone = phone;
		this.regdate = regdate;
		this.manager = manager;
		
	}

	public long getId() {
		return id;
	}

//	public void setId(int id) {
//		this.id = id;
//	}

	public String getUser() {
		return user;
	}

//	public void setUser(String user) {
//		this.user = user;
//	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

//	public void setRegdate(Timestamp regdate) {
//		this.regdate = regdate;
//	}

	public boolean isManager() {
		return manager;
	}

	public void setManager(boolean manager) {
		this.manager = manager;
	}
	
	
}
