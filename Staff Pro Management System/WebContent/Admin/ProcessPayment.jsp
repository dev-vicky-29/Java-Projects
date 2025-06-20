<%@ include file="../header.jsp"%>

<%
    if (request.getMethod().equals("POST")) {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        String staffName = request.getParameter("staffName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String salary = request.getParameter("salary");
        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("year"));
        String paymentMethod = request.getParameter("paymentMethod");
        String upiID = request.getParameter("upiID");
        String paymentNumber = request.getParameter("paymentNumber");

        db.executeSql("INSERT INTO payment (StaffID, StaffName, EmailID, Number, Salary, Month, Year, PaymentMethod, UPI_ID, PhonePayNumber, GPayNumber, PaidDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())",
            staffID, staffName, email, phone, salary, month, year, paymentMethod, upiID, paymentNumber, paymentNumber);

        response.sendRedirect("MakePayment.jsp?success=Payment Processed Successfully!");
    }
%>
<%@ include file="../footer.jsp"%>