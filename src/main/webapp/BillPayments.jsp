<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Payment & Recharge</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 50px; }
        .card { box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        .nav-tabs .nav-link { font-size: 18px; }
        .btn-primary { background-color: #001f3f; border: none; }
        .btn-primary:hover { background-color: #ff851b; }
    </style>
</head>
<body>
    <%Boolean success = (Boolean) request.getAttribute("paymentSuccess"); %>
    
    <div class = "modal fade show" id="paymentModal" tabindex = "-1" arial-labelledby="paymentModalLabel" aria-hidden="true" style="display:block;">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentModalLabel">Payment Status</h5>
                </div>
                <div class="modal-body">
                    <% if (success != null && success) { %>
                        <h4 class="text-success">✅ Payment Successful!</h4>
                        <p>Your bill payment was processed successfully.</p>
                    <% } else { %>
                        <h4 class="text-danger">❌ Payment Failed!</h4>
                        <p>There was an issue with your payment. Please try again.</p>
                    <% } %>
                </div>
                <div class="modal-footer">
                    <a href="dashboard.jsp" class="btn btn-home">🏠 Go to Home</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="card p-4">
            <ul class="nav nav-tabs" id="paymentTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="bill-tab" data-bs-toggle="tab" data-bs-target="#bill" type="button">Bill Payment</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="recharge-tab" data-bs-toggle="tab" data-bs-target="#recharge" type="button">Recharge</button>
                </li>
            </ul>
            <div class="tab-content mt-4" id="paymentTabsContent">
                <!-- Bill Payment Tab -->
                <div class="tab-pane fade show active" id="bill" role="tabpanel">
                    <form action="BillController" method="post">
                        <div class="mb-3">
                            <label for="biller" class="form-label">Biller Name</label>
                            <input type="text" class="form-control" id="biller" placeholder="Enter Biller Name">
                        </div>
                        <div class="mb-3">
                            <label for="type" class="form-label">Electricity Type</label>
                            <select class="form-control" id="type">
                                <option>Internet</option>
                                <option>Electricity</option>
                                <option>Gas</option>
                                <option>Water</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="amount" class="form-label">Amount</label>
                            <input type="number" class="form-control" id="amount" placeholder="Enter Amount">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Pay Bill</button>
                    </form>
                </div>
                
                <!-- Recharge Tab -->
                <div class="tab-pane fade" id="recharge" role="tabpanel">
                    <form action="RechargeController" method="post">
                        <div class="mb-3">
                            <label for="rechargeType" class="form-label">Recharge Type</label>
                            <select class="form-control" id="rechargeType">
                                <option>Mobile Recharge</option>
                                <option>DTH</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Mobile/DTH Number</label>
                            <input type="text" class="form-control" id="phone" placeholder="Enter Number">
                        </div>
                        <div class="mb-3">
                            <label for="rechargeAmount" class="form-label">Amount</label>
                            <input type="number" class="form-control" id="rechargeAmount" placeholder="Enter Amount">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Recharge</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
         setTimeout(()=>{
        	 document.getElementById()
         })
    </script>
</body>
</html>
