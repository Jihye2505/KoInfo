package kr.or.kosta.domain;

public class User {
	
	private String id;
	private String password;
	private String name;
	private String sex;
	private String email;
	private String birth;
	private String phonenum;
	private char rank;
	
	public User() {}
	
	public User(String id, String password, String name, String sex, String email, String birth, String phonenum, char rank) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.email = email;
		this.birth = birth;
		this.phonenum = phonenum;
		this.rank = rank;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhoneNum() {
		return phonenum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phonenum = phoneNum;
	}
	public char getRank() {
		return rank;
	}
	public void setRank(char rank) {
		this.rank = rank;
	}
	
	

}
