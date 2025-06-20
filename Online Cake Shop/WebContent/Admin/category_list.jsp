<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if (request.getParameter("did") != null) {
    db.executeSql("DELETE FROM category WHERE CategoryId=?", request.getParameter("did"));
}
%>

<%
    // Retrieve category list from the database
    ResultSet rs = db.getRows("SELECT * FROM category");
%>

<style>
    .table-container {
        background: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .table-title {
        font-size: 1.8rem;
        font-weight: bold;
        color: #343a40;
        text-align: center;
        margin-bottom: 20px;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
    }

    .table th, .table td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }

    .table th {
        background-color: #f8f9fa;
        color: #495057;
    }

    .btn-danger {
        background-color: #dc3545;
        border: none;
        font-size: 0.9rem;
        padding: 6px 12px;
        color: #fff;
    }

    .btn-danger:hover {
        background-color: #bd2130;
    }

    .text-center {
        text-align: center;
    }

    .action-cell {
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    .dataTables_wrapper .dataTables_filter {
        float: right;
        margin-bottom: 15px;
    }

    .dataTables_wrapper .dataTables_paginate {
        float: right;
    }
</style>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="table-container">
                <h2 class="table-title">Category List</h2>
                <table id="table1" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Category ID</th>
                            <th>Category Name</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rs.next()) { %>
                            <tr>
                                <td><%= rs.getString("CategoryId") %></td>
                                <td><%= rs.getString("CategoryName") %></td>
                                <td class="action-cell">
                                    <a href="?did=<%= rs.getString(1) %>" 
                                       onclick="return confirm('Do you want to delete this record?');" 
                                       class="btn btn-danger">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<script>
    $(document).ready(function() {
        $("#table1").DataTable({
            responsive: true,
            autoWidth: false,
            lengthChange: false,
            pagingType: "simple",
        });
    });
</script>
