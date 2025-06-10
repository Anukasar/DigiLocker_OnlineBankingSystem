<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.bank.Model.User, com.bank.Service.UserService" %>
<%
    String errorMessage = (String)request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
        body {
            background-color: #F2F2F2;
        }
        .navbar {
            background-color: #001F3F;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .navbar-brand {
            font-weight: bold;
            color: white;
        }
        .navbar-brand span {
            color: #FF851B;
        }
        .nav-link {
            color: white !important;
        }
        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px;
            display: flex;
            align-items: center;
        }
      
        .btn-primary {
            background-color: #001F3F;
            border: none;
        }
        .btn-primary:hover {
            background-color: #FF851B;
        }
        .btn-warning {
            background-color: #FF851B;
            border: none;
        }
        .btn-warning:hover {
            background-color: #001F3F;
        }
        .login-section {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            padding-top: 60px;
        }
        .login-content {
            display: flex;
            align-items: center;
        }
        .image-container img {
            width: 250px;
            height: auto;
            margin-left: 20px;
        }
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">DigiLocker<span>.</span></a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="Home.jsp">Digilocker Home</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container login-section">
        <div class="login-container">
            <div class="login-content">
                <div>
                 <!--   <div class="login-header">Login to Internet Banking</div>-->
                    <form action="LoginController" method="post">
                       <% if (errorMessage != null) { %>
                            <div class="alert alert-danger"><%= errorMessage %></div>
                        <% } %>
                        <div class="mb-3">
                            <label class="form-label">Username:</label>
                            <input type="text" class="form-control" placeholder="User Name" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password:</label>
                            <input type="password" class="form-control" placeholder="Password" name="password" required>
                        </div>
                        <p>Don't have an account? <a href="Register.jsp" style="color: #FF851B;">Register</a></p>
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-warning btn-primary btn-custom w-50" >Sign in</button>
                            <button type="button" class="btn btn-warning btn-custom w-50" onclick="window.location.href='Register.jsp'">Sign Up</button>
                        </div>
                        <div class="text-center mt-3">
                            <a href="#" style="color: #001F3F;">Forgot your password?</a>
                        </div>
                    </form>
                </div>
                <div class="image-container">
                    <img src="./images/loginImage.jpg" alt="Secure Online Banking">
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   
  
</body>

</html>