package com.bank.Service;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import com.bank.DAO.UserDatabase;
import com.bank.Model.Credential;
import com.bank.Model.User;
import Utility.SecurityUtil;

public class UserService {

    public static boolean registerUser(User user) {
    	
    	try(Connection con = UserDatabase.myconnection()){
    		
    		String salt = SecurityUtil.generateSalt();
        	String hashedpassword = SecurityUtil.hashPassword(user.getPassword(),salt);
        	
    		PreparedStatement pstmt = con.prepareStatement("Insert into bankusers(user_id1,username,password,hashedpassword,dob,email,account_type,balance,is_approved,phone,salt,accountNumber)values(users1_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)");
    		pstmt.setString(1,user.getUsername());
    		pstmt.setString(2, user.getPassword());
    		pstmt.setString(3, hashedpassword);
    		pstmt.setDate(4, user.getDob());
            pstmt.setString(5,user.getEmail());
            pstmt.setString(6, user.getAccount_type());
            pstmt.setDouble(7, user.getBalance());
            pstmt.setInt(8, 1);
            pstmt.setString(9, user.getPhone());
            pstmt.setString(10, salt);
            pstmt.setString(11, user.getAccountNumber());
    		
            int rowsInserted  = pstmt.executeUpdate();
            if(rowsInserted>0) {
            	System.out.println("Data Inserted Successfully..!");
            	return true;
            }
    		 		
    	}catch(SQLException e) {
    		e.printStackTrace();
    		
    	} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
    	return false;    
    }

    public static User loginUser(String username, String password) {
        User user = null;
        
        try (Connection con = UserDatabase.myconnection()) {
            String query = "SELECT hashedpassword, salt, accountnumber, balance FROM bankusers WHERE username = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            
            ResultSet resultset = pstmt.executeQuery();
            
            if (resultset.next()) {
                String storedHashedPassword = resultset.getString("hashedpassword");
                String storedSalt = resultset.getString("salt");
                String hashedInputPassword = SecurityUtil.hashPassword(password, storedSalt);
                
                if (storedHashedPassword.equals(hashedInputPassword)) {
                    user = new User(); // ✅ Create User object
                    user.setUsername(username);
                    user.setAccountNumber(resultset.getString("accountnumber")); // ✅ Fetch account number
                    user.setBalance(resultset.getDouble("balance")); //  Fetch balance
                    
                    System.out.println("✅ User logged in successfully: " + username);
                    System.out.println("Account Number: " + user.getAccountNumber());
                    System.out.println("Balance: " + user.getBalance());
                } else {
                    System.out.println("❌ Password Mismatched...");
                    System.out.println("Stored Hashed Password: " + storedHashedPassword);
                    System.out.println("Input Hashed Password: " + hashedInputPassword);
                    System.out.println("Salt Used: " + storedSalt);
                }
            } else {
                System.out.println("❌ Username not found.");
            }
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return user;
    }

}