<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch Teacher Email from Session
    String teacherEmail = (String) session.getAttribute("mail");
    String myClass = "";

    // Get Class Name from class_teacher Table
    ResultSet classData = db.getRows("SELECT ClassName FROM class_teacher WHERE TeacherEmail = ?", teacherEmail);
    if (classData.next()) {
        myClass = classData.getString("ClassName");
    }

    // Fetch Students of this Class
    ResultSet students = db.getRows("SELECT * FROM student WHERE Class = ?", myClass);

    // Update Roll Numbers Logic
    if (request.getParameter("updateRoll") != null) {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        int newRollNo = Integer.parseInt(request.getParameter("rollNo"));

        db.executeSql("UPDATE student SET RollNo = ? WHERE ID = ?", newRollNo, studentID);
        response.sendRedirect("MyClass.jsp");
        return;
    }
%>

<div class="container">
    <h2 class="text-center">My Class: <%= myClass %></h2>
    
    <h3>Student List</h3>
    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Parent Contact</th>
                <th>Gender</th>
                <th>Roll No</th>
                <th>Update Roll No</th>
            </tr>
        </thead>
        <tbody>
            <% while (students.next()) { %>
            <tr>
                <td><%= students.getInt("ID") %></td>
                <td><%= students.getString("Name") %></td>
                <td><%= students.getString("EmailID") %></td>
                <td><%= students.getString("Contact") %></td>
                <td><%= students.getString("ParentContact") %></td>
                <td><%= students.getString("Gender") %></td>
                <td><%= students.getInt("RollNo") %></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="studentID" value="<%= students.getInt("ID") %>">
                        <input type="number" name="rollNo" class="form-control" required>
                        <button type="submit" name="updateRoll" class="btn btn-primary mt-2">Update</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
