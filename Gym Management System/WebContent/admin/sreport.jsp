<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp" %>

<%


if(request.getParameter("btnsave")!=null)
{
	String startdate=request.getParameter("startdate");
	String enddate=request.getParameter("enddate");
	session.setAttribute("startdate", startdate);
	session.setAttribute("enddate", enddate);
	response.sendRedirect("preports.jsp");

}
	

%>	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-7 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Report</h2>
						<form method="post" name="form1" id="form1" >
						   <table>
						   <tr>
						   <td>Start Date
						   <input type="date" name="startdate" class="form-control"/>
						   </td>
						   <td>End Date
						   	<input type="date" name="enddate" class="form-control"/>
						   </td>
						   <td>
						   <input type="submit" name="btnsave" value="Submit" class="btn btn-primary"/>
						   </td>
						   </tr>
						   </table>
						  
						</form>
						
					</div>
				</div>
				
				
			</div>
		</div>
	</section><!--/form-->
	
<%@ include file="afooter.jsp" %>	
	