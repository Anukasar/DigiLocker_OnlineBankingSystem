<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Document</title>
    <style>
          body{
            background-color: #f2f2f2;
          }
          .navbar{
            background-color: #001f3f;
          }
          .navbar-brand{
            font-weight: bold;
            color: white;
        }
        .navbar-brand span{
            color: ff851b;
        }
        .nav-link{
            color: white !important;
        }
        .container1{
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }
        .btn-primary{
            background-color: #001f3f;
            border: none;
        }
        .btn-primary:hover{
            background-color: #ff851b;
        }
        .dot{
           color: #FF851B;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a href="#" class="navbar-brand">DigiLocker<span class = "dot">.</span></a>
           <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Dashboard</a></li>
                </ul>
           </div>
        </div>
    </nav>
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="container p-4 shadow-lg rounded bg-white" style="max-width: 450px;">
            <h2 class="text-center mb-4">Transfer Money</h2>

            <% String successMessage = (String) request.getAttribute("successMessage");%>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>

            <% if (successMessage != null) { %>
                <div class="alert alert-success" role="alert"><%= successMessage %></div>
            <% } %>

            <% if (errorMessage != null) { %>
                <div class="alert alert-danger" role="alert"><%= errorMessage %></div>
            <% } %>

            <form action="TransferController" method="post">
                <div class="mb-3">
                     <label class="form-label">Sender Account Number</label>
                     <input type="text" class="form-control" name="senderAccount" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Receiver Account Number:</label>
                    <input type="text" class="form-control" name="receiverAccount" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Amount:</label>
                    <input type="number" class="form-control" name="transferAmount" required>
                </div>
                
                <button type="submit" class="btn btn-primary w-100">Transfer</button>
                
				<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				            <div class="modal-header bg-success text-white">
				                <h5 class="modal-title" id="successModalLabel">Transfer Successful</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body text-center">
				                <p>Your money transfer was successful! 🎉</p>
				                <button class="btn btn-primary" onclick="window.location.href='Dashboard.jsp'">Back to Home</button>
				            </div>
				        </div>
				    </div>
				</div>

            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
	    window.onload = function() {
	        var successFlag = "<%= request.getAttribute("success") %>";
	        if (successFlag === "true") {
	            var successModal = new bootstrap.Modal(document.getElementById('successModal'));
	            successModal.show();
	        }
	    };
	</script>
</body>
</html>