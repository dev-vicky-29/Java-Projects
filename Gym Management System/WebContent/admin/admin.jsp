<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp" %>
    
    <section class="ftco-section-services ftco-degree">
    	<div class="container">
    		<div class="row d-flex align-items-center">
    			<div class="col-xl-6 d-flex align-self-stretch">
    				<div class="align-self-stretch"><img src="../images/about.jpg" class="img-fluid" alt=""></div>
    			</div>
    			<div class="col-xl-6 align-self-stretch pt-5">
    				<div class="row justify-content-center mb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		          	<h3 class="subheading">Shape Your Body</h3>
		            <h2 class="mb-4">What We Do?</h2>
		          </div>
		        </div>
    				<div class="services d-flex ftco-animate">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-ruler"></span>
							</div>
							<div class="text ml-5">
								<h3>Analyze Your Goal</h3>
							</div>
  					</div>
  					<div class="services d-flex ftco-animate">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-gym"></span>
							</div>
							<div class="text ml-5">
								<h3>Work Hard On It</h3>
							</div>
  					</div>
  					<div class="services d-flex ftco-animate">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-tools-and-utensils"></span>
							</div>
							<div class="text ml-5">
								<h3>Improve Your Performance</h3>
							</div>
  					</div>
  					<div class="services d-flex ftco-animate">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-abs"></span>
							</div>
							<div class="text ml-5">
								<h3>Achieve Your Perfect Body</h3>
							</div>
  					</div>
    			</div>
    		</div>
    	</div>
    </section>

    


   

	 <section class="ftco-section">
	  	<div class="container-fluid">
	  		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h3 class="subheading">Gym Classes</h3>
            <h2 class="mb-1">Workout Classes</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../images/building.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Body Building</a></h3>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../images/fit.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Fitness</a></h3>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../images/loss.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Weight Loss</a></h3>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../images/gain.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Weigh Gain</a></h3>
        			</div>
        		</div>
        	</div>
        </div>
	  	</div>
	  	
	  </section>


   
		
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

<%@ include file="afooter.jsp" %>