<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Order Animal feed Related Page -->



 
 <%

if(request.getParameter("btnsubmit")!=null) 
{
 String Date=request.getParameter("txtdate");
 String aFeed=request.getParameter("txtfeedname");
 String Name=request.getParameter("txtname");
 String sUserName = session.getAttribute("mail")+"";

 
 
 db.executeSql("Insert into orderfeed ( Date, FeedName, UserName, EmailID) values(?,?,?,?)", Date,aFeed,Name,sUserName);
 successMsg="Your Order Placed Successfully";
 redirectUrlSuccess="/Dairy_Management_System/supplier/orderfeed.jsp";
}

%>
<br><br>
					<div class="container">
					<div class="col-7 offset-3">
                    <form  method="post" id="form1" class="form custom-border mt-8 rounded">
                    <h2 class="text-center">Order Animal Feed</h2>
                        <div class="mb-3">
                            <label for="date" class="form-label">Date</label>
                            <input type="date" class="form-control" id="txtdate" name="txtdate" required>
                        </div>
                       
                        <div class="form-group">
                    <label for="userName">Feed Name:</label>
                    <select class="form-control" id="txtfeedname" name="txtfeedname" required>
                        <option value="">Select Animal Feed</option>
                        <%
                        ResultSet rs = db.getRows("select * from animalfeed");
                        while (rs.next()) { %>
                            <option value="<%= rs.getString(2) %>"><%= rs.getString(2) %></option>
                        <% } %>
                    </select>
                </div>
                         <div class="mb-3">
                            <label for="email" class="form-label">Name</label>
                            <input type="text" class="form-control" id="txtname" name="txtname" placeholder="Enter Your Name" required>
                        </div>
                         <div class="text-center d-grid gap-2">
                        <input type="submit" name="btnsubmit" value="Send Order" class="btn btn-primary"/>
                        </div>
                    </form>
               </div>
               </div>
<br><br><br>
       


<%@ include file="../footer.jsp"%>