package com.bank.Model;

import java.sql.Timestamp;
import java.util.Date;

public class Transaction {
    private int transaction_id;
    private String senderAccount;
    private String receiverAccount;
    private double amount;
    private String transactionType;
    private Timestamp transactionDate;
    private String Status;
    
	public Transaction(int transaction_id, String senderAccount,String receiverAccount, double amount, String transactionType,
			Timestamp transactionDate, String Status) {
		super();
		this.transaction_id = transaction_id;
		this.senderAccount = senderAccount;
		this.amount = amount;
		this.transactionType = transactionType;
		this.transactionDate = transactionDate;
		this.Status = Status;
		this.receiverAccount = receiverAccount;
	}

	public Transaction(){
		
	}
	
	public int getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(int i) {
		this.transaction_id = i;
	}

	public String getSenderAccount() {
		return senderAccount;
	}

	public void setSenderAccount(String senderAccount) {
		this.senderAccount = senderAccount;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public Timestamp getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Timestamp transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String Status) {
		this.Status = Status;
	}

	public String getReceiverAccount() {
		return receiverAccount;
	}

	public void setReceiverAccount(String receiverAccount) {
		this.receiverAccount = receiverAccount;
	}

	
   
    
  }
