<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<script>
function validateForm() {
    let categoryName = document.getElementById("categoryName").value.trim();

    if (categoryName === "") {
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "Category name cannot be empty.",
            confirmButtonText: "OK"
        });
        return false;
    }
    return true;
}
</script>

<%
if (request.getParameter("btnsave") != null) {
    String cname = request.getParameter("categoryName").trim();
    
    if (!cname.isEmpty()) {
        // Using getRows() instead of modifying DataAccess.java
        ResultSet rs = db.getRows("SELECT * FROM category WHERE CategoryName = ?", cname);

        if (rs.next()) {  // If a row exists, category already exists
            errorMsg = cname + " category already exists!";
        } else {
            db.executeSql("INSERT INTO category (CategoryName) VALUES (?)", cname);
            successMsg = cname + " Category Added Successfully!";
            redirectUrlSuccess = "/Zara_Fashion/Admin/addcategory.jsp"; // Auto-refresh after success
        }
        rs.close();  // Close ResultSet to avoid memory leaks
    } else {
        errorMsg = "Category name cannot be empty.";
    }
}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="mb-4">Add Category</h2>
            <form method="POST" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                </div>
                <hr>
                <div class="text-center d-grid gap-2">
                    <button type="submit" name="btnsave" class="btn btn-dark">Add Category</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
