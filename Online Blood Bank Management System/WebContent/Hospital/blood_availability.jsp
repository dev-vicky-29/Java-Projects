<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ include file="../header.jsp"%>

<div class="container col-5 mt-5">
    <h2 class="text-center">Check Blood Availability</h2>

    <!-- Blood Group Selection Form -->
    <form method="get" action="" class=" form-inline custom-border justify-content-center mb-4">
        <div class="form-group mx-sm-3">
            <label for="bloodGroup" class="mr-2 fw-bold">Blood Group:</label>
            <select name="bloodGroup" id="bloodGroup" class="form-control" required>
                <option value="" disabled selected>Select Blood Group</option>
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
        <div class="text-center d-grid pt-3 gap-2">
        <button type="submit" name="btnSearch" class="btn btn-primary">Search for Availability</button>
        </div>
    </form>

    <!-- Message Display -->
    <div class="text-center mt-4">
        <%
            if (request.getParameter("btnSearch") != null) {
                String bloodGroup = request.getParameter("bloodGroup");
                if (bloodGroup != null && !bloodGroup.isEmpty()) {
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                    	Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbankdb","root","VICK2909");
                        stmt = conn.createStatement();
                        String query = "SELECT Units FROM bloodstocks WHERE Bloodgroup = '" + bloodGroup + "'";
                        rs = stmt.executeQuery(query);

                        if (rs.next()) {
                            int units = rs.getInt("Units");
                            if (units > 0) {
        %>
                                <div class="alert alert-success">
                                    Blood is available (Units: <%= units %>)
                                </div>
        <%
       
                            } else {
        %>
                                <div class="alert alert-danger">
                                    Blood is not available.
                                </div>
        <%
                            }
                        } else {
        %>
                            <div class="alert alert-warning">
                                Blood group not found in the database.
                            </div>
        <%
                        }
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                }
            }
        %>
    </div>
</div>

<%@ include file="../footer.jsp"%>
