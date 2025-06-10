package com.bank.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.DAO.UserDatabase;

/**
 * Servlet implementation class TransferController
 */
@WebServlet("/TransferController")
public class TransferController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senderAccount = request.getParameter("senderAccount");
		String receiverAccount = request.getParameter("receiverAccount");
		double transferAmount = Double.parseDouble( request.getParameter("transferAmount"));
		
		if(transferAmount<0) {
			request.setAttribute("errorMessage","Inavalid transfer amount please enter valid amount");
			request.getRequestDispatcher("Transfer.jsp").forward(request, response);;
			return;
			
		}
		
		try(Connection con = UserDatabase.myconnection()){
			con.setAutoCommit(false);
			PreparedStatement pstmt = con.prepareStatement("SELECT balance from bankusers WHERE accountNumber = ?");
			pstmt.setString(1, senderAccount);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				double senderBalance = rs.getDouble("balance");
				
				if(senderBalance<transferAmount){
					request.setAttribute("errorMessage"," you have Insuffiecient Amount to transfer");
					request.getRequestDispatcher("Transfer.jsp").forward(request, response);
					return;
				}
			
			     //Deducting from sender account
				String deductQuery = "UPDATE bankusers SET balance = balance - ? WHERE accountNumber = ?";
				PreparedStatement deductStmt = con.prepareStatement(deductQuery);
				deductStmt.setDouble(1, transferAmount);  
				deductStmt.setString(2, senderAccount);
				int rowsDeducted = deductStmt.executeUpdate();
			
			//Transfer to Receiver account
				String addQuery = "UPDATE bankusers SET balance = balance + ? WHERE accountNumber = ?";
				PreparedStatement addStmt = con.prepareStatement(addQuery);
				addStmt.setDouble(1, transferAmount);
				addStmt.setString(2, receiverAccount);
				int rowsAdded = addStmt.executeUpdate();
			
			String insertTransaction = "INSERT INTO transactions (transactionId, senderAccount, receiverAccount, amount, transactionType, status) " +
                    "VALUES (transaction_seq.NEXTVAL, ?, ?, ?, 'Transfer', ?)";
			PreparedStatement transactionStmt = con.prepareStatement(insertTransaction);
			transactionStmt.setString(1, senderAccount);
			transactionStmt.setString(2, receiverAccount);
			transactionStmt.setDouble(3, transferAmount);
			transactionStmt.setString(4, "success");
			
			int rowsInserted = transactionStmt.executeUpdate();
			
			if(rowsDeducted> 0 && rowsAdded > 0 && rowsInserted >0){
				con.commit();
				request.setAttribute("success",true);
				System.out.println("Amount Transfer successfully...");
				
			}else {
				con.rollback();
				request.setAttribute("errorMessage", "Transfer failed! Please try again");
				System.out.println("Transfer failed....");
			}
			
		}else {
			request.setAttribute("errorMessage","sender account not found");
		 }
			
		request.getRequestDispatcher("Transfer.jsp").forward(request, response);
	} catch (SQLException e) {
			
			e.printStackTrace();
			 request.setAttribute("errorMessage", "An error occurred! Please try again.");
	         request.getRequestDispatcher("Transfer.jsp").forward(request, response);
		}
		
	}

}
