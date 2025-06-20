<%@page import="java.sql.*"%>
<%@ include file="header.jsp" %>

<%
    // Check session user type
    String userType = (String) session.getAttribute("type");
    String message = "";

    // Check if user is logged in
    if (userType == null || userType.equals("Visitor")) {
        message = "If you sign up, you can track your request. As a visitor, this is not possible.";
    } else {
        message = "You are logged in! You can track your request.";
    }
%>

<!-- Display the message -->
<h1 class="text-center mt-4">
    <%= message %>
</h1>

<div class="container col-5 mt-5">
    <div class="card">
        <div class="card-header bg-primary text-center text-white">
            <h4>Request Blood</h4>
        </div>
        <div class="card-body">
            <form  method="post">
                <!-- Requester Name -->
                <div class="form-group">
                    <label for="requesterName">Requester Name</label>
                    <input type="text" name="requesterName" id="requesterName" class="form-control" 
                           value="<%= session.getAttribute("user") != null ? session.getAttribute("user") : "" %>" 
                           <%= userType != null && !userType.equals("Visitor") ? "readonly" : "" %> required>
                </div>

                <!-- User Type -->
                <div class="form-group">
                    <label for="userType">User</label>
                    <input type="text" name="userType" id="userType" class="form-control" 
                           value="<%= userType != null ? userType : "Visitor" %>" readonly>
                </div>

                <!-- Blood Group -->
                <div class="form-group">
                    <label for="bloodGroup">Blood Group</label>
                    <select name="bloodGroup" id="bloodGroup" class="form-select" required>
                        <option value="">Select Blood Group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>

                <!-- Quantity (in Units) -->
                <div class="form-group">
                    <label for="quantity">Quantity (In Units)</label>
                    <input type="number" name="quantity" id="quantity" class="form-control" min="1" required>
                </div>

                <!-- Purpose -->
                <div class="form-group">
                    <label for="purpose">Purpose</label>
                    <select name="purpose" id="purpose" class="form-select" required>
                        <option value="">Select Purpose</option>
                        <option value="Surgery">Surgery</option>
                        <option value="Emergency">Emergency</option>
                        <option value="Accident">Accident</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <!-- Urgency Level -->
                <div class="form-group">
                    <label for="urgency">Urgency Level</label>
                    <select name="urgency" id="urgency" class="form-select" required>
                        <option value="">Select Urgency Level</option>
                        <option value="Urgent">Urgent</option>
                        <option value="Normal">Normal</option>
                    </select>
                </div>
                
                <!-- Contact Info -->
            <div class="form-group">
                Contact Info
                <input name="txtContactInfo" class="form-control" placeholder="Enter Contact Number" pattern="[0-9]{10}" required />
                <div class="form-text">Must be a 10-digit number.</div>
            </div>
             <!-- Blood Location -->
                <div class="form-group">
                    <label for="txtBloodLocation"> Location</label>
                    <input type="text" class="form-control" id="txtBloodLocation" name="txtBloodLocation" placeholder="Enter Location Where You Need Blood" required>
                </div>

                <!-- Submit Button -->
                <div class="form-group text-center d-grid gap-2 mt-3">
                    <button type="submit" name="btnRequestBlood" class="btn btn-primary btn-block">Submit Request</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
