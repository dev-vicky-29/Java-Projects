<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    int clientId = Integer.parseInt(request.getParameter("clientId"));
    int packageId = Integer.parseInt(request.getParameter("packageId"));
%>

<div class="container mt-4">
    <h2 class="text-center">Payment Options</h2>
    <form action="process_payment.jsp" method="post">
        <input type="hidden" name="clientId" value="<%= clientId %>">
        <input type="hidden" name="packageId" value="<%= packageId %>">

        <div class="form-group">
            <label>Select Payment Method:</label>
            <select class="form-control" name="paymentMode" id="paymentMode" onchange="togglePaymentFields()">
                
                <option value="Cash">Cash</option>
                <option value="UPI">UPI</option>
                <option value="Card">Credit/Debit Card</option>
                
            </select>
        </div>

        <div id="upiFields" style="display: none;">
            <label>UPI ID:</label>
            <input type="text" name="upiId" class="form-control" required>
        </div>

        <div id="cardFields" style="display: none;">
            <label>Card Number:</label>
            <input type="text" name="cardNumber" class="form-control" required>
            <label>Expiry Date:</label>
            <input type="text" name="expiryDate" class="form-control" required>
            <label>CVV:</label>
            <input type="password" name="cvv" class="form-control" required>
        </div>
		 <div class="text-center d-grid gap-2 pt-5">
        <button type="submit" class="btn btn-primary">Proceed to Payment</button>
        </div>
    </form>
</div>

<script>
function togglePaymentFields() {
    let mode = document.getElementById("paymentMode").value;
    
    // Get UPI and Card fields
    let upiFields = document.getElementById("upiFields");
    let cardFields = document.getElementById("cardFields");
    let upiInput = document.querySelector("input[name='upiId']");
    let cardInputs = document.querySelectorAll("input[name='cardNumber'], input[name='expiryDate'], input[name='cvv']");

    // Hide both initially
    upiFields.style.display = "none";
    cardFields.style.display = "none";
    upiInput.required = false; // Remove required attribute
    cardInputs.forEach(input => input.required = false); // Remove required attribute

    // Show only selected payment method fields and set required attribute
    if (mode === "UPI") {
        upiFields.style.display = "block";
        upiInput.required = true;
    } else if (mode === "Card") {
        cardFields.style.display = "block";
        cardInputs.forEach(input => input.required = true);
    }
}

</script>

<%@ include file="../footer.jsp" %>
