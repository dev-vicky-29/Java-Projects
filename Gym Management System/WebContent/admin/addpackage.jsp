<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp" %>

<script>
$(function(){
	
	$("#table1").DataTable();
	$("#form1").validate({
		rules:{
			name:{
				required:true
			},
			desc:{
				required:true
			},
			fees:{
				required:true
			}
		},
		messages:{
			name:{
				required:"Set Name to Package"
			},
			desc:{
				required:"Enter Description"
			},
			fees:{
				required:"Add Fees"
			}
		}
	});
	
});

</script>	


<%
String name="",id="",desc="",fees="",btntext="Save";

if(request.getParameter("btn2")!=null)
{
	response.sendRedirect("trainer.jsp");
}
if(request.getParameter("btn1")!=null)
{
	id=request.getParameter("id");
	 name=request.getParameter("name");
	desc=request.getParameter("desc");
	
	fees=request.getParameter("fees");
	 
	 if(request.getParameter("btn1").equals("Save"))
		{
		
			db.execute("Insert into Package(Name,Description,Fees) values(?,?,?)", name,desc,fees);
			out.println("<script> showMsg('Package Details Saved Successfully');</script>");
			id="";
			name="";
			desc="";
			fees="";
		}
		else
		{
			db.execute("Update Package set Name=?,Description=?,Fees=? where Id=?", name,desc,fees,id);
			out.println("<script> showMsg('Package Details Updated Successfully');</script>");
			
		}
	
	
}

if(request.getParameter("eid")!=null)
{
	ResultSet rs=db.getRows("Select * from Package Where Id=?", request.getParameter("eid"));
	if(rs.next())
	{
		  id=rs.getString(1);
		 name=rs.getString(2);
		desc=rs.getString(3);
		fees=rs.getString(4);
		 
	 btntext="Update";
	}
}
if(request.getParameter("did")!=null)
{
	db.execute("Delete From Package Where Id=?",request.getParameterValues("did"));
	out.println("<script>showMsg('  Package Deleted Successfully;');</script>");		

}
%>	

<section style="background-image: url(../images/bg_2.jpg);" style="margin-top:10px"><!--form-->
		<div class="container" >
			<div class="row">
				
				
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<br><h4>Add Package</h4>
						<form name="form1" method="post" id="form1">
							<br><input type="hidden" name="id" class="form-control" placeholder="package id" value="<%=id%>" autocomplete="off"/>
							<br><input type="text" name="name" class="form-control" placeholder="Package Name" autocomplete="off" value="<%=name%>"/>
							<br><textarea name="desc" id="" cols="30" rows="2"   placeholder="Description"><%=desc %></textarea>
							
							<br><input type="text" name="fees" class="form-control" placeholder="fees"  autocomplete="off" value="<%=fees%>"/>
							
							
							
							
							 
							<br><button type="submit" name="btn1" style="display:inline" class="btn btn-default" value="<%=btntext%>"><%=btntext%></button>
							<button type="submit" name="btn2" class="btn btn-default" style="display:inline" value="signup">Reset</button><br>
						<br></form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	<br>
	<div class="container">
	<table id="table1"  class="table table-bordered">
						<thead>
						<tr>
						<td>Package Id>
						<td>Package Name</td>
						<td>Description</td>
						<td>Fees</td>
						<td>Action</td>
						</tr>
						</thead>
						<tbody>
						<%
						ResultSet rs1=db.getRows("select * from Package");
						while(rs1.next())
						{
						%>
						<tr>
						<td><%=rs1.getString(1) %></td>
						<td><%=rs1.getString(2) %></td>
						<td><%=rs1.getString(3) %></td>
						<td><%=rs1.getString(4) %></td>
						
						<td>
						<a href="?eid=<%=rs1.getString(1) %>" class="btn btn-primary">Edit</a>&nbsp;
						<a href="?did=<%=rs1.getString(1) %>" class="btn btn-primary">Delete</a>
						</td>
						</tr>
						
						<%
						}
						%>
						</tbody>
						</table>
						</div>
	<br>
	
<%@ include file="afooter.jsp" %>