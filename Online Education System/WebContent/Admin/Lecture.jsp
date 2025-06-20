<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String searchQuery = request.getParameter("search");
    ResultSet lectures;
    if (searchQuery != null && !searchQuery.isEmpty()) {
        lectures = db.getRows("SELECT * FROM lectures WHERE lecture_title LIKE ? OR course_name LIKE ?", 
                              "%" + searchQuery + "%", "%" + searchQuery + "%");
    } else {
        lectures = db.getRows("SELECT * FROM lectures");
    }
%>

<div class="container">
    <h2 class="text-center"> All Lectures</h2>

    <form method="GET" class="mb-4">
        <input type="text" name="search" class="form-control" placeholder="Search by title or course" value="<%= searchQuery == null ? "" : searchQuery %>">
        <button type="submit" class="btn btn-primary mt-2">Search</button>
    </form>

    <div class="row">
        <% while (lectures.next()) { %>
            <div class="col-md-4">
                <div class="card mb-4 shadow">
                    <div class="card-body">
                        <h5 class="card-title"><%= lectures.getString("lecture_title") %></h5>
                        <p class="card-text">
                            <strong>Course:</strong> <%= lectures.getString("course_name") %><br>
                            <strong>Description:</strong> <%= lectures.getString("description") %>
                        </p>
                        <a href="<%= lectures.getString("youtube_url") %>" class="btn btn-primary" target="_blank">Watch Now</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>
