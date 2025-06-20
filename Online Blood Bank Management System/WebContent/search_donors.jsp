<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%
    // Handle delete action
    //if (request.getParameter("did") != null) {
      //  db.executeSql("DELETE FROM donors WHERE donor_id=?", request.getParameter("did"));
   // }
%>
	
	

	<div class="container mt-5">
        <h2 class="text-center mb-4">Donors List</h2>

        <!-- Search Bar -->
        <div class="input-group mb-3">
            <input type="text" id="searchInput" class="form-control" placeholder="Search by Name or Blood Group" onkeyup="filterDonors();">
        </div>

        <!-- Donors Table -->
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                    	<th>Image</th>
                        <th>Donor ID</th>
                        <th>Name</th>
                        <th>Blood Group</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Last Donation Date</th>
                       
                    </tr>
                </thead>
                <tbody id="donorTableBody">
                    <%
                ResultSet rs = db.getRows("SELECT * FROM donors");
                while (rs.next()) {
            %>
            <tr>
                <!-- Display donor image -->
                <td>
                    <img src="/Online_Blood_Bank_Management_System/DonorPhotos/<%= rs.getString(10) %>" alt="Donor Image" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%;">
                </td>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(6) %></td>
                
            </tr>
            <%
                }
            %>
                </tbody>
            </table>
        </div>
    </div>

    

    <!-- Bootstrap JS and AJAX Script -->
    
    <script>
        

        // Function to filter donors
        function filterDonors() {
            const query = $('#searchInput').val().toLowerCase();
            $('#donorTableBody tr').filter(function() {
                $(this).toggle(
                    $(this).text().toLowerCase().indexOf(query) > -1
                );
            });
        }

        // Edit donor
        function editDonor(id) {
            // Populate the modal with donor data
            $.ajax({
                url: `GetDonorByIdServlet?id=${id}`,
                method: 'GET',
                dataType: 'json',
                success: function(donor) {
                    $('#editDonorId').val(donor.id);
                    $('#editDonorName').val(donor.name);
                    $('#editDonorBloodGroup').val(donor.bloodGroup);
                    $('#editDonorContact').val(donor.contact);
                    $('#editDonorAddress').val(donor.address);
                    $('#editLastDonationDate').val(donor.lastDonationDate);
                    $('#editDonorModal').modal('show');
                }
            });
        }

        
        // Load donors on page load
        $(document).ready(function() {
            loadDonors();
        });
    </script>

<%@ include file="footer.jsp"%>