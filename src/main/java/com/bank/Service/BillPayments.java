package com.bank.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bank.DAO.UserDatabase;

public class BillPayments{
	
	public static boolean processBillPayment(int user_id1,String biller,String billType,double amount){
		boolean isSuccessful = false;
		
		try(Connection con = UserDatabase.myconnection()){
			String status = (Math.random()> 0.2) ? "Success" : "Failed";
			
			String query = "Insert into BillPayments(payment_id,user_id1,biller_name,bill_type,amount,status)values(payment_id_seq1.NEXTVAL,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setInt(1, user_id1);
			pst.setString(2, biller);
			pst.setString(3, billType);
			pst.setDouble(4, amount);
			pst.setString(5, status);
			
			int i = pst.executeUpdate();
			isSuccessful = (i>0 && status.equals("Success"));
				
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return isSuccessful;
	
	}  

}