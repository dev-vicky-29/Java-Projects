<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ include file="../header.jsp"%>

<%
if(request.getParameter("btnsubmit")!=null){
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String date=request.getParameter("date");
    String cakeType=request.getParameter("cakeType");
    String extra=request.getParameter("extra");
    String address=request.getParameter("address");
    String user=session.getAttribute("mail")+"";

    
        db.executeSql("INSERT INTO CakeOrders (name, email, mobile, date, cakeType, extra, address, UserName) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", name,email,mobile,date,cakeType,extra,address,user); 
       
        successMsg="Your Order has been sent successfully!";
        // Redirect to another page to prevent resubmission
        redirectUrlSuccess="/Online_Cake_Shop/Customer/BookCake.jsp";
        }
%>


   <div class="container">
   <div class="col-7 offset-3">
        <h2 class="mt-5 text-center text-primary">Cake Delight - Book a Cake</h2><hr>
        
        <form  method="post">
            <div class="form-group">
                <label for="name">Your Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Enter Email ID:</label>
                <input type="email" class="form-control" id="email" value="<%=session.getAttribute("mail") %>" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="mobile">Enter Mobile Number:</label>
                <input type="text" class="form-control" id="mobile" name="mobile" required>
            </div>
            
             <div class="form-group">
                <label for="date">Select Date When You Want Cake:</label>
                <input type="date" class="form-control" id="date" name="date" required>
            </div>
            
            <div class="form-group">
                <label for="cakeType">Select Type of Cake:</label>
                <select class="form-control" id="cakeType" name="cakeType" required>
                    <option value="Birthday Cake">Birthday Cake</option>
                    <option value="Anniversary Cake">Anniversary Cake</option>
                    <option value="Custom Cake">Custom Cake</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="extra">Some Extra About Cake:</label>
                 <textarea  class="form-control" id="extra" name="extra" rows="3" cols="50" required></textarea>
               
            </div>
            
            <div class="form-group">
                <label for="address">Enter Your Address:</label>
               
                 <textarea class="form-control" id="address" name="address" rows="4" cols="50" required></textarea>
            </div>
            <br><hr><br>
             <div class="text-center d-grid gap-2">
            <button type="submit" name="btnsubmit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
     <h2 class="mt-5 text-center text-warning">Note: "Payment Method - Cash On Delivery"</h2>
    </div>
<%@ include file="../footer.jsp"%>