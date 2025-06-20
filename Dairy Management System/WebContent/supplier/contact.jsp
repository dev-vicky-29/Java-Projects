<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!--index page specific content--> 
<!-- Top Section with Image
    <div class="container-fluid p-0">
        <img src="img/carousel-2.jpg" alt="Header Image" class="img-fluid">
    </div>
 -->
    <!-- Main Content Section -->
    <div class="container mt-5">
        <div class="row">
            <!-- Contact Details (Bottom Left) -->
            <div class="col-md-6">
                <div class="contact-details">
                    <h2>Contact Details</h2>
                    <p><strong>Our Address:</strong></p>
                    <p>At Post Koparde Haveli,<br>Tal-Karad Dist-Satara <br> Pin: 412803</p>
                    <p><strong>Email:</strong> sidhnathdairyfarm@gmail.com</p>
                    <p><strong>Phone:</strong> +91 7276942909</p>
                </div>
            </div>
            <!-- Contact Form (Bottom Right) -->
 
            <div class="col-md-6">
                <div class="contact-form">
                    <h2>FeedBack</h2>
                    <%

if(request.getParameter("btnsubmit")!=null) 
{
 String email=request.getParameter("txtemail");
 String feedback=request.getParameter("txtfeedback");
 Date dt = new Date(); //Current date and time
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String fdate=sdf.format(dt);
 
 db.executeSql("Insert into Feedback (FeedbackDateTime,EmailID,FeedbackText) values(?,?,?)", fdate,email,feedback);
 successMsg="Thanks for your Feedback!";
 redirectUrlSuccess="/Dairy_Management_System/supplier/contact.jsp";
}

%>
                    <form  method="post" id="form1">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="txtemail" name="txtemail" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Write a Message</label>
                            <textarea class="form-control" id="txtfeedback" name="txtfeedback" rows="5" required></textarea>
                        </div>
                        <input type="submit" name="btnsubmit" value="Submit" class="btn btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
<br><br><br>
       

    <!-- Latest Bootstrap JS (optional, if you need JavaScript functionality) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<%@ include file="../footer.jsp"%>

<script>
 $(function(){
 $("#form1").validate({
  rules:{
   txtemail:{
    required:true,
    email:true
   },
   txtfeedback:{
    required:true
   }
  },
  messages:{
   txtemail:{
    required:"EmailID is required",
    email:"Invalid Email ID"
   },
   txtfeedback:{
    required:"Feedback is required"
   }
  }
  
 }); 
 });
 
 </script>
 
