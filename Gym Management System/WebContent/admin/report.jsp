<%@page import="com.db.DBClass"%>

<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>

<%
DBClass db=new DBClass();
//Connect to Database
db.connect();
//run report and convert to pdf and returns its byte array
//JasperReport rpt=JasperCompileManager.compileReport(request.getRealPath("/admin/reports/")+request.getParameter("page")+".jrxml");
JasperReport rpt=JasperCompileManager.compileReport(request.getRealPath("/admin/Reports/")+request.getParameter("page")+".jrxml");
byte[] bytes = JasperRunManager.runReportToPdf(rpt,null,db.cn);
db.close();
response.setContentType("application/pdf"); //MIME Type
response.setContentLength(bytes.length);
ServletOutputStream outStream = response.getOutputStream();
outStream.write(bytes, 0, bytes.length); //byte array,startindex,length
outStream.flush();//send response to browser
outStream.close(); //close stream

%>