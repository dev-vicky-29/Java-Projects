<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    int staffID = Integer.parseInt(request.getParameter("id"));
    ResultSet rs = db.getRows("SELECT * FROM staff WHERE StaffID = ?", staffID);

    String teacherName = "", emailID = "", number = "", department = "", education = "", designation = "";

    if (rs.next()) {
        teacherName = rs.getString("StaffName");
        emailID = rs.getString("EmailID");
        number = rs.getString("Number");
        department = rs.getString("Department");
        education = rs.getString("Education");
        designation = rs.getString("Designation");
    }

    if (request.getParameter("btnUpdate") != null) {
        teacherName = request.getParameter("txtteachername");
        emailID = request.getParameter("txtemail");
        number = request.getParameter("txtnumber");
        department = request.getParameter("txtdepartment");
        education = request.getParameter("txteducation");
        designation = request.getParameter("txtdesignation");

        db.executeSql("UPDATE staff SET StaffName=?, EmailID=?, Number=?, Department=?, Education=?, Designation=? WHERE StaffID=?",
            teacherName, emailID, number, department, education, designation, staffID);

        response.sendRedirect("StaffList.jsp?success=Staff Updated Successfully!");
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Edit Staff</h2>
    <form action="" method="post">
        <div class="form-group">
            Name
            <input type="text" name="txtteachername" class="form-control" value="<%= teacherName %>" required />
        </div>
        <div class="form-group">
            Email
            <input type="email" name="txtemail" class="form-control" value="<%= emailID %>" required />
        </div>
        <div class="form-group">
            Number
            <input type="text" name="txtnumber" class="form-control" value="<%= number %>" required />
        </div>
        <div class="form-group">
            Department
            <input type="text" name="txtdepartment" class="form-control" value="<%= department %>" required />
        </div>
        <div class="form-group">
            Education
            <input type="text" name="txteducation" class="form-control" value="<%= education %>" required />
        </div>
        <div class="form-group">
            Designation
            <input type="text" name="txtdesignation" class="form-control" value="<%= designation %>" required />
        </div>
        <div class="text-center">
            <input type="submit" name="btnUpdate" class="btn btn-success" value="Update Staff" />
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>
