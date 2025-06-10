package com.bank.Model;

public class Credential {
	private int credId;
	private int userId;
	private String username;
	private String password;
	private String salt;
	private String hashpassword;
	
	public Credential() 
	{
		
	}
	public Credential(int credId, int userId, String username, String password, String salt, String hashpassword) {
		super();
		this.credId = credId;
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.salt = salt;
		this.hashpassword = hashpassword;
	}

	public int getCredId() {
		return credId;
	}

	public void setCredId(int credId) {
		this.credId = credId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getHashpassword() {
		return hashpassword;
	}

	public void setHashpassword(String hashpassword) {
		this.hashpassword = hashpassword;
	}
	
}
