<%@ include file="../header.jsp"%>

<%
    int departmentID = Integer.parseInt(request.getParameter("id"));
    ResultSet rs = db.getRows("SELECT * FROM department WHERE DepartmentID = ?", departmentID);
    
    String departmentName = "";

    if (rs.next()) {
        departmentName = rs.getString("DepartmentName");
    }

    if (request.getParameter("btnUpdate") != null) {
        departmentName = request.getParameter("txtdepartment");

        db.executeSql("UPDATE department SET DepartmentName=? WHERE DepartmentID=?", departmentName, departmentID);

        response.sendRedirect("DepartmentList.jsp?success=Department Updated Successfully!");
    }
%>

<div class="container mt-5 col-5 offset-3 border">
    <h2 class="text-center">Edit Department</h2>
    <form action="" method="post">
        <div class="form-group">
            Department Name
            <input type="text" name="txtdepartment" class="form-control" value="<%= departmentName %>" required />
        </div>
        <div class="text-center mt-3 mb-3">
            <input type="submit" name="btnUpdate" class="btn btn-success" value="Update Department" />
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>
