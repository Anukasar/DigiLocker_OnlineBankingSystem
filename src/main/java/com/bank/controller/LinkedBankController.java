package com.bank.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.DAO.AccountDatabase;
import com.bank.Model.Account;

@WebServlet("/LinkedBankController")
public class LinkedBankController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String accountNumber = request.getParameter("accountNumber");

        AccountDatabase accountDb = new AccountDatabase();

        if ("check".equals(action)) {
            boolean accountExists = accountDb.checkIfAccountExists(accountNumber);
            if (accountExists) {
                Account account = accountDb.getAccountDetails(accountNumber);
                request.setAttribute("message", "Account found: " + account.toString());
            } else {
                request.setAttribute("message", "Account does not exist. Please create a new account.");
            }
        } else if ("create".equals(action)) {
            try {
                int custId = Integer.parseInt(request.getParameter("custId"));
                String ifscCode = request.getParameter("ifscCode");
                String accountType = request.getParameter("accountType");
                double balance = Double.parseDouble(request.getParameter("balance"));
                String branchName = request.getParameter("branchName");

                Account newAccount = new Account();
                newAccount.setUser_id(custId);
                newAccount.setAccount_number(accountNumber);
                newAccount.setIfsc(ifscCode);
                newAccount.setAccount_type(accountType);
                newAccount.setBalance(balance);
                newAccount.setBranch_name(branchName);

                boolean isCreated = accountDb.createNewAccount(newAccount);
                if (isCreated) {
                    request.setAttribute("message", "New account created successfully!");
                } else {
                    request.setAttribute("message", "Failed to create new account. Please try again.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Invalid input. Please provide valid data.");
            }
        } else {
            request.setAttribute("message", "Invalid action. Please select a valid option.");
        }

        //request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
