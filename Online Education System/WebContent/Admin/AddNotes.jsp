<%@ page import="java.sql.*, java.util.*, javazoom.upload.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // File Upload Paths
    String filePath = request.getRealPath("/Notes/");

    UploadBean fileUpload = new UploadBean();
    fileUpload.setFolderstore(filePath);

    // Variables
    String notesName = "", courseName = "", fileName = "", status = "Active";
    String editId = request.getParameter("edit");
    String deleteId = request.getParameter("delete");

    // Fetch courses for dropdown
    ResultSet courseRs = db.getRows("SELECT course_name FROM courses");

    // DELETE logic
    if (deleteId != null) {
        db.executeSql("DELETE FROM notes WHERE id=?", deleteId);
        response.sendRedirect("AddNotes.jsp");
    }

    // EDIT logic - Get existing data
    if (editId != null) {
        ResultSet rs = db.getRows("SELECT * FROM notes WHERE id=?", editId);
        if (rs.next()) {
            notesName = rs.getString("notes_name");
            courseName = rs.getString("course_name");
            fileName = rs.getString("file_name");
            status = rs.getString("status");
        }
    }

    // FORM SUBMISSION (INSERT / UPDATE)
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddNotes") != null) {
            notesName = mrequest.getParameter("notes_name");
            courseName = mrequest.getParameter("course_name");
            status = mrequest.getParameter("status");

            // File Handling
            Hashtable files = mrequest.getFiles();
            if (files != null && files.size() > 0) {
                UploadFile uploadedFile = (UploadFile) files.get("file");
                if (uploadedFile != null && uploadedFile.getFileName() != null && !uploadedFile.getFileName().equals("")) {
                    fileName = uploadedFile.getFileName();
                    fileUpload.store(mrequest, "file");
                }
            }

            // Insert or Update
            try {
                if (editId == null) {
                    db.executeSql("INSERT INTO notes (notes_name, course_name, file_name, status) VALUES (?, ?, ?, ?)",
                        notesName, courseName, fileName, status);
                } else {
                    db.executeSql("UPDATE notes SET notes_name=?, course_name=?, file_name=?, status=? WHERE id=?",
                        notesName, courseName, fileName, status, editId);
                }
                response.sendRedirect("AddNotes.jsp");
            } catch (Exception e) {
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
            }
        }
    }
%>

<div class="container">
    <h2 class="text-center"><%= editId == null ? "Add Notes" : "Edit Notes" %></h2>
    <div class="col-5 offset-3">
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label>Notes Name:</label>
            <input type="text" class="form-control" name="notes_name" value="<%= notesName %>" required>
        </div>
        <div class="mb-3">
            <label>Course Name:</label>
            <select class="form-control" name="course_name" required>
                <option value="">Select Course</option>
                <% while (courseRs.next()) { %>
                    <option value="<%= courseRs.getString("course_name") %>" <%= courseRs.getString("course_name").equals(courseName) ? "selected" : "" %>><%= courseRs.getString("course_name") %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label>Upload File (PDF, DOCX, PPTX only):</label>
            <input type="file" class="form-control" name="file" accept=".pdf,.docx,.pptx" <%= editId == null ? "required" : "" %>>
        </div>
        <div class="mb-3">
            <label>Status:</label>
            <select class="form-control" name="status">
                <option value="Active" <%= "Active".equals(status) ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= "Inactive".equals(status) ? "selected" : "" %>>Inactive</option>
            </select>
        </div>
        <div class="text-center d-grid">
        <button type="submit" class="btn btn-success" name="btnAddNotes"><%= editId == null ? "Add Notes" : "Update Notes" %></button>
        </div>
    </form>
	</div>
    <h3 class="mt-4">All Notes</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Notes Name</th>
                <th>Course Name</th>
                <th>File</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet notes = db.getRows("SELECT * FROM notes");
                while (notes.next()) {
            %>
            <tr>
                <td><%= notes.getString("notes_name") %></td>
                <td><%= notes.getString("course_name") %></td>
                <td><a href="/Online_Education_System/Notes/<%= notes.getString("file_name") %>" target="_blank">Download</a></td>
                <td><%= notes.getString("status") %></td>
                <td>
                    <a href="AddNotes.jsp?edit=<%= notes.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="AddNotes.jsp?delete=<%= notes.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
