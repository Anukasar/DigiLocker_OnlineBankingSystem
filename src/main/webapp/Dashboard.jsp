<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String)sessionUser.getAttribute("username");
    String accountNumber = (String) sessionUser.getAttribute("accountNumber");
    double balance = Double.parseDouble(sessionUser.getAttribute("balance").toString());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digilocker Bank Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fafc;
            color: #333;
        }
        .dashboard {
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .close-btton {
            position: absolute;
            top: 20px;
            right: 20px;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }
        .logoimg{
            width: 100px;
           margin: auto;
           display: block;
           margin-bottom: 10px;
  
        }
        .sidebar {
            width: 250px;
            background: #ffffff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            border-right: 1px solid #ddd;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: fixed;
            left: -250px;
            top: 0;
            height: 100%;
            transition: all 0.3s ease-in-out;
            z-index: 1000;
        }
        .sidebar.open {
            left: 0;
        }
        .profile {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 5px;
        box-sizing: auto;
       }
        .menu-bar {
            position: absolute;
            top: 30px;
            left: 20px;
            background: none;
            border: none;
            cursor: pointer;
            z-index: 1100;
        }
        .menu-bar .hamburger {
            width: 30px;
            height: 3px;
            background-color: #333;
            margin: 6px 0;
            transition: 0.4s;
        }
        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }
        .sidebar .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .sidebar .logo img {
            width: 100px;
            height: auto;
        }
        .sidebar h1 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #555;
        }
        .sidebar input {
            width: 100%;
            padding: 10px;
            margin: 0px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .sidebar .qr-code {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }
        .sidebar .qr-code img {
            width: 100px;
            height: auto;
            margin-top: auto;
        }
        .sidebar .logout {
            background-color: #e63946;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 4px;
            cursor: pointer;
        }
        .main {
            flex: 1;
            padding: 20px;
            background: #f4f4f9;
            display: flex;
            flex-direction: column;
            margin-left: 0;
            transition: margin-left 0.3s ease-in-out;
            position: relative;
        }
        .main.sidebar-open {
            margin-left: 250px;
        }
        .main .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .main .header h1 {
            font-size: 1.5rem;
            color: #333;
            margin-left: auto;
            font-size: 28px;
        }
        .main .header .logo {
            margin-left: auto;
        }
        .main .header .logo img {
            width: 50px;
            height: auto;
        }
        .main .balance {
            background: #ffffff;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-bottom: 20px;
           
            justify-content: space-between;
            align-items: center;
        }
        .main .balance div  {
            text-align: center;
        }
        .main .balance div p {
            text-align: center;
        }
        .main .buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 20px;
        }
        .buttons a {
            text-decoration: none;
            color: inherit;
        }
        .main .button {
            background-color: #001f3f;
            color: white;
            text-align: center;
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .main .button:hover {
            background-color: #6c757d;
        }
        .main .history-section {
            text-align: center;
            margin: 50px 0;
        }
        .main .history-button {
            text-decoration: none;
            color: black;
            background-color: #b7d4e9;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="sidebar" id="sidebar">
            <div >
                <img src="profileimg.png" class="logoimg">
                <button class="close-btn" id="close" onclick="toggleSidebar()">&times;</button> 
            </div>
            <div class="profile">
               <p><strong>Username:</strong> <%= username %></p>
            </div>
            <div class="profile">
                 <p><strong>Account Number:</strong> <%= accountNumber %></p>
            </div>
            <div class="profile">
                <p><strong>Balance:</strong> ₹<%= balance %></p>
            </div>
            <div class="qr-code">
                <img src="scanner.png" alt="QR Code">
            </div>
            <button class="logout">Logout</button>
        </div>
        <div class="main">
            <div class="header">
                <button class="menu-bar" id="menu-bar">
                    <div class="hamburger"></div>
                    <div class="hamburger"></div>
                    <div class="hamburger"></div>
                </button>
                <h1>Welcome to Digilocker Bank</h1>
                <div class="logo">
                    <img src="bankpng.png" alt="Logo">
                </div>
            </div>
            <div class="balance">
                <div>
                    <h2>Account Number: <%= accountNumber %></h2>
                    <p><strong>Balance:</strong> ₹<%= balance %></p>
                </div> 
            </div>
            <div class="buttons">
                <a href="Transfer.jsp" class="button">Transfer Money</a>
                <a href="Deposit.jsp" class="button">Withdraw Deposit</a>
                <a href="#" class="button">Recharge</a>
                <a href="#" class="button">Statement</a>
                <a href="#" class="button">Bill payment</a>

            </div>
            <div class="history-section">
               <a href ="TransactionController"><button class="history-button" id="history-button">View Transaction History</button></a>
            </div>
            <div class="modal" id="modal">
                <div class="modal-content">
                    <h2>Transaction History</h2>
                  
                </div>
            </div>
        </div>
    </div>
    <script>
        const menuBar = document.getElementById('menu-bar');
        const sidebar = document.getElementById('sidebar');
        const main = document.querySelector('.main');
        const historyButton = document.getElementById('history-button');
        const modal = document.getElementById('modal');
        const closeButton = document.getElementById('close-btn1');
        const close= document.getElementById('close');

        close.addEventListener('click', () => {
    sidebar.classList.remove('open');
    main.classList.remove('sidebar-open');
          });

        menuBar.addEventListener('click', () => {
            sidebar.classList.add('open');
            main.classList.add('sidebar-open');
        });

        closeButton.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        historyButton.addEventListener('click', () => {
            modal.style.display = 'block';
        });

    </script>  
</body>
</html>