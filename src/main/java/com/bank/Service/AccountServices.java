package com.bank.Service;

import com.bank.Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bank.DAO.UserDatabase;
public class AccountServices {
	
	public static int Deposit(User user,double depositAmount){
		 try(Connection con = UserDatabase.myconnection()){
			 
			PreparedStatement pstmt = con.prepareStatement("SELECT balance from Bankusers where user_id1 = ?");
			pstmt.setString(1, user.getAccountNumber());
			
		    ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				double currentBalance = rs.getDouble("balance");
				double newBalance = currentBalance + depositAmount;
			    
				String updateQuery = "UPDATE bankusers SET balance = ? WHERE accountNumber = ?";
				PreparedStatement updatePstmt = con.prepareStatement(updateQuery);
				updatePstmt.setDouble(1, newBalance);
				updatePstmt.setString(2, user.getAccountNumber());
				
				int rowsUpdated = updatePstmt.executeUpdate();
				if(rowsUpdated>0) {
					System.out.println("Deposit successful! New Balnace : " +newBalance);
					return 1;
				}
			}
			 
			 
		 }catch(SQLException e){
			 
		 }
		return 0;
		
		
	}

}
