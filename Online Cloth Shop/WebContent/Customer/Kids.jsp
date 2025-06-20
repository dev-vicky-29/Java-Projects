<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<!-- Men Offers Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Shree Collection</h2>
            <h1 class="display-4 text-uppercase">Kids Deals</h1>
        </div>
        <div class="row gx-5">
        
        <%
  //Retrive Product list from the database
  ResultSet rs=db.getRows("select * from product where CategoryName='Kids' ");
  while(rs.next()){

  
  %>
        
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Cloth_Shop/ProductImages/<%= rs.getString(8) %>" alt="/Online_Cloth_Shop/ProductImages/<%= rs.getString(8) %>">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2"><%= rs.getString(2) %></h4>
                        <p class="card-text">Size Available: <strong><%= rs.getString(4) %></strong></p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs.<%= rs.getString(5) %></del>   - Rs.<%= rs.getString(5) %></p>
                        
							<form method="POST" action="/Online_Cloth_Shop/Customer/addCart.jsp">
                                <input type="hidden" name="item_id" value="<%=rs.getString(1)%>">
                                <input type="hidden" name="user_id"
                                    value="<%=session.getAttribute("mail")!=null?session.getAttribute("mail")+"":"" %>">
                                <%
                                ResultSet rs3=db.getRows("select ProductId from Cart where UserName=? and ProductId=?", session.getAttribute("mail")+"",rs.getString(1));
                                if(rs3.next()){
                                %>    
                                <div class="text-center d-grid gap-2">
                                <button type="submit" disabled class="btn btn-success font-size-12">In the Cart</button>
                               </div>
                                <%
                                }else{
                                %>
                                <div class="text-center d-grid gap-2">
                                <button type="submit" name="Product_submit" class="btn btn-primary  font-size-12">Add to Cart</button>
                                 </div>
                                <%
                                }
                                %>                              
                            </form>

                    </div>
                </div>
            </div>
            
            <%
 }
 %>
            
            </div>
            </div>
            </div>
            

<%@ include file="../footer.jsp"%>