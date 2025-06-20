<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ include file="header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#form1").validate({
		rules:{
			email:{
				required:true,
				email:true,
				remote:"validuser.jsp"
				},
				message:{
				required:true
				},
				mobile:{
				required:true
				},
				date:{
				required:true
				},
				first:{
					required:true
			   },
			   last:{
					required:true
				}
		},		 
	
		messages:{
			email:{
				required:"please Enter valid emailId ",
				email:"Name allows only chars and spaces",
				remote:"emailid already used"
				},
				message:{
				required:"Required message",
				},
				mobile:{
				required:"Required mobile No",
				},
				date:{
				required:"please Enter password",
				},
				first:{
					required:"Select Gender",
			   },
			   last:{
					required:"Enter your birthDate",
				}
		}	
	});
});

</script>

<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        // STEP 1: CHECK IF FORM DATA IS COMING
        System.out.println("DEBUG: Form submitted!");

        String first = request.getParameter("first");
        String last = request.getParameter("last");
        String mobile = request.getParameter("mobile");
        String date = request.getParameter("date");
        String message = request.getParameter("message");
        String email = request.getParameter("email");

        System.out.println("DEBUG: First Name - " + first);
        System.out.println("DEBUG: Last Name - " + last);
        System.out.println("DEBUG: Mobile - " + mobile);
        System.out.println("DEBUG: Date - " + date);
        System.out.println("DEBUG: Message - " + message);
        System.out.println("DEBUG: Email - " + email);

        if (request.getParameter("btn1") != null) {
            if (first != null && !first.isEmpty() &&
                last != null && !last.isEmpty() &&
                mobile != null && !mobile.isEmpty() &&
                date != null && !date.isEmpty() &&
                message != null && !message.isEmpty() &&
                email != null && !email.isEmpty()) {

                // STEP 2: CONNECT TO DATABASE
                Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL Driver is loaded
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymdb", "root", "VICK2909");

                // STEP 3: PREPARE SQL QUERY
                String sql = "INSERT INTO appointment (FirstName, LastName, Date, Mobile, Message, Email) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, first);
                pstmt.setString(2, last);
                pstmt.setString(3, date);
                pstmt.setString(4, mobile);
                pstmt.setString(5, message);
                pstmt.setString(6, email);

                // STEP 4: EXECUTE QUERY AND CHECK SUCCESS
                int result = pstmt.executeUpdate(); // Returns the number of rows affected

                if (result > 0) {
                    out.println("<script>showMsg('Appointment booked successfully!');</script>");
                } else {
                    out.println("<script>showMsg('Error: Data was not inserted.');</script>");
                }

            } else {
                out.println("<script>showMsg('Error: Please fill all fields.');</script>");
            }
        }
    } catch (Exception e) {
        out.println("<script>showMsg('Database Error: " + e.getMessage() + "');</script>");
        e.printStackTrace(); // Log the error
    } finally {
        // STEP 5: CLOSE RESOURCES
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
%>



<section class="ftco-appointment">
			<div class="overlay"></div>
    	<div class="container-wrap">
    	
    		<div class="row no-gutters d-md-flex align-items-center">
    			<div class="col-md-6 d-flex align-self-stretch img" style="background-image: url(images/about-3.jpg);">
    			</div>
	    		<div class="col-md-6 appointment ftco-animate">
	    			<h3 class="mb-3">Book a Appointment</h3>
	    			<form  class="appointment-form" method="post" id="form1">
	    				<div class="d-md-flex">
		    				<div class="form-group">
		    					<input name="first" type="text"  class="form-control" autocomplete="off" placeholder="First Name">
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<input type="text" name="last" class="form-control"  autocomplete="off" placeholder="Last Name">
		    				</div>
	    				</div>
	    				<div class="d-md-flex">
		    				<div class="form-group">
		    					<div class="input-wrap">
		            		<div class="icon"><span class="ion-md-calendar"></span></div>
		            		<input autocomplete="off" name="date"  type="date" placeholder="Date">
	            		</div>
		    				</div>
		    				
		    				<div class="form-group ml-md-4">
		    					<input type="text" class="form-control"  autocomplete="off" name="mobile" placeholder="Phone">
		    				</div>
	    				</div>
	    				<div class="d-md-flex">
	    					<div class="form-group">
		              <textarea name="message" id="" cols="30" rows="2"  class="form-control" placeholder="Message"></textarea>
		            </div>
		            <div class="form-group ml-md-4">
		    			<input type="email"  class="form-control" name="email" autocomplete="off" placeholder="Email">
		            </div>
	    				</div>
	    				<div class="d-md-flex">
	    					
		            <div class="form-group ml-md-4">
					<input type="submit" name="btn1" class="btn btn-default" value="Submit">
		            </div>
	    				</div>
	    			</form>
	    		</div>    			
    		</div>
    		
    	</div>
    </section>
    
    <section class="ftco-section-services ftco-degree">
    	<div class="container">
    		<div class="row d-flex align-items-center">
    			<div class="col-xl-6 d-flex align-self-stretch">
    				<div class="align-self-stretch"><img src="images/about.jpg" class="img-fluid" alt=""></div>
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
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(images/building.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Body Building</a></h3>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(images/fit.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Fitness</a></h3>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(images/loss.jpg);">
        				<span>Learn More</span>
        			</a>
        			<div class="text mt-3">
        				<h3><a href="#">Weight Loss</a></h3>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6 col-lg-3">
        		<div class="package-program ftco-animate">
        			<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(images/gain.jpg);">
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
						<a href="admin/photos/<%=rs.getString(2) %>" class="gallery image-popup img d-flex align-items-center"  style="background-image: url(admin/photos/<%=rs.getString(2)%>);">
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