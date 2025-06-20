<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="com.db.DBClass"%>
<%
DBClass db= new DBClass();
db.connect();
//itext jar file to be inserted into WEB INF folder
//run report and convert to pdf and returns its bytearray

JasperReport report=JasperCompileManager.compileReport(request.getRealPath("/admin/Reports/")+request.getParameter("report")+".jrxml");
byte[] bytes = JasperRunManager.runReportToPdf(report,null,db.cn);
//set response type as pdf
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream outStream = response.getOutputStream();
outStream.write(bytes, 0, bytes.length); //byte array,startindex,length
outStream.flush();//send response to browser
outStream.close(); //close stream
%>