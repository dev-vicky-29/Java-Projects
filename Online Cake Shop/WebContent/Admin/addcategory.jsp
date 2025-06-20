<%@ include file="../header.jsp"%>

<%


if (request.getParameter("btnsave") != null) {
    String cname = request.getParameter("categoryName");

    // Insert category into the database
    db.executeSql("INSERT INTO category (CategoryName) VALUES (?)", cname);
    successMsg = cname + " category added successfully!";
}
%>

<style>
    .form-container {
        background: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .form-title {
        font-size: 1.8rem;
        font-weight: bold;
        color: #343a40;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #ced4da;
        padding: 10px;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        font-size: 1rem;
    }

    .btn-primary:focus,
    .btn-primary:active {
        outline: none;
        box-shadow: none;
    }

    .alert {
        text-align: center;
        font-weight: bold;
    }
</style>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container">
                <% if (successMsg != null) { %>
                    <div class="alert alert-success" role="alert">
                        <%= successMsg %>
                    </div>
                <% } %>
                <h2 class="form-title">Add Category</h2>
                <form method="POST">
                    <div class="form-group mb-3">
                        <label for="categoryName">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Enter Category Name" required>
                    </div>
                    <div class="text-center d-grid gap-2">
                        <button type="submit" name="btnsave" class="btn btn-primary">Add Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
