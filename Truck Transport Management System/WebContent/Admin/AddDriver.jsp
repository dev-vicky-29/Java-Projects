<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String name = "", email = "", password = "", contact = "", licenseNumber = "", address = "", hireDate = "", salary = "";
    String photoName = "";
    String path = request.getRealPath("/DriverImages/"); // Change the folder path for driver images

    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddDriver") != null) {
            name = mrequest.getParameter("name");
            email = mrequest.getParameter("email");
            password = mrequest.getParameter("password");
            contact = mrequest.getParameter("contact");
            licenseNumber = mrequest.getParameter("licenseNumber");
            address = mrequest.getParameter("address");
            hireDate = mrequest.getParameter("hireDate");
            salary = mrequest.getParameter("salary");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("photo");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    photoName = uf.getFileName();
                    upBean.store(mrequest, "photo");
                }
            }

            db.executeSql("INSERT INTO drivers (name, EmailID, Password, contact, licensenumber, Address, hire_date, salary, Photo) VALUES (?,?,?,?,?,?,?,?,?)",
                name, email, password, contact, licenseNumber, address, hireDate, salary, photoName);
            successMsg = name + " Driver Added Successfully";
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Add Driver</h2>
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
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
                    <label for="contact">Contact</label>
                    <input type="text" class="form-control" id="contact" name="contact" required>
                </div>
                <div class="form-group">
                    <label for="licenseNumber">License Number</label>
                    <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea class="form-control" id="address" name="address" required></textarea>
                </div>
                <div class="form-group">
                    <label for="hireDate">Hire Date</label>
                    <input type="date" class="form-control" id="hireDate" name="hireDate" required>
                </div>
                <div class="form-group">
                    <label for="salary">Salary</label>
                    <input type="number" class="form-control" id="salary" name="salary" required>
                </div>
                <div class="form-group">
                    <label for="photo">Photo</label>
                    <input type="file" class="form-control-file" id="photo" name="photo" required>
                </div>
                <hr>
                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="btnAddDriver" class="btn btn-primary">Add Driver</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>