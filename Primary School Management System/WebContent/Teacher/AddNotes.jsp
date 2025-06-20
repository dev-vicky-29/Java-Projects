<%@ page import="java.sql.*, java.util.*, javazoom.upload.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch Teacher Email from Session
    String teacherEmail = (String) session.getAttribute("mail");
    String teacherName = "";

    // Get Teacher Name
    ResultSet teacherData = db.getRows("SELECT TeacherName FROM teacher WHERE EmailID = ?", teacherEmail);
    if (teacherData.next()) {
        teacherName = teacherData.getString("TeacherName");
    }

    // Fetch Class Names for Dropdown
    ResultSet classRs = db.getRows("SELECT ClassName FROM class");
    ResultSet subjectRs = db.getRows("SELECT SubjectName FROM subject");

    // File Upload Path
    String filePath = request.getRealPath("/Notes/");
    UploadBean fileUpload = new UploadBean();
    fileUpload.setFolderstore(filePath);

    // Variables
    String notesName = "", className = "", subjectName = "", fileName = "", status = "Active";
    String editId = request.getParameter("edit");
    String deleteId = request.getParameter("delete");

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
            className = rs.getString("class_name");
            subjectName = rs.getString("subject_name");
            fileName = rs.getString("file_name");
            status = rs.getString("status");
        }
    }

    // FORM SUBMISSION (INSERT / UPDATE)
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddNotes") != null) {
            notesName = mrequest.getParameter("notes_name");
            className = mrequest.getParameter("class_name");
            subjectName = mrequest.getParameter("subject_name");
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
                    db.executeSql("INSERT INTO notes (notes_name, class_name, subject_name, file_name, teacher_name, teacher_email, status) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        notesName, className, subjectName, fileName, teacherName, teacherEmail, status);
                } else {
                    db.executeSql("UPDATE notes SET notes_name=?, class_name=?, subject_name=?, file_name=?, status=? WHERE id=?",
                        notesName, className, subjectName, fileName, status, editId);
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
            <label>Class Name:</label>
            <select class="form-control" name="class_name" required>
                <option value="">Select Class</option>
                <% while (classRs.next()) { %>
                    <option value="<%= classRs.getString("ClassName") %>" <%= classRs.getString("ClassName").equals(className) ? "selected" : "" %>><%= classRs.getString("ClassName") %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label>Subject Name:</label>
            
            <select class="form-control" name="subject_name" required>
                <option value="">Select Subject</option>
                <% while (subjectRs.next()) { %>
                    <option value="<%= subjectRs.getString("SubjectName") %>" <%= subjectRs.getString("SubjectName").equals(subjectName) ? "selected" : "" %>><%= subjectRs.getString("SubjectName") %></option>
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
    <h3 class="mt-4">My Notes</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Notes Name</th>
                <th>Class Name</th>
                <th>Subject Name</th>
                <th>File</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet notes = db.getRows("SELECT * FROM notes WHERE teacher_email=?", teacherEmail);
                while (notes.next()) {
            %>
            <tr>
                <td><%= notes.getString("notes_name") %></td>
                <td><%= notes.getString("class_name") %></td>
                <td><%= notes.getString("subject_name") %></td>
                <td><a href="/Primary_School_Management_System/Notes/<%= notes.getString("file_name") %>" target="_blank">Download</a></td>
                <td><%= notes.getString("status") %></td>
                <td>
                    
                    <a href="AddNotes.jsp?delete=<%= notes.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
