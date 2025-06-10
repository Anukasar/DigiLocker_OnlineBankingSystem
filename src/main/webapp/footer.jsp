<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
.custom-footer {
    bottom: 0;
    width: 100%;
    position: relative;
    background-color: #2c272eed;
    color: white;
    padding: 40px 0 20px;
}

.custom-footer .row {
    width: 100%;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: center;
    align-content: center;
}

.custom-footer .col {
    flex-basis: 25%;
    flex-direction: column;
}

.custom-footer ul li {
    list-style: none;
}

.custom-footer ul li a {
    text-decoration: none;
}

.custom-footer h4 {
    text-decoration: underline;
    text-decoration-thickness: 1px;
    color: #ff4d29;
}

.custom-footer i {
    color: white;
    font-weight: lighter;
}

.custom-footer i:hover {
    color: rgb(255, 77, 41);
}

</style>
<footer class = "custom-footer">
    <div class="row">
        <div class="col">
            <h4>Address</h4>
            <p>X road, Near Bus Stand</p>
            <p>New Delhi, 782XXXXXX</p>
            <p>+91 666-333-1111</p>
        </div>  
        <div class="col">
            <h4>Services</h4>
            <p>Money Transfer</p>
            <p>Account Management</p>
            <p>Saving Account</p>
            <p>Current Account</p>
            <p>Personal Loan</p>
        </div>
        <div class="col">
            <h4>Follow me on</h4>
            <ul>
                <li><a href="#"><i class="fab fa-facebook-square"></i> Facebook</a></li>
                <li><a href="#"><i class="fab fa-instagram-square"></i> Instagram</a></li>
                <li><a href="#"><i class="fab fa-twitter-square"></i> Twitter</a></li>
            </ul>
        </div>
        <div class="col">
            <h4>Links</h4>
            <ul>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Complaint Form</a></li>
            </ul>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <p>Copyright &copy; 2021 - All Rights Reserved</p>
        </div>
        <div class="col"></div>
    </div>
</footer>