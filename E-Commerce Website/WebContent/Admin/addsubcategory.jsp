<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    if(request.getParameter("btnsave") != null) {
        String categoryID = request.getParameter("categoryID");
        String subcategoryName = request.getParameter("subcategoryName");

        db.executeSql("INSERT INTO subcategory (SubCategoryName, CategoryID) VALUES (?, ?)", subcategoryName, categoryID);

        successMsg = subcategoryName + " Subcategory Added Successfully!";
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="mb-4">Add Sub-Category</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="categoryID">Select Category</label>
                    <select class="form-control" id="categoryID" name="categoryID" required>
                        <option value="">-- Select Category --</option>
                        <%
                            ResultSet rs = db.getRows("SELECT * FROM category");
                            while(rs.next()) {
                        %>
                        <option value="<%= rs.getInt("CategoryID") %>"><%= rs.getString("CategoryName") %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="form-group mt-3">
                    <label for="subcategoryName">Subcategory Name</label>
                    <input type="text" class="form-control" id="subcategoryName" name="subcategoryName" required>
                </div>

                <hr>
                <div class="text-center d-grid gap-2">
                    <button type="submit" name="btnsave" class="btn btn-primary">Add Subcategory</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
