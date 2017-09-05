package com.entity;

public class Users {

	private String userName;
	private String passWord;
	private String nickName;
	private String telephoneNumber;
	private String birthday;
	private String gender;
	private String onlineStatus;
	private Integer role;

	public Users() {
		super();
	}

	public Users(String userName) {
		super();
		this.userName = userName;
	}

	public Users(String userName, String passWord, String nickName, String telephoneNumber, String birthday,
			String gender) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.nickName = nickName;
		this.telephoneNumber = telephoneNumber;
		this.birthday = birthday;
		this.gender = gender;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public Users(String userName, String passWord, String nickName, String telephoneNumber, String birthday,
			String gender, String onlineStatus, Integer role) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.nickName = nickName;
		this.telephoneNumber = telephoneNumber;
		this.birthday = birthday;
		this.gender = gender;
		this.onlineStatus = onlineStatus;
		this.role = role;
	}

	public Users(String userName, String passWord, String nickName, String telephoneNumber, String birthday,
			String gender, String onlineStatus) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.nickName = nickName;
		this.telephoneNumber = telephoneNumber;
		this.birthday = birthday;
		this.gender = gender;
		this.onlineStatus = onlineStatus;
	}

	public Users(String userName, String passWord) {
		super();
		this.userName = userName;
		this.passWord = passWord;
	}

	public Users(String userName, String nickName, String telephoneNumber, String birthday, String gender) {
		super();
		this.userName = userName;
		this.nickName = nickName;
		this.telephoneNumber = telephoneNumber;
		this.birthday = birthday;
		this.gender = gender;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getOnlineStatus() {
		return onlineStatus;
	}

	public void setOnlineStatus(String onlineStatus) {
		this.onlineStatus = onlineStatus;
	}

}
