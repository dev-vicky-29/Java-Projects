<%@ include file="../header.jsp" %>
<%
    ResultSet contactRs = db.getRows("SELECT * FROM contacts ORDER BY submitted_at DESC");
%>

<div class="container col-8 mt-5">
    <h2 class="text-center">User Inquiries</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
            </tr>
        </thead>
        <tbody>
            <% while (contactRs.next()) { %>
                <tr>
                    <td><%= contactRs.getString("name") %></td>
                    <td><%= contactRs.getString("email") %></td>
                    <td><%= contactRs.getString("message") %></td>
                    <td><%= contactRs.getString("submitted_at") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>