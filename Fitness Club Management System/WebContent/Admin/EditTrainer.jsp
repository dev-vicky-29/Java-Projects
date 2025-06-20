<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    int trainerId = Integer.parseInt(request.getParameter("Id"));
    ResultSet rs = db.getRows("SELECT * FROM trainer WHERE Id = ?", trainerId);
    rs.next();

    String name = rs.getString("Name");
    String address = rs.getString("Address");
    String mobileNo = rs.getString("MobileNo");
    String email = rs.getString("Email");
    String password = rs.getString("Password");
    String salary = rs.getString("Salary");
    String specialist = rs.getString("Specialist");
    

    String path = request.getRealPath("/TrainerImages/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnUpdateTrainer") != null) {
            name = mrequest.getParameter("name");
            address = mrequest.getParameter("address");
            mobileNo = mrequest.getParameter("mobileNo");
            email = mrequest.getParameter("email");
            password = mrequest.getParameter("password");
            salary = mrequest.getParameter("salary");
            specialist = mrequest.getParameter("specialist");

           

            db.executeSql("UPDATE trainer SET Name = ?, Address = ?, MobileNo = ?, Email = ?, Password = ?, Salary = ?, Specialist = ? WHERE Id = ?",
                name, address, mobileNo, email, password, salary, specialist,  trainerId);

            response.sendRedirect("TrainerList.jsp");
        }
    }
%>

<div class="container mt-5">
    <h2 class="mb-4">Edit Trainer</h2>
    <form method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" name="address" required><%= address %></textarea>
        </div>
        <div class="form-group">
            <label for="mobileNo">Mobile No</label>
            <input type="text" class="form-control" id="mobileNo" name="mobileNo" value="<%= mobileNo %>" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
        </div>
        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" class="form-control" id="salary" name="salary" value="<%= salary %>" required>
        </div>
        <div class="form-group">
            <label for="specialist">Specialist</label>
            <input type="text" class="form-control" id="specialist" name="specialist" value="<%= specialist %>" required>
        </div>
       
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnUpdateTrainer" class="btn btn-success">Update Trainer</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
