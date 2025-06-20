<%@ include file="../header.jsp"%>

<%
	if(request.getParameter("btnsave")!=null){
		String cname=request.getParameter("categoryName");
		
		db.executeSql("insert into category (CategoryName) values (?)",  cname);
		successMsg=cname+"  Category Added Successfully!";
	}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="mb-4">Add Category</h2>
            <form  method="POST">
               
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                </div>
                <hr>
                <div class="text-center d-grid gap-2">
                <button type="submit" name="btnsave" class="btn btn-primary">Add Category</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp"%>