<%@page import="java.sql.*"%>
<%@ include file="../header.jsp"%>


<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/Online_Blood_Bank_Management_System/Admin/event_List.jsp">Event List</a>
</div>

<div class="container mt-5">
    <h2 class="text-center text-success mb-4">Blood Donation Events</h2>
    <div class="row" >
        
        <%
        ResultSet rs = db.getRows("SELECT * FROM Events Where Status='ACTIVE' ");
        if (rs != null) {
        while (rs.next()) {
    %>
            
            <div class="col-md-4 mb-4"  >
                <div class="card" >
                    <img src="/Online_Blood_Bank_Management_System/EventImages/<%= rs.getString(7) %>" class="card-img-top" style="max-height: 400px;" alt="Event Banner">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString(2) %></h5>
                        <p class="card-text">
                            <strong>Date:</strong> <%= rs.getString(3) %><br>
                            <strong>Time:</strong> <%= rs.getString(4) %><br>
                            <strong>Location:</strong> <%= rs.getString(5) %><br>
                            <strong>Description:</strong> <%= rs.getString(6) %><br>
                            <strong>Status:</strong> <span class="<%= rs.getString(8).equals("ENDED") ? "text-danger" : "text-success" %>">
                                <%= rs.getString("status") %>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <div class="col-12 text-center">
                <p>No events to display.</p>
            </div>
        <%
            }
        %>
    </div>
    
    <br>
    <h2 class="text-center text-danger mb-4 text-decoration-underline">Ended Blood Donation Events </h2>
    
			  <div class="row row-cols-1 row-cols-md-3 g-4">
			  
			   <%
        ResultSet re = db.getRows("SELECT * FROM Events Where Status='ENDED' ");
        //if (rs != null) {
        while (re.next()) {
    %>
			    <div class="col">
			    <div class="card mb-3" style="max-width: 540px;">
			    <div class="row g-0">
			    <div class="col-md-4">
			      <img src="/Online_Blood_Bank_Management_System/EventImages/<%= re.getString(7) %>" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			      <h5 class="card-title"><%= re.getString(2) %></h5>
			       <p class="card-text">
                            <strong>Date:</strong> <%= re.getString(3) %><br>
                            <strong>Time:</strong> <%= re.getString(4) %><br>
                            <strong>Location:</strong> <%= re.getString(5) %><br>
                            <!-- <strong>Description:</strong> <%-- re.getString(6) --%>  <br>  --> 
                            <strong>Status:</strong> <span class="<%= re.getString(8).equals("ENDED") ? "text-danger" : "text-success" %>">
                                <%= re.getString(8) %>
                            </span>
                        </p>
			      </div>
			    </div>
			    </div>
			    </div>
			     </div>
			    <%
                }
            //} else {
        %>
			 
			  
			</div>
</div>

<%@ include file="../footer.jsp"%>
