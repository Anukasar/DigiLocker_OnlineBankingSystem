<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/RegisterStyle.css">
    <title>Registration</title>
    
    <style>
        .error {
            color: red;
            font-size: 14px;
        }
    </style>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("username").addEventListener("input", function () {
                let username = this.value;
                let errorSpan = document.getElementById("usernameError");
                if (username.length > 15) {
                    errorSpan.textContent = "Username cannot exceed 15 characters!";
                } else {
                    errorSpan.textContent = "";
                }
            });

            document.getElementById("email").addEventListener("input", function () {
                let email = this.value;
                let errorSpan = document.getElementById("emailError");
                let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailRegex.test(email)) {
                    errorSpan.textContent = "Invalid email format!";
                } else {
                    errorSpan.textContent = "";
                }
            });

            document.getElementById("password").addEventListener("input", function () {
                let password = this.value;
                let errorSpan = document.getElementById("passwordError");
                if (!/(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@#$%^&*!]{6,}$/.test(password)) {
                    errorSpan.textContent = "Password must be at least 6 characters with letters and numbers!";
                } else {
                    errorSpan.textContent = "";
                }
            });

            document.getElementById("confirm_password").addEventListener("input", function () {
                let confirmPassword = this.value;
                let password = document.getElementById("password").value;
                let errorSpan = document.getElementById("confirmPasswordError");
                if (password !== confirmPassword) {
                    errorSpan.textContent = "Passwords do not match!";
                } else {
                    errorSpan.textContent = "";
                }
            });

            document.getElementById("phone").addEventListener("input", function () {
                let phone = this.value;
                let errorSpan = document.getElementById("phoneError");
                if (!/^\d{10}$/.test(phone)) {
                    errorSpan.textContent = "Phone number must be exactly 10 digits!";
                } else {
                    errorSpan.textContent = "";
                }
            });

            document.getElementById("balance").addEventListener("input", function () {
                let balance = parseFloat(this.value);
                let errorSpan = document.getElementById("balanceError");
                if (balance < 500) {
                    errorSpan.textContent = "Balance must be at least 500!";
                } else {
                    errorSpan.textContent = "";
                }
            });
              
           
            document.querySelector("form").addEventListener("submit", function (event) {
                let balance = parseFloat(document.getElementById("balance").value);
                if (balance < 500) {
                    document.getElementById("balanceError").textContent = "Balance must be at least 500!";
                    event.preventDefault(); 
                }
            });
        });
        
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("accountNumber").addEventListener("input", function () {
                let accountNumber = this.value;
                let errorSpan = document.getElementById("accountNumberError");
                if (!/^\d{11}$/.test(accountNumber)) {
                    errorSpan.textContent = "Account Number must be exactly 11 digits!";
                } else {
                    errorSpan.textContent = "";
                    checkAccountNumberUnique(accountNumber); // Check uniqueness via AJAX
                }
            });

            function checkAccountNumberUnique(accountNumber) {
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "CheckAccountNumberServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        let response = xhr.responseText.trim();
                        if (response === "exists") {
                            document.getElementById("accountNumberError").textContent = "Account Number already exists!";
                        } else {
                            document.getElementById("accountNumberError").textContent = "";
                        }
                    }
                };
                xhr.send("accountNumber=" + accountNumber);
            }
        });

    </script>
</head>
<body>
     <div class="links">
        <a href="Home.jsp">Home <span><</span></a>
        <a href="login.jsp">Login <span><</span></a>
        <a href="help.jsp">Help</a>
    </div>
    <div class="container">
        <form action="RegisterController" method="post">
            <h2>Registration</h2>
            <div class="content">
                <div class="input-box">
                    <label for="username">Username</label>
                    <input type="text" placeholder="Enter Username" name="username" id="username" required>
                    <span class="error" id="usernameError"></span>
                </div>

                <div class="input-box">
                    <label for="email">Email</label>
                    <input type="email" placeholder="Enter your Email" name="email" id="email" required>
                    <span class="error" id="emailError"></span>
                </div>

                <div class="input-box">
                    <label for="dob">Date of Birth</label>
                    <input type="date" name="dob" id="dob" required>
                </div>

                <div class="input-box">
                    <label for="phone">Phone Number</label>
                    <input type="text" placeholder="Enter Phone Number" name="phone" id="phone" required>
                    <span class="error" id="phoneError"></span>
                </div>

                <div class="input-box">
                    <label for="password">Password</label>
                    <input type="password" placeholder="Enter your password" name="password" id="password" required>
                    <span class="error" id="passwordError"></span>
                </div>

                <div class="input-box">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" placeholder="Enter password again" name="confirm_password" id="confirm_password" required>
                    <span class="error" id="confirmPasswordError"></span>
                </div>

                <div class="input-box">
                    <label>Account Type</label>
                    <select name="account_type" id="account_type">
                        <option value="saving">Saving</option>
                        <option value="checking">Checking</option>
                    </select>
                </div>

                <div class="input-box">
                    <label for="balance">Balance</label>
                    <input type="number" name="balance" id="balance"  required>
                     <span class="error" id="balanceError"></span>
                </div>
                
                <div class="input-box">
                    <label for="balance">Account Number</label>
                    <input type="number" name="accountNumber" placeholder = "Enter Account Number" id="accountNumber"  required>
                    <span class="error" id="accountNumberError"></span>
                </div>

                <span class="gender-title">Gender</span>
                <div class="gender-category">
                    <input type="radio" name="gender" id="male"><label for="male">Male</label>
                    <input type="radio" name="gender" id="female"><label for="female">Female</label>
                    <input type="radio" name="gender" id="other"><label for="other">Other</label>
                </div>
            </div>

            <div class="alert">
                <p>By clicking Sign up, you agree to our 
                    <a href="#">Terms</a>, 
                    <a href="#">Privacy Policy</a>, and 
                    <a href="#">Cookies Policy</a>.
                    You may receive SMS notifications from us and can opt out at any time.</p>
            </div>

            <div class="button-container">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
</body>
</html>
