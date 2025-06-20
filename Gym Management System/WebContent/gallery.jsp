<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>



   <section class="ftco-gallery">
    	<div class="container-wrap">
    		<div class="row no-gutters">
					<div class="col-md-3 ftco-animate">
						<div class="gallery ftco-gradient d-flex justify-content-center align-items-center">
							<div class="row justify-content-center">
			          <div class="col-md-12 heading-section ftco-animate text-center">
			            <h3 class="subheading"></h3>
			            <h2 class="mb-1">Gallery Photo</h2>
			          </div>
			        </div>
		        </div>
					</div>
					<%
	    	    ResultSet rs=db.getRows("Select * from gallery");
	    	     while(rs.next())
	    	     {
	    	    %>
					<div class="col-md-3 ftco-animate">
						<a href="/Gym_Management_System/images/<%=rs.getString(2) %>" class="gallery image-popup img d-flex align-items-center"  style="background-image: url(/Gym_Management_System/images/<%=rs.getString(2)%>);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					 <%
	    	           }
                     %>
					
        </div><!--  -->
    	</div>
    </section>

<%@ include file="footer.jsp" %>