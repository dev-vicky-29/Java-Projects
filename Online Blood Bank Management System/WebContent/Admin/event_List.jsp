<%@page import="java.sql.*"%>
<%@ include file="../header.jsp"%>

<%
   

    // Handle status update
    if (request.getParameter("btnUpdateStatus") != null) {
        String eventId = request.getParameter("eventId");
        String newStatus = request.getParameter("newStatus");
        db.executeSql("UPDATE Events SET Status = ? WHERE EventID = ?", newStatus, eventId);
        response.sendRedirect("/Online_Blood_Bank_Management_System/Admin/event_List.jsp");
    }
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Events</h2>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Event Name</th>
                <th>Date</th>
                <th>Time</th>
                <th>Location</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            ResultSet rs = db.getRows("SELECT * FROM Events");
                if (rs != null) {
                	while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td>
                        <span class="<%= rs.getString(8).equals("ENDED") ? "text-danger" : "text-success" %>">
                            <%= rs.getString(8) %>
                        </span>
                    </td>
                    <td>
                        <% if (rs.getString(8).equals("ACTIVE")) { %>
                            <form action="" method="post" class="d-inline">
                                <input type="hidden" name="eventId" value="<%= rs.getInt(1) %>">
                                <input type="hidden" name="newStatus" value="ENDED">
                                <button type="submit" name="btnUpdateStatus" class="btn btn-danger btn-sm">Mark as Ended</button>
                            </form>
                        <% } else { %>
                            <form action="" method="post" class="d-inline">
                                <input type="hidden" name="eventId" value="<%= rs.getInt(1) %>">
                                <input type="hidden" name="newStatus" value="ACTIVE">
                                <button type="submit" name="btnUpdateStatus" class="btn btn-success btn-sm">Mark as Active</button>
                            </form>
                        <% } %>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="7" class="text-center">No events to manage.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp"%>
