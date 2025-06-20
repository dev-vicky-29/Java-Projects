<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.db.DataAccess"%>
<%@ include file="../header.jsp" %>
<%

String orderId = request.getParameter("id");
String mail = session.getAttribute("mail") + "";

// Order Details Fetch
ResultSet rs = db.getRows("SELECT * FROM Orders WHERE Id=?", orderId);
rs.next();
double orderTotal = rs.getDouble(4);
%>

    <script>
        function showPaymentField() {
            var method = document.getElementById("paymentMethod").value;
            var upiField = document.getElementById("upiField");

            // Show UPI field only if UPI is selected
            if (method === "UPI") {
                upiField.style.display = "block";
            } else {
                upiField.style.display = "none";
            }
        }
    </script>
    <style>
        .checkout-box {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background: white;
        }
        .btn-success {
            width: 100%;
        }
    </style>


<div class="checkout-box">
    <h2 class="text-center">Checkout</h2>
    <p><strong>Order ID:</strong> <%= orderId %></p>
    <p><strong>Total Amount:</strong> Rs. <%= String.format("%.2f", orderTotal) %></p>

    <form action="updateorder.jsp" method="POST">
        <input type="hidden" name="id" value="<%= orderId %>">

        <label class="form-label">Select Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" class="form-select" onchange="showPaymentField()" required>
            <option value="" disabled selected>Select Payment Method</option>
            <option value="UPI">UPI</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Net Banking">Net Banking</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
        </select>

        <!-- UPI ID Field -->
        <div id="upiField" style="display: none; margin-top: 10px;">
            <label class="form-label">Enter UPI ID:</label>
            <input type="text" name="upiId" class="form-control" placeholder="example@upi">
        </div>

        <br>
        <button type="submit" class="btn btn-success">Make Payment</button>
    </form>
</div>

    <script>
        // Fetch values from URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        const orderId = urlParams.get('id');
        const orderTotal = urlParams.get('total');
        
        document.getElementById('orderId').textContent = orderId;
        document.getElementById('orderTotal').textContent = orderTotal;
        document.getElementById('orderInput').value = orderId;

        document.getElementById('paymentMethod').addEventListener('change', function() {
            let selectedMethod = this.value;
            let extraFields = document.getElementById('extraFields');
            let paymentLabel = document.getElementById('paymentLabel');
            let paymentDetails = document.getElementById('paymentDetails');
            
            if (selectedMethod === 'UPI') {
                extraFields.style.display = 'block';
                paymentLabel.textContent = 'Enter UPI ID:';
                paymentDetails.placeholder = 'example@upi';
            } else if (selectedMethod === 'Credit Card' || selectedMethod === 'Debit Card') {
                extraFields.style.display = 'block';
                paymentLabel.textContent = 'Enter Card Number:';
                paymentDetails.placeholder = 'xxxx-xxxx-xxxx-xxxx';
            } else {
                extraFields.style.display = 'none';
            }
        });
    </script>
<%@ include file="../footer.jsp" %>