<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="cheader.jsp"%>


<script>
$(function(){ //or $(document).ready(function(){})
	$("#table3").DataTable();
	
});
</script>

 	
    
    
    
   
<!-- Table goes in the document BODY -->
<br>
<h3>Progress Report</h3>
<table id="table3" border="1">
  <thead>
    <tr>
      <th>date</th>
      <th>Weight</th>
      <th >Height</th>
      <th >Chest</th>
      <th >Shoulder</th>
      <th >Upper Abdomen</th>
      <th >Lower Abdomen</th>
      <th >UpperArm</th>
      <th >Forearm</th>
      <th >Hips</th>
      <th >Thigh</th>
      <th >Calf</th>
      <th>Photo</th>
      
    </tr>
  </thead>
  <tbody>
  <%
						ResultSet rs1=db.getRows("select * from Measurment where EmailId=?",session.getAttribute("user")+"");
						while(rs1.next())
						{
						%>
    <tr>
      <th ><%=rs1.getString(14) %></th>
      <td><%=rs1.getString(3) %></td>
      <td><%=rs1.getString(4) %></td>
      <td><%=rs1.getString(5) %></td>
      <th ><%=rs1.getString(6) %></th>
      <td><%=rs1.getString(7) %></td>
      <td><%=rs1.getString(8) %></td>
      <td><%=rs1.getString(9) %></td>
      <th ><%=rs1.getString(10) %></th>
      <td><%=rs1.getString(11) %></td>
      <td><%=rs1.getString(12) %></td>
      <td><%=rs1.getString(13) %></td>
      <td><img src="../admin/Measurment/<%=rs1.getString(2) %>" width="50" height="50" alt="NA" class="img-circle"/></td>
	 
    </tr>
   <%
					   }
						%>
    
  </tbody>
</table>


<%@ include file="cfooter.jsp"%>