package com.bank.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.DAO.UserDatabase;
import com.bank.Model.Transaction; 

@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNumber = (String)session.getAttribute("accountNumber"); 
       

        if (accountNumber == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        ArrayList<Transaction>transactionList = new ArrayList<>();
        
        try (Connection con = UserDatabase.myconnection()) {
        	 System.out.println("Session accountNumber: " + accountNumber);
            String query = "SELECT transactionId, senderAccount, receiverAccount, amount, transactionType, transactionDate, Status FROM transactions WHERE senderAccount = ? OR receiverAccount = ? ORDER BY transactionDate DESC";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, accountNumber);
            pstmt.setString(2, accountNumber);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransaction_id(rs.getInt("transactionId"));
                transaction.setSenderAccount(rs.getString("senderAccount"));
                transaction.setReceiverAccount(rs.getString("receiverAccount"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setTransactionType(rs.getString("transactionType"));
                transaction.setTransactionDate(rs.getTimestamp("transactionDate"));
                transaction.setStatus(rs.getString("Status"));
                
                transactionList.add(transaction);
            }
            System.out.println("Executing query for account: " + accountNumber);
            System.out.println("Total transactions fetched: " + transactionList.size());

            request.setAttribute("transactionList", transactionList);
            System.out.println("Transaction list size: " + transactionList.size());
            request.getRequestDispatcher("Transaction.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to load transaction history.");
            request.getRequestDispatcher("Transaction.jsp").forward(request, response);
        }
    }
}
