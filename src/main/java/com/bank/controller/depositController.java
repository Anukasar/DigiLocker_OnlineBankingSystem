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
import com.bank.Service.AccountServices;

/**
 * Servlet implementation class depositController
 */
@WebServlet("/depositController")
public class depositController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String accountNumber = request.getParameter("accountNumber");
		  Double depositAmount = Double.parseDouble(request.getParameter("amount"));
		  
		  if(depositAmount<=0){
			  request.setAttribute("errorMessage", "Invalid deposit amount.pleasse enter a valid amount");
			  request.getRequestDispatcher("Deposit.jsp").forward(request, response);
			  return;
		  }
		  try(Connection con = UserDatabase.myconnection()){
			  String query = "SELECT balance from bankusers WHERE accountNumber = ?";
			  PreparedStatement pstmt = con.prepareStatement(query);
			  
			  pstmt.setString(1, accountNumber);
			  ResultSet rs = pstmt.executeQuery();
			  
			  if(rs.next()) {
				  double currentBalance = rs.getDouble("balance");
				  double newBalance = currentBalance + depositAmount;
				  
				  String updateQuery = "UPDATE bankusers SET balance = ? WHERE accountNumber = ?";
				  PreparedStatement updateStmt = con.prepareStatement(updateQuery);
				  
				  updateStmt.setDouble(1, newBalance);
				  updateStmt.setString(2, accountNumber);
				  int rowsUpdated = updateStmt.executeUpdate();
				  
				  if(rowsUpdated > 0) {
					  request.setAttribute("successMessage","Deposit successful! Your ammount has been added");
					  System.out.println("Amount Has been added");
					  request.getRequestDispatcher("Deposit.jsp").forward(request, response);
				  }else {
					  request.setAttribute("errorMessage", "Deposit failed! please try agian");
					  request.getRequestDispatcher("Deposit.jsp").forward(request, response);
				  }
			  }else {
				  request.setAttribute("errorMessage", "Account not found! Please enter a valid account number");
				  request.getRequestDispatcher("Deposit.jsp").forward(request, response);
			  }
		  }catch(SQLException e){
			  e.printStackTrace();
			  request.setAttribute("errorMessage", "An error occured! Please try agian");
			  request.getRequestDispatcher("Deposit.jsp").forward(request, response);
		  }
		
	}

}
