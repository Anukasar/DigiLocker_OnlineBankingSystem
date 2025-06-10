package com.bank.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.Model.User;
import com.bank.Service.UserService;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieving form parameters
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String accountType = request.getParameter("account_type");
            String accountNumber = request.getParameter("accountNumber");
            
            Date dob = (request.getParameter("dob") != null && !request.getParameter("dob").isEmpty())
                    ? Date.valueOf(request.getParameter("dob"))
                    : null;
         
            double balance = 0;
            	 		
           if(request.getParameter("balance") != null && !request.getParameter("balance").isEmpty()){
            	
        	   double inputBalance = Double.parseDouble(request.getParameter("balance"));
            	if(inputBalance < 500) {
            		alertAndRedirect(response,"Balance must be at least 500!","Register.jsp");
            		return;
            	}
            	balance = inputBalance;
            }
                            
            if (username==null || username.length() > 15) {
                alertAndRedirect(response, "Username cannot exceed 15 characters!", "Register.jsp");
                return;
            }

            if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
                alertAndRedirect(response, "Invalid email format!", "Register.jsp");
                return;
            }

            if (!phone.matches("^[0-9]{10}$")) {
                alertAndRedirect(response, "Phone number must be exactly 10 digits!", "Register.jsp");
                return;
            }

            if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d@#$%^&*!]{6,}$")) {
                alertAndRedirect(response, "Password must be at least 6 characters with letters and numbers!", "Register.jsp");
                return;
            }

            User user = new User(username, password, dob, email, accountType, balance,phone,accountNumber);
            boolean isRegistered = UserService.registerUser(user);

            if (isRegistered) {
                alertAndRedirect(response, "Registration Successful! Please wait for admin approval.", "login.jsp");
            } else {
                alertAndRedirect(response, "Registration Failed. Try again!", "Register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            alertAndRedirect(response, "Something went wrong! Try again.", "Register.jsp");
        }
    }

    
    private void alertAndRedirect(HttpServletResponse response, String message, String redirectPage) throws IOException {
    	 response.setContentType("text/html");
    	response.getWriter().println("<script>alert('" + message + "'); window.location='" + redirectPage + "';</script>");
    }
}
