<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<!--index page specific content--> 

<div>
        <h1 class="text-center mb-4">Animal Feed Products</h1>
     </div>
        <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
        ResultSet rs=db.getRows("select * from animalfeed");
        while(rs.next()){
        	
        
        %>
            <div class="col">
                <div class="card product-card">
                    <img src="/Dairy_management_system/ProductImage/<%=rs.getString(4) %>" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%=rs.getString(2) %></h5>
                        <p class="card-text">RS. <%=rs.getString(3) %></p>
                        <a href="/Dairy_management_system/login.jsp" class="btn btn-info">Buy Now</a>
                    </div>
                </div>
            </div>
            <%
        }
            %>
            </div>
           
<%@ include file="footer.jsp"%>