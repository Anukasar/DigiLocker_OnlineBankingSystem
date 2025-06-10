package com.bank.Model;

public class checkbal {
	private int accountNumber;
    private int password;
    private float balance;
    
    
	public checkbal() {
		super();
		// TODO Auto-generated constructor stub
	}


	public checkbal(int accountNumber, int password, float balance) {
		super();
		this.accountNumber = accountNumber;
		this.password = password;
		this.balance = balance;
	}


	public int getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}


	public int getPassword() {
		return password;
	}


	public void setPassword(int password) {
		this.password = password;
	}


	public float getBalance() {
		return balance;
	}


	public void setBalance(float balance) {
		this.balance = balance;
	}
    
	

    
    
}
