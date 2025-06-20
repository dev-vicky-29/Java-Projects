<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!--index page specific content--> 
<hr>
<div class="text-center ">
               <a type="button" class="btn btn-primary btn-sm" href="/Dairy_Management_System/admin/setmilkrate.jsp">Edit Fat Rate</a>
            </div>
<hr>
<div class="container mt-5">
        <h1 class="text-center mb-4">Milk Rate Card</h1>
        <div class="row row-cols-1 row-cols-md-2 g-4">
        
        <!-- Cow Milk Rate Start -->
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-center">Cow Milk Rate</h5><hr>
                       
                        <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Sr.No.</th>
      <th scope="col">Fat</th>
      <th scope="col">Rate</th>
      
    </tr>
  </thead>
  <tbody>
   <%
        ResultSet rs=db.getRows("select * from cow_milk_rates");
        while(rs.next()){
        	
        
        %>
    <tr>
      <th scope="row"><%=rs.getString(1) %></th>
      <td><%=rs.getString(2) %></td>
      <td>Rs.<%=rs.getString(3) %></td>
      
    </tr>
	<%
        }
            %>
  	</tbody>
	</table>
                    </div>
                </div>
            </div>
             <!-- Cow Milk Rate End -->
            
             <!-- Buffalo Milk Rate Start -->
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-center">Buffalo Milk Rate</h5><hr>
                       
                        <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Sr.No.</th>
      <th scope="col">Fat</th>
      <th scope="col">Rate</th>
      
    </tr>
  </thead>
  <tbody>
   <%
        ResultSet cs=db.getRows("select * from buffalo_milk_rates");
        while(cs.next()){
        	
        
        %>
    <tr>
      <th scope="row"><%=cs.getString(1) %></th>
      <td><%=cs.getString(2) %></td>
      <td>Rs.<%=cs.getString(3) %></td>
      
    </tr>
	<%
        }
            %>
  	</tbody>
	</table>
                    </div>
                </div>
            </div>
                        <!-- Buffalo Milk Rate End -->
            
        </div>
    </div>

    <!-- Latest Bootstrap JS (optional, if you need JavaScript functionality) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<%@ include file="../footer.jsp"%>