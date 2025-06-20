<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("btn1")!=null){
    String s=request.getParameter("type");
    if(s.equals("COD")){
        session.setAttribute("data",s);
        response.sendRedirect("/Online_Fertilizer_Shop/Customer/checkout1.jsp");
    }else if(s.equals("GPay") || s.equals("PhonePe")){
        String t1=request.getParameter("t1");
        if(t1 == null || t1.trim().isEmpty()){
            // Error handling: UPI ID is required for GPay/PhonePe
            out.println("<script>alert('Please enter UPI ID');</script>");
        } else {
            s = s + ";" + t1;
            session.setAttribute("data", s);
            response.sendRedirect("/Online_Fertilizer_Shop/customer/checkout1.jsp");
        }
    }else if(s.equals("Paypal") || s.equals("Master Card") || s.equals("Visa Card")){
        String t1=request.getParameter("t1");
        String t2=request.getParameter("t2");
        String t3=request.getParameter("t3");
        String t4=request.getParameter("t4");
        if(t1 == null || t1.trim().isEmpty() || t2 == null || t2.trim().isEmpty() ||
           t3 == null || t3.trim().isEmpty() || t4 == null || t4.trim().isEmpty()){
            // Error handling: All fields are required for Credit Cards/Paypal
            out.println("<script>alert('Please fill in all credit card details');</script>");
        } else {
            s = s + ";" + t1 + ";" + t2 + ";" + t3 + ";" + t4;
            session.setAttribute("data", s);
            response.sendRedirect("/Online_Fertilizer_Shop/Customer/checkout1.jsp");
        }
    }
}
%>

<div class="col-7 offset-2">
<br/>
<h3>Payment::</h3>
<div class="row row-cols-5 g-4">
    <div class="col">
        <img src="/Online_Fertilizer_Shop/img/payment/paypal.png" alt="NA" width="80%" height="70%"/>
    </div>
    <div class="col">
        <img src="/Online_Fertilizer_Shop/img/payment/mastercard.png" alt="NA"  width="80%" height="70%"/>
    </div>
    <div class="col">
        <img src="/Online_Fertilizer_Shop/img/payment/visacard.jpeg" alt="NA" width="80%" height="70%"/>
    </div>
    <div class="col">
        <img src="/Online_Fertilizer_Shop/img/payment/gpay.png" alt="NA" width="80%" height="70%"/>
    </div>
    <div class="col">
        <img src="/Online_Fertilizer_Shop/img/payment/phonepe.png" alt="NA" width="80%" height="70%"/>
    </div>
</div>

<form name="form1" method="post" onsubmit="return validateForm();">
    <div class="form-group">
        <label for="s1">Payment Method</label>
        <select name="type" class="form-select" id="s1">
            <option value="">-- Select --</option>
            <option value="Paypal">Paypal</option>
            <option value="Master Card">Master Card</option>
            <option value="Visa Card">Visa Card</option>
            <option value="GPay">Google Pay</option>
            <option value="PhonePe">PhonePe</option>
            <option value="COD">Cash On Delivery</option>
        </select>
    </div>

    <div class="form-group" id="f1">
        <label id="l1">UPI ID</label>
        <input id="t1" name="t1" class="form-control"/>
    </div>
    <div class="form-group" id="f2">
        <label id="l2">Card Holder Name</label>
        <input id="t2" name="t2" class="form-control"/>
    </div>
    <div class="form-group" id="f3">
        <label id="l3">Expiry Date</label>
        <input id="t3" name="t3" class="form-control"/>
    </div>
    <div class="form-group" id="f4">
        <label id="l4">CVV</label>
        <input id="t4" name="t4" class="form-control"/>
    </div>
    <br/>
    <input id="btn1" name="btn1" type="submit" class="btn btn-primary" value="Proceed"/>
</form>
</div>

<%@ include file="../footer.jsp"%>

<script>
$(function(){
    var hideAll = function(){
        $("#f1").hide();
        $("#f2").hide();
        $("#f3").hide();
        $("#f4").hide();
        $("#btn1").hide();
    };
    hideAll();

    $("#s1").change(function(){
        let s = $(this).val();
        if(s === "COD"){
            hideAll();
            $("#btn1").show();
        } else if(s === "GPay" || s === "PhonePe"){
            hideAll();
            $("#l1").text("UPI ID");
            $("#f1").show();
            $("#btn1").show();
        } else if(s === "Paypal" || s === "Master Card" || s === "Visa Card"){
            $("#l1").text("Credit Card");
            $("#l2").text("Holder Name");
            $("#l3").text("Expiry Date");
            $("#l4").text("CVV");
            $("#f1").show();
            $("#f2").show();
            $("#f3").show();
            $("#f4").show();
            $("#btn1").show();
        } else {
            hideAll();
        }
    });
});

function validateForm(){
    var paymentMethod = document.forms["form1"]["type"].value;
    if(paymentMethod === "") {
        alert("Please select a payment method.");
        return false;
    }

    if(paymentMethod === "COD") {
        return true;
    }

    if(paymentMethod === "GPay" || paymentMethod === "PhonePe") {
        var upiId = document.forms["form1"]["t1"].value;
        if(upiId == "") {
            alert("Please enter UPI ID.");
            return false;
        }
    }

    if(paymentMethod === "Paypal" || paymentMethod === "Master Card" || paymentMethod === "Visa Card") {
        var cardNumber = document.forms["form1"]["t1"].value;
        var cardHolderName = document.forms["form1"]["t2"].value;
        var expiryDate = document.forms["form1"]["t3"].value;
        var cvv = document.forms["form1"]["t4"].value;
        
        if(cardNumber == "" || cardHolderName == "" || expiryDate == "" || cvv == "") {
            alert("Please fill in all credit card details.");
            return false;
        }
    }
    return true;
}
</script>
