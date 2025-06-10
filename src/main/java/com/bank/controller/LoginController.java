package com.bank.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.Model.User;
import com.bank.Service.UserService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Validate input fields
		if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
			request.setAttribute("errorMessage", "Username and password are required.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		// Check if user exists in the database
		User user = UserService.loginUser(username, password);

		if (user!= null) {
			// Create a new session or get existing one
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			session.setAttribute("accountNumber", user.getAccountNumber()); 
			session.setAttribute("balance", user.getBalance()); // Fetch balance

			System.out.println("✅ User logged in successfully: " + username);
			response.sendRedirect(request.getContextPath() + "/Dashboard.jsp");  
		} else {
			System.out.println("❌ Invalid login attempt for username: " + username);
			request.setAttribute("errorMessage", "Invalid username or password.");
			request.getRequestDispatcher("login.jsp").forward(request, response); 
		}
	}
}
