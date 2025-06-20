<%@page import="java.sql.*"%>
<%@ include file="../header.jsp"%>

<%
    String departmentName = "";
  

    if (request.getParameter("btnAddDepartment") != null) {
        departmentName = request.getParameter("txtDepartment");

        try {
            db.executeSql("INSERT INTO department (DepartmentName) VALUES (?)", departmentName);
            successMsg = departmentName + " Department Added Successfully";
        } catch (Exception e) {
            errorMsg = "Error: Department already exists!";
        }
    }
%>

<% if (!successMsg.isEmpty()) { %>
    <script>alert("<%= successMsg %>");</script>
<% } else if (!errorMsg.isEmpty()) { %>
    <script>alert("<%= errorMsg %>");</script>
<% } %>

<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Department</h4>
    </div>
    <div class="card-body">
        <form action="" method="post">
            <div class="form-group">
                Department Name
                <input name="txtDepartment" class="form-control" placeholder="Enter Department Name" required/>
            </div>
            <div class="text-center mt-2 d-grid gap-2">
                <input Type="submit" value="Add Department" name="btnAddDepartment" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp"%>
