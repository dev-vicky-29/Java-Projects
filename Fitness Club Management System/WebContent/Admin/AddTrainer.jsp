<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String name = "", address = "", mobileNo = "", email = "", password = "", salary = "", specialist = "";
    String photoName = "";
    String path = request.getRealPath("/TrainerImages/");

    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddTrainer") != null) {
            name = mrequest.getParameter("name");
            address = mrequest.getParameter("address");
            mobileNo = mrequest.getParameter("mobileNo");
            email = mrequest.getParameter("email");
            password = mrequest.getParameter("password");
            salary = mrequest.getParameter("salary");
            specialist = mrequest.getParameter("specialist");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("photo");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    photoName = uf.getFileName();
                    upBean.store(mrequest, "photo");
                }
            }

            db.executeSql("INSERT INTO trainer (Name, Address, MobileNo, Email, Password, Salary, Specialist, Photo) VALUES (?,?,?,?,?,?,?,?)",
                name, address, mobileNo, email, password, salary, specialist, photoName);
            successMsg = name + " Trainer Added Successfully";
        }
    }
%>

<div class="container mt-5  offset-1">
    <div class="row justify-content-center">
        <div class="col-md-8 border">
            <h2 class="mb-4">Add Trainer</h2>
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea class="form-control" id="address" name="address" required></textarea>
                </div>
                <div class="form-group">
                    <label for="mobileNo">Mobile No</label>
                    <input type="text" class="form-control" id="mobileNo" name="mobileNo" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="salary">Salary</label>
                    <input type="number" class="form-control" id="salary" name="salary" required>
                </div>
                <div class="form-group">
                    <label for="specialist">Specialist</label>
                    <input type="text" class="form-control" id="specialist" name="specialist" required>
                </div>
                <div class="form-group">
                    <label for="photo">Photo</label>
                    <input type="file" class="form-control-file" id="photo" name="photo" required>
                </div>
                <hr>
                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="btnAddTrainer" class="btn btn-primary">Add Trainer</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
