<%@ page import="java.sql.*" %>
<%@ page import="com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Handle delete request
    String deleteId = request.getParameter("deleteId");
    if (deleteId != null) {
        try {
           
            db.executeSql("DELETE FROM gallery WHERE id = ?", Integer.parseInt(deleteId));
            successMsg = "Gallery item deleted successfully.";
            redirectUrlSuccess="/Fitness_Club_Management_System/Admin/GalleryList.jsp";
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Gallery Images</h2>

    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>

    <table class="table table-bordered mt-3">
        <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    
                    ResultSet rs = db.getRows("SELECT * FROM gallery ORDER BY CreatedAt DESC");

                    int count = 1;
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String title = rs.getString("Title");
                        String imagePath = "/Fitness_Club_Management_System/GalleryImages/" + rs.getString("ImagePath");
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= title %></td>
                <td><img src="<%= imagePath %>" alt="Gallery Image" width="100"></td>
                <td>
                    <a href="GalleryList.jsp?deleteId=<%= id %>" class="btn btn-danger btn-sm"
                        onclick="return confirm('Are you sure you want to delete this image?');">
                        Delete
                    </a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
