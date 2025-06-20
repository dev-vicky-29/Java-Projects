<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!--index page specific content--> 

<div>
        <h1 class="text-center mb-4">Animal Feed Products</h1>
     </div>
     <div class="d-flex float-end">
     <a type="button" class="btn btn-primary btn-sm" href="/Dairy_management_system/supplier/orderfeed.jsp">Order Now</a>
     </div>
        <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
        ResultSet rs=db.getRows("select * from animalfeed");
        while(rs.next()){
        	
        
        %>
            <div class="col">
                <div class="card product-card h-100">
                    <img src="/Dairy_management_system/ProductImage/<%=rs.getString(4) %>" class="card-img-top h-50" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%=rs.getString(2) %></h5>
                        <p class="card-text">RS. <%=rs.getString(3) %></p>
                        <div class="align-items-end">
                        <div class="text-center d-grid gap-2 ">
                        
                        <a href="/Dairy_management_system/supplier/orderfeed.jsp" class="btn btn-info ">Order Now</a>
                    </div>
                    </div>
                    </div>
                </div>
            </div>
            <%
        }
            %>
            </div>
           
<%@ include file="../footer.jsp"%>