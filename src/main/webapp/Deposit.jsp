<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Money</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #F2F2F2; }
        .navbar { background-color: #001F3F; }
        .navbar-brand { font-weight: bold; color: white; }
        .navbar-brand span { color: #FF851B; }
        .nav-link { color: white !important; }
        .container1 { max-width: 500px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0px 4px 10px rgba(0,0,0,0.1); }
        .btn-primary { background-color: #001F3F; border: none; }
        .btn-primary:hover { background-color: #FF851B; }
    </style>
</head>
<body>
      
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">MyBank<span>.</span></a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="container p-4 shadow-lg rounded bg-white" style="max-width: 450px;">
            <h2 class="text-center mb-4">Deposit Money</h2>
            
            <% String successMessage = (String) request.getAttribute("successMessage"); %>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>

            <% if (successMessage != null) { %>
                <div class="alert alert-success" role="alert">
                    <%= successMessage %>
                </div>
            <% } %>

            <% if (errorMessage != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= errorMessage %>
                </div>
            <% } %>

            <form action="depositController" method="post">
                <div class="mb-3">
                    <label class="form-label">Account Number:</label>
                    <input type="text" class="form-control" name="accountNumber" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Amount:</label>
                    <input type="number" class="form-control" name="amount" required>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="termsCheck" required>
                    <label class="form-check-label" for="termsCheck">
                        I agree to the <a href="#">terms and conditions</a>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Deposit</button>
                <a href="Dashboard.jsp" class="btn btn-secondary w-100 mt-2">Back to Home</a>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
