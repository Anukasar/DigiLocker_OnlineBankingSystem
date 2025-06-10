<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bank.Model.User" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Customer Account Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        #newAccountFields {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }

        a {
            display: inline-block;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Customer Account Management</h1>

    <form action="LinkedBankController" method="post">
        <label for="accountNumber">Enter Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required>

        <label for="action">Select Action:</label>
        <select id="action" name="action">
            <option value="check">Check Existing Account</option>
            <option value="create">Create New Account</option>
        </select>

        <div id="newAccountFields" style="display: none;">
            <label for="custId">Customer ID:</label>
            <input type="number" id="custId" name="custId">

            <label for="ifscCode">IFSC Code:</label>
            <input type="text" id="ifscCode" name="ifscCode">

            <label for="accountType">Account Type:</label>
            <input type="text" id="accountType" name="accountType">

            <label for="balance">Initial Balance:</label>
            <input type="number" id="balance" name="balance">

            <label for="branchName">Branch Name:</label>
            <input type="text" id="branchName" name="branchName">
        </div>

        <input type="submit" value="Submit">
    </form>

    <script>
        document.getElementById('action').addEventListener('change', function () {
            const newAccountFields = document.getElementById('newAccountFields');
            if (this.value === 'create') {
                newAccountFields.style.display = 'block';
            } else {
                newAccountFields.style.display = 'none';
            }
        });
    </script>
</body>
</html>
