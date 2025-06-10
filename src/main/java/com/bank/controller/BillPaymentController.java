package com.bank.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.Service.BillPayments;

/**
 * Servlet implementation class BillPaymentController
 */
@WebServlet("/BillPaymentController")
public class BillPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   HttpSession session = request.getSession();
	   int user_id1 = (session.getAttribute("user_id1")!=null) ? (int)session.getAttribute("user_Id"): 1;
	
	  String biller = request.getParameter("biller");
	  String billType = request.getParameter("bill_type");
	  double amount = Double.parseDouble(request.getParameter("amount"));
	  
	  boolean success = BillPayments.processBillPayment(user_id1,biller,billType,amount);
	  
	  request.setAttribute("paymentSuccess", success);
	  request.getRequestDispatcher("BillPayments.jsp").forward(request, response);
	}

	

}
