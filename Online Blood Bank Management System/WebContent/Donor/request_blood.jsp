<%@page import="java.sql.*"%>
<%@ include file="../header.jsp" %>

<%
    String requesterName = "";
    String userType = (String) session.getAttribute("type");
    String userEmail = (String) session.getAttribute("mail");

    if (userEmail != null) {
        if ("Requester".equalsIgnoreCase(userType) || "Donor".equalsIgnoreCase(userType)) {
            // Query database to fetch full name dynamically for the logged-in user
            ResultSet rs = db.getRows("SELECT name FROM donors WHERE email = ?", userEmail);
            if (rs != null && rs.next()) {
                requesterName = rs.getString("name");
            }
        }
    }

    String bloodGroup = "", purpose = "", urgency = "", contactInfo = "", bloodLocation = "";
    int quantity = 0;

    if (request.getParameter("btnRequestBlood") != null) {
        requesterName = request.getParameter("requesterName");
        userType = request.getParameter("userType");
        bloodGroup = request.getParameter("bloodGroup");
        purpose = request.getParameter("purpose");
        urgency = request.getParameter("urgency");
        contactInfo = request.getParameter("txtContactInfo");
        bloodLocation = request.getParameter("txtBloodLocation");

        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {
            errorMsg = "Invalid quantity entered.";
        }

        if (quantity > 0) {
            // Insert request into database
            db.executeSql(
                "INSERT INTO BloodRequests (RequesterName, UserType, BloodGroup, Quantity, Purpose, Urgency, Contact, Location, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                requesterName, userType, bloodGroup, quantity, purpose, urgency, contactInfo, bloodLocation, "Pending"
            );
            successMsg = "Blood request submitted successfully!";
        } else {
            errorMsg = "Please provide a valid quantity.";
        }
    }
%>

<div class="container col-5 mt-5">
    <div class="card">
        <div class="card-header bg-primary text-center text-white">
            <h4>Request Blood</h4>
        </div>
        <div class="card-body">
            <form method="post">
                <!-- Requester Name -->
                <div class="form-group">
                    <label for="requesterName">Requester Name</label>
                    <input type="text" name="requesterName" id="requesterName" class="form-control"
                        value="<%= requesterName %>"
                        <%= (userType != null && !"Visitor".equals(userType)) ? "readonly" : "" %> required>
                </div>

                <!-- User Type -->
                <div class="form-group">
                    <label for="userType">User</label>
                    <select name="userType" id="userType" class="form-select" required>
                        <option value="Visitor" <%= (userType == null || "Visitor".equals(userType)) ? "selected" : "" %>>Visitor</option>
                        <option value="Donor" <%= "Donor".equals(userType) ? "selected" : "" %>>Donor</option>
                        <option value="Requester" <%= "Requester".equals(userType) ? "selected" : "" %>>Requester</option>
                        <option value="Hospital" <%= "Hospital".equals(userType) ? "selected" : "" %>>Hospital</option>
                    </select>
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
                    <label for="txtContactInfo">Contact Info</label>
                    <input name="txtContactInfo" class="form-control" placeholder="Enter Contact Number" pattern="[0-9]{10}" required />
                    <div class="form-text">Must be a 10-digit number.</div>
                </div>
                <!-- Blood Location -->
                <div class="form-group">
                    <label for="txtBloodLocation"> Location</label>
                    <input type="text" class="form-control" id="txtBloodLocation" name="txtBloodLocation" placeholder="Enter Location Where You Need Blood" required>
                </div>

                <!-- Submit -->
                <div class="form-group text-center d-grid gap-2 mt-3">
                    <button type="submit" name="btnRequestBlood" class="btn btn-primary btn-block">Submit Request</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
