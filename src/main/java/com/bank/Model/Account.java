package com.bank.Model;

public class Account {
	
     private int account_id;
     private int user_id;
     private String  account_number;
     private String ifsc;
     private String account_type;
     private double balance;
     private String status;
     private String branch_name;
    
    public Account( int user_id, String account_number, String ifsc, String account_type, double balance,
			String status, String branch_name) {
		
		this.user_id = user_id;
		this.account_number = account_number;
		this.ifsc = ifsc;
		this.account_type = account_type;
		this.balance = balance;
		this.status = status;
		this.branch_name = branch_name;
	}
	public Account(){
    	
    	
    }
	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
     
        
}
