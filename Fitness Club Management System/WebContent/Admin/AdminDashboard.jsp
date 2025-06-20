<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    
int totalTrainers = 0, totalClients = 0, totalSubscriptions = 0, totalLiveClasses = 0;

ResultSet rs = db.getRows("SELECT COUNT(*) FROM trainer");
if (rs.next()) {
    totalTrainers = rs.getInt(1);
}

rs = db.getRows("SELECT COUNT(*) FROM client");
if (rs.next()) {
    totalClients = rs.getInt(1);
}

rs = db.getRows("SELECT COUNT(*) FROM subscriptions WHERE PaymentStatus='Approved'");
if (rs.next()) {
    totalSubscriptions = rs.getInt(1);
}

rs = db.getRows("SELECT COUNT(*) FROM live_classes WHERE status='Ongoing'");
if (rs.next()) {
    totalLiveClasses = rs.getInt(1);
}
%>

<div class="container mt-4">
    <h2 class="text-center mb-4">Admin Dashboard</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Trainers</h5>
                    <p class="card-text"><%= totalTrainers %></p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Clients</h5>
                    <p class="card-text"><%= totalClients %></p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Active Subscriptions</h5>
                    <p class="card-text"><%= totalSubscriptions %></p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3">
                <div class="card-body">
                    <h5 class="card-title">Live Classes</h5>
                    <p class="card-text"><%= totalLiveClasses %></p>
                </div>
            </div>
        </div>
    </div>
    
    <h3 class="mt-4">Recent Subscriptions</h3>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Client Name</th>
                <th>Package Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% ResultSet rs1 = db.getRows("SELECT c.Name, f.PackageName, s.StartDate, s.EndDate, s.PaymentStatus FROM subscriptions s JOIN client c ON s.ClientID = c.IdClient JOIN fitness_packages f ON s.PackageID = f.PackageID ORDER BY s.StartDate DESC LIMIT 5");
                while (rs1.next()) { %>
                <tr>
                    <td><%= rs1.getString("Name") %></td>
                    <td><%= rs1.getString("PackageName") %></td>
                    <td><%= rs1.getString("StartDate") %></td>
                    <td><%= rs1.getString("EndDate") %></td>
                    <td><%= rs1.getString("PaymentStatus") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <h3 class="mt-4">Upcoming Live Classes</h3>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Trainer</th>
                <th>Scheduled Time</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% ResultSet rs2 = db.getRows("SELECT l.title, t.Name, l.scheduled_time, l.status FROM live_classes l JOIN trainer t ON l.trainer_email = t.Email WHERE l.status='Incoming' ORDER BY l.scheduled_time ASC LIMIT 5");
                while (rs2.next()) { %>
                <tr>
                    <td><%= rs2.getString("title") %></td>
                    <td><%= rs2.getString("Name") %></td>
                    <td><%= rs2.getString("scheduled_time") %></td>
                    <td><%= rs2.getString("status") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
