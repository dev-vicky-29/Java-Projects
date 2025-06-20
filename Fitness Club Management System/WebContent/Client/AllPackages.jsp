<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
		
		<div class="text-center pt-5"> 
    <a href="/Fitness_Club_Management_System/Client/packageForYou.jsp" class="btn btn-sm  btn-primary">
    Package For You
</a>
</div>
<hr>
           
    <div class="container mt-4">
        <h2 class="text-center">Choose Package</h2>
        <div class="row">
            <%
               
                ResultSet rs = db.getRows("SELECT * FROM fitness_packages WHERE Status='Active'");

                while (rs.next()) {
            %>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("PackageName") %></h5>
                        <p class="card-text"><%= rs.getString("Description") %></p>
                        <p><strong>Duration:</strong> <%= rs.getString("Duration") %> months</p>
                        <p><strong>Price:</strong> Rs.<%= rs.getInt("Price") %></p>
                        <p><strong>Purpose:</strong> <%= rs.getString("Purpose") %></p>
                        <form action="#" method="post">
                            <input type="hidden" name="PackageID" value="<%= rs.getInt("PackageID") %>">
                            <input type="hidden" name="PackageName" value="<%= rs.getString("PackageName") %>">
                            <input type="hidden" name="Price" value="<%= rs.getInt("Price") %>">
                            <button type="submit" class="btn btn-primary">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

   

<%@ include file="../footer.jsp"%>