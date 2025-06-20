<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="com.db.DBClass"%>
<%
DBClass db= new DBClass();
db.connect();
String reportname="datewiseapp.jrxml";
//itext jar file to be inserted into WEB INF folder
//run report and convert to pdf and returns its bytearray
HashMap map=new HashMap();
map.put("p1",session.getAttribute("startdate").toString());
map.put("p2",session.getAttribute("enddate").toString());
reportname=request.getRealPath("/admin/Reports/"+reportname);
JasperReport report=JasperCompileManager.compileReport(reportname);
byte[] bytes = JasperRunManager.runReportToPdf(report,map,db.cn);
//set response type as pdf
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream outStream = response.getOutputStream();
outStream.write(bytes, 0, bytes.length); //byte array,startindex,length
outStream.flush();//send response to browser
outStream.close(); //close stream
%>