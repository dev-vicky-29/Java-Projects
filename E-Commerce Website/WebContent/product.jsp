 <%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"  %>
 <link href="/Online_Cloth_Shop/css/product.css" rel="stylesheet">
  <!-- Page Content -->
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content text-center">
              <h4>Our Products</h4>
              <h2>E-Commerce Shop</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
 
 

<div class="row row-cols-1 row-cols-md-3 g-4">
  
  <%
  //Retrive Product list from the database
  ResultSet rs=db.getRows("select * from product  ");
  while(rs.next()){
	  String productId = rs.getString(1);
  
  %>
  <div class="col">
  <div class="card mb-3 h-100">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/E-Commerce_Website/ProductImages/<%= rs.getString(11) %>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title fw-bold"><%= rs.getString(2) %></h5>
        <p class="card-text font-monospace">Product Size: <%= rs.getString(7) %></p>
        <p class="card-text"><small class="text-muted text-decoration-line-through">MRP:- <%= rs.getString(8) %></small></p>
        <p class="card-text"><small class="fw-bold">Discount Price:- <%= rs.getString(9) %></small></p>
        
        <form method="POST" action="/E-Commerce_Website/login.jsp">
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
</div>
</div>

 

<%
 }
 %>
 </div>         
 
  <%@ include file="../footer.jsp"  %>
  
  
  <!-- Place the JavaScript code here -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  $('.add-to-cart').click(function() {
    var productId = $(this).data('product-id');
    $.ajax({
      type: 'POST',
      url: '/Online_Cloth_Shop/addToCart.jsp', // Specify the URL of your server-side script
      data: { productId: productId }, // Pass the product ID to the server
      success: function(response) {
        alert('Product added to cart successfully!');
        // Optionally, update the UI to reflect the addition of the product to the cart
      },
      error: function(xhr, status, error) {
        alert('An error occurred while adding the product to the cart.');
        console.error(error);
      }
    });
  });
});
</script>