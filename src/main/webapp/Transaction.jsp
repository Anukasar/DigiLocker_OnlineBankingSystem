<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bank.Model.Transaction" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #F2F2F2; }
        .navbar { background-color: #001F3F; }
        .navbar-brand { font-weight: bold; color: black; }
        .navbar-brand span { color: #FF851B; }
        .nav-link { color: Orange !important; }
        .container { max-width: 900px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0px 4px 10px rgba(0,0,0,0.1); }
        .btn-primary { background-color: #001F3F; border: none; }
        .btn-primary:hover { background-color: #FF851B; }
        
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="Dashboard.jsp">DigiLocker<span>.</span></a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center">Transaction History</h2>
        <hr>

        <% 
            HttpSession sessionObj = request.getSession();
            String accountNumber = (String)sessionObj.getAttribute("accountNumber");
        %>

        <h5 class="text-center">Account Number: <strong><%= accountNumber %></strong></h5>

        <% ArrayList<Transaction>transactionList = (ArrayList<Transaction>)request.getAttribute("transactionList"); %>
        <% if(transactionList!= null && !transactionList.isEmpty()) { %>
            <table class="table table-striped mt-4">
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Sender</th>
                        <th>Receiver</th>
                        <th>Amount</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Transaction txn : transactionList) { %>
                        <tr>
                            <td><%= txn.getTransaction_id() %></td>
                            <td><%= txn.getSenderAccount() %></td>
                            <td><%= txn.getReceiverAccount() %></td>
                            <td>$<%= txn.getAmount() %></td>
                            <td><%= txn.getTransactionType() %></td>
                            <td><%= txn.getTransactionDate() %></td>
                            <td><%= txn.getStatus() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="text-center text-danger mt-3">No transactions found!</p>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
