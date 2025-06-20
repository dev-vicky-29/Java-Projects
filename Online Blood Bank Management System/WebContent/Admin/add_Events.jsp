<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>

<%
    String eventName = "", eventDate = "", eventTime = "", eventLocation = "", eventDescription = "", eventImageName = "";
    String uploadPath = request.getRealPath("/EventImages/");
    UploadBean uploadBean = new UploadBean();
    uploadBean.setFolderstore(uploadPath); // Directory to store uploaded files

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddEvent") != null) {
            eventName = mrequest.getParameter("txtEventName");
            eventDate = mrequest.getParameter("txtEventDate");
            eventTime = mrequest.getParameter("txtEventTime");
            eventLocation = mrequest.getParameter("txtEventLocation");
            eventDescription = mrequest.getParameter("txtEventDescription");

            Hashtable files = mrequest.getFiles();
            if (files != null && files.size() > 0) {
                UploadFile uploadedFile = (UploadFile) files.get("eventImage");
                if (uploadedFile != null && uploadedFile.getFileName() != null && !uploadedFile.getFileName().isEmpty()) {
                    eventImageName = uploadedFile.getFileName();
                    uploadBean.store(mrequest, "eventImage"); // Save file to server
                }
            }

            // Insert event details into the database
            db.executeSql(
                "INSERT INTO Events (EventName, Date, Time, Location, Description, Image) VALUES (?, ?, ?, ?, ?, ?)",
                eventName, eventDate, eventTime, eventLocation, eventDescription, eventImageName
            );
            out.println("<script>alert('Event added successfully!'); window.location.href='/Online_Blood_Bank_Management_System/Admin/event_List.jsp';</script>");
        }
    }
%>

<div class="container mt-5">
    <div class="card col-md-8 offset-md-2">
        <div class="card-header bg-primary text-white">
            <h4 class="text-center">Add Blood Donation Event</h4>
        </div>
        <div class="card-body">
            <form action="" method="post" enctype="multipart/form-data">
                <!-- Event Name -->
                <div class="form-group">
                    <label for="txtEventName">Event Name</label>
                    <input type="text" class="form-control" id="txtEventName" name="txtEventName" placeholder="Enter Event Name" required>
                </div>

                <!-- Event Date -->
                <div class="form-group">
                    <label for="txtEventDate">Event Date</label>
                    <input type="date" class="form-control" id="txtEventDate" name="txtEventDate" required>
                </div>

                <!-- Event Time -->
                <div class="form-group">
                    <label for="txtEventTime">Event Time</label>
                    <input type="time" class="form-control" id="txtEventTime" name="txtEventTime" required>
                </div>

                <!-- Event Location -->
                <div class="form-group">
                    <label for="txtEventLocation">Event Location</label>
                    <input type="text" class="form-control" id="txtEventLocation" name="txtEventLocation" placeholder="Enter Event Location" required>
                </div>

                <!-- Event Description -->
                <div class="form-group">
                    <label for="txtEventDescription">Event Description</label>
                    <textarea class="form-control" id="txtEventDescription" name="txtEventDescription" rows="4" placeholder="Enter Event Details" required></textarea>
                </div>

                <!-- Event Image Upload -->
                <div class="form-group">
                    <label for="eventImage">Event Banner/Image</label>
                    <input type="file" class="form-control" id="eventImage" name="eventImage" accept=".jpg,.jpeg,.png" required>
                    <small class="form-text text-muted">Only JPG, JPEG, and PNG files are allowed.</small>
                </div>

                <!-- Submit Button -->
                <div class="text-center mt-4">
                    <button type="submit" name="btnAddEvent" class="btn btn-success btn-lg">Add Event</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
