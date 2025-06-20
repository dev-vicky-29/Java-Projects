<%@ page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String UserType="", UserID="", UserName="", email="", address="", CollectRoute="", mobile="";
if(request.getParameter("btnadd")!=null) 
{
     UserType = "Collector"; // Set UserType to "Collector" as it's fixed
     UserID = request.getParameter("txtid");
     UserName = request.getParameter("txtuser");
     email = request.getParameter("txtemail");
     address = request.getParameter("txtaddress");
     CollectRoute = request.getParameter("txtroute");
     mobile = request.getParameter("txtmobile");
    String pass = request.getParameter("txtpass");
    
    ResultSet rs = db.getRows("select * from collectorlogin where CollectorID=?", UserID);
    if(rs.next()){
        errorMsg="Collector ID is Already Taken... Use Another One!";
    } else {
        db.executeSql("Insert into collectorlogin(UserType,CollectorID,UserName,EmailId,Address,MilkCollectRoute,MobileNo,Password) values(?,?,?,?,?,?,?,?)", UserType, UserID, UserName, email, address, CollectRoute, mobile, pass);
        successMsg=UserName+" Is Successfully Registered Kalpraj Dairy Farm as a Collector";
    }
}
%>
<!-- Login page specific contents -->
<div class="container">
    <form method="post" id="form1" class="form custom-border mt-8 rounded">
        <div class="col-5 offset-3">
            <br>
            <br>
            <h2 class="text-center">Add Collector</h2>
            <div class="form-group">
                User Type
                <input type="text" name="txtusertype" id="txtusertype" class="form-control" value="Collector" readonly />
            </div>
            <div class="form-group">
                Collector ID
                <input type="text" name="txtid" id="txtid" class="form-control" placeholder="Enter User ID" value="Collector-<%=UserID%>" autofocus />
            </div>
            <div class="form-group">
                Collector Name
                <input type="text" name="txtuser" id="txtuser" value="<%=UserName%>" class="form-control" placeholder="Enter User name" />
            </div>
            <div class="form-group">
                Email Address
                <input type="text" name="txtemail" id="txtemail" value="<%=email%>" class="form-control" placeholder="Enter Email address" />
            </div>
            <div class="form-group">
                Address
                <input type="text" name="txtaddress" id="txtaddress" value="<%=address%>" class="form-control" placeholder="Enter address" />
            </div>
            <div class="form-group">
                Milk Collecting Route
                <input type="text" name="txtroute" id="txtroute" value="<%=CollectRoute%>" class="form-control" placeholder="Enter Milk Collecting Route" />
            </div>
            <div class="form-group">
                Mobile No.
                <input type="text" name="txtmobile" id="txtmobile" value="<%=mobile%>" class="form-control" placeholder="Enter Mobile Number" />
            </div>
            <div class="form-group">
                Password
                <input type="password" name="txtpass" id="txtpass"  class="form-control" placeholder="Enter Password" />
            </div>
            <div class="form-group">
                Confirm Password
                <input type="password" name="txtcpass" id="txtcpass"  class="form-control" placeholder="Confirm Password" />
            </div>
            <br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnadd" value="Add Collector" class="btn btn-lg btn-primary" />
            </div>
        </div>
    </form>
</div>
<%@ include file="../footer.jsp"%> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script>
$(function(){
    $("#form1").validate({
        rules:{
            txtid:{
                required:true                
            },
            txtuser:{
                required:true                
            },
            txtemail:{
                required:true,
                email:true
            },
            txtaddress:{
                required:true                
            },
            txtroute:{
                required:true                
            },
            txtmobile:{
                required:true,
                pattern:/^\d{10}$/
            },
            txtpass:{
                required:true,
            },
            txtcpass:{
                required:true,
                equalTo:"#txtpass"
            }

        },
        messages:{
            txtid:{
                required:"Collector ID is required"                    
            },
            txtuser:{
                required:"Collector Name is required"                
            },
            txtemail:{
                required:"Email ID is required",
                email:"Invalid email ID"
            },
            txtaddress:{
                required:"Address is required"                            
            },
            txtroute:{
                required:"Milk Collecting Route is required"                            
            },
            txtmobile:{
                required:"Mobile number is required",
                pattern:/^\d{10}$/
            },
            txtpass:{
                required:"Password is required"
            },
            txtcpass:{
                required:" Confirm Password is required",
                equalTo:"Password Mismatch"
            }

        }
    });
});     
</script>
