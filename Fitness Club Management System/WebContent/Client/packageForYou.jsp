<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

    <div class="container mt-4">
        <h2 class="text-center">Recommended Packages for You</h2>

        <%
            // Client Email from Session
            String mail = (String) session.getAttribute("mail");
            if (mail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Fetch Client's Purpose
            String clientPurpose = "";
            String purposeQuery = "SELECT Purpose FROM client WHERE EmailId='" + mail + "'";
            ResultSet rsPurpose = db.getRows(purposeQuery);
            if (rsPurpose.next()) {
                clientPurpose = rsPurpose.getString("Purpose");
            }

            // Fetch Packages Based on Purpose
            String query = "SELECT * FROM fitness_packages WHERE Purpose='" + clientPurpose + "' AND Status='Active'";
            ResultSet rs = db.getRows(query);
        %>

        <div class="row">
            <%
                boolean hasPackages = false;
                while (rs.next()) {
                    hasPackages = true;
            %>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("PackageName") %></h5>
                        <p class="card-text"><%= rs.getString("Description") %></p>
                        <p><strong>Duration:</strong> <%= rs.getString("Duration") %> months</p>
                        <p><strong>Price:</strong> Rs.<%= rs.getInt("Price") %></p>
                        <p><strong>Purpose:</strong> <%= rs.getString("Purpose") %></p>
                        <form action="subscribe_package.jsp" method="post">
                            <input type="hidden" name="PackageID" value="<%= rs.getInt("PackageID") %>">
                            <input type="hidden" name="PackageName" value="<%= rs.getString("PackageName") %>">
                            <input type="hidden" name="Price" value="<%= rs.getInt("Price") %>">
                            <button type="submit" class="btn btn-primary">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }

                if (!hasPackages) {
            %>
            <div class="col-12">
                <div class="alert alert-warning text-center">
                    <h4>No Packages Found</h4>
                    <p>Currently, no fitness packages match your goal.</p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

  
<%@ include file="../footer.jsp"%>
