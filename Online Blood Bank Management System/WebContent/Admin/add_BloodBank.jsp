<%@ include file="../header.jsp" %>

<%
    String bankName = "", location = "", contact = "", email = "", managerName = "", description = "";

    if (request.getParameter("btnAddBloodBank") != null) {
        bankName = request.getParameter("txtBankName");
        location = request.getParameter("txtLocation");
        contact = request.getParameter("txtContact");
        email = request.getParameter("txtEmail");
        managerName = request.getParameter("txtManagerName");
        description = request.getParameter("txtDescription");

        // Insert into the database
        db.executeSql(
            "INSERT INTO BloodBanks (bank_name, location, contact, email, manager_name, description) VALUES (?, ?, ?, ?, ?, ?)",
            bankName, location, contact, email, managerName, description
        );
        successMsg = bankName + " Blood Bank Added Successfully!";
    }
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/Online_Blood_Bank_Management_System/Admin/BloodBank_List.jsp">Blood Bank List</a>
</div>

<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Blood Bank</h4>
    </div>
    <div class="card-body">
        <form id="FormBloodBank" action="" method="post">
            <!-- Bank Name -->
            <div class="form-group">
                <label for="txtBankName">Blood Bank Name</label>
                <input type="text" name="txtBankName" class="form-control" placeholder="Enter Blood Bank Name" required />
            </div>

            <!-- Location -->
            <div class="form-group">
                <label for="txtLocation">Location</label>
                <input type="text" name="txtLocation" class="form-control" placeholder="Enter Location" required />
            </div>

            <!-- Contact -->
            <div class="form-group">
                <label for="txtContact">Contact Number</label>
                <input type="text" name="txtContact" class="form-control" placeholder="Enter Contact Number" pattern="[0-9]{10}" required />
                <div class="form-text">Must be a 10-digit number.</div>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="txtEmail">Email Address</label>
                <input type="email" name="txtEmail" class="form-control" placeholder="Enter Email Address" required />
            </div>

            <!-- Manager Name -->
            <div class="form-group">
                <label for="txtManagerName">Manager Name</label>
                <input type="text" name="txtManagerName" class="form-control" placeholder="Enter Manager's Name" required />
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="txtDescription">Description</label>
                <textarea name="txtDescription" class="form-control" rows="4" placeholder="Enter a brief description of the blood bank" required></textarea>
            </div>

            <!-- Submit Button -->
            <div class="text-center pt-2 d-grid gap-2">
                <button type="submit" name="btnAddBloodBank" class="btn btn-primary btn-lg">Add Blood Bank</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>
