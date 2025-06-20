<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%

if(request.getParameter("btnsubmit") != null) {
    String name = request.getParameter("txtname").trim();
    String email = request.getParameter("txtemail").trim();
    String mob = request.getParameter("txtmob").trim();
    String review = request.getParameter("txtreview");
    String feedback = request.getParameter("txtfeedback").trim();
    Date dt = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String fdate = sdf.format(dt);

    // Server-side validation
    boolean isValid = true;

    if(name.isEmpty() || name.length() < 2) {
        isValid = false;
        msg = "Please enter a valid name (min 2 characters).";
    } else if(email.isEmpty() || !email.matches("^[\\w.-]+@[\\w.-]+\\.\\w{2,}$")) {
        isValid = false;
        msg = "Please enter a valid email address.";
    } else if(!mob.matches("^\\d{10}$") || mob.equals("0000000000")) {
        isValid = false;
        msg = "Please enter a valid 10-digit mobile number.";
    } else if(feedback.isEmpty()) {
        isValid = false;
        msg = "Please enter your feedback.";
    }

    if(isValid) {
        db.executeSql("Insert into Feedback (FeedbackDateTime,Name,EmailID,MobileNo,Review,FeedbackText) values(?,?,?,?,?,?)",
                      fdate, name, email, mob, review, feedback);
        msg = "Thanks for your feedback!";
    }
}
%>

<!-- CSS and Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/feedback.css">

<section>
    <h1>Feedback</h1>
    <h2>Your Feedback Is Important For Us</h2>

    <% if(!successMsg.equals("")) { %>
        <div style="color: green; font-weight: bold;"><%= msg %></div>
    <% } else if(!errorMsg.equals("")) { %>
        <div style="color: red; font-weight: bold;"><%= msg %></div>
    <% } %>

    <div class="form-bo">
        <div class="textup">
            <i class="fa fa-solid fa-clock"></i> It only takes two minutes!!
        </div>
        <form id="form1" method="post">
            <label for="uname">
                <i class="fa fa-solid fa-user"></i> Name
            </label>
            <input type="text" id="uname" name="txtname" placeholder="Enter Your Name" required>

            <label for="email">
                <i class="fa fa-solid fa-envelope"></i> Email Address
            </label>
            <input type="email" id="email" name="txtemail" placeholder="Enter Your Email Address" required>

            <label for="phone">
                <i class="fa-solid fa-phone"></i> Phone No
            </label>
            <input type="tel" id="phone" name="txtmob" placeholder="Enter Your Mobile Number" required>

            <label>
                <i class="fa-solid fa-face-smile"></i> Do you satisfy with our service?
            </label>
            <div class="radio-group">
                <input type="radio" id="yes" name="txtreview" value="yes" checked>
                <label for="yes">Yes</label>
                <input type="radio" id="no" name="txtreview" value="no">
                <label for="no">No</label>
            </div>

            <label for="msg">
                <i class="fa-solid fa-comments" style="margin-right: 3px;"></i> Write your Suggestions:
            </label>
            <textarea id="msg" name="txtfeedback" rows="4" cols="10" placeholder="Enter Your Message" required></textarea>

            <button type="submit" name="btnsubmit">Submit</button>
        </form>
    </div>
</section>

<%@ include file="footer.jsp"%>

<!-- Scripts for Validation -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<script>
$(function(){
    // Custom rule: mobile number cannot be all zeros
    $.validator.addMethod("notAllZeros", function(value, element) {
        return this.optional(element) || !/^0{10}$/.test(value);
    }, "Mobile number cannot be all zeros");

    $("#form1").validate({
        rules:{
            txtname:{
                required:true,
                minlength:2,
                normalizer: function(value) {
                    return $.trim(value);
                }
            },
            txtemail:{
                required:true,
                email:true
            },
            txtmob:{
                required:true,
                digits:true,
                minlength:10,
                maxlength:10,
                notAllZeros:true
            },
            txtfeedback:{
                required:true
            }
        },
        messages:{
            txtname:{
                required:"Name is required",
                minlength:"Enter at least 2 characters"
            },
            txtemail:{
                required:"Email ID is required",
                email:"Invalid Email ID"
            },
            txtmob:{
                required:"Mobile number is required",
                digits:"Only digits allowed",
                minlength:"Enter 10 digit number",
                maxlength:"Enter 10 digit number",
                notAllZeros:"Mobile number cannot be all zeros"
            },
            txtfeedback:{
                required:"Feedback is required"
            }
        }
    });
});
</script>
