package com.bank.Model;

import java.sql.Date;

public class User {
    private int user_id1;
    private String username;
    private String password;
    private String hashedpassword;
    private Date dob;
    private String email;
    private String account_type;
    private double balance ;
    private int is_approved;
    private String phone;
    private String accountNumber;
    
	public User(int user_id1, String username, String password, Date dob, String email,
			String account_type, double balance, int is_approved,String phone,String accountNumber) {
		super();
		this.username = username;
		this.password = password;
		this.dob = dob;
		this.email = email;
		this.account_type = account_type;
		this.balance = balance;
		this.is_approved = is_approved;
		this.phone = phone;
		this.accountNumber = accountNumber;
	}
	


	public User(String username, String password, Date dob, String email, String account_type, double balance,
			 String phone,String accountNumber) {
		super();
		this.username = username;
		this.password = password;
		this.dob = dob;
		this.email = email;
		this.account_type = account_type;
		this.balance = balance;
		this.phone = phone;
		this.accountNumber = accountNumber;
	}

	public User(){
		
	}

	public int getUser_id1() {
		return user_id1;
	}

	public void setUser_id1(int user_id1) {
		this.user_id1 = user_id1;
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

	public String getHashedpassword() {
		return hashedpassword;
	}

	public void setHashedpassword(String hashedpassword) {
		this.hashedpassword = hashedpassword;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccount_type() {
		return account_type;
	}

	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public int getIs_approved() {
		return is_approved;
	}

	public void setIs_approved(int is_approved) {
		this.is_approved = is_approved;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

}
