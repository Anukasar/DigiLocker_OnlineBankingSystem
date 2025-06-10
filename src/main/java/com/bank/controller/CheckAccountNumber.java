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
 * Servlet implementation class CheckAccountNumber
 */
@WebServlet("/CheckAccountNumber")
public class CheckAccountNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accountNumber = request.getParameter("accountNumber");
		
		try(Connection con = UserDatabase.myconnection()){
			PreparedStatement pstmt = con.prepareStatement("Select accountNumber from bankusers WHERE accountNumber = ?");
			pstmt.setString(1, accountNumber);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				response.getWriter().write("exists");
			}else {
				
				response.getWriter().write("available");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("error");
		}
	}

}
