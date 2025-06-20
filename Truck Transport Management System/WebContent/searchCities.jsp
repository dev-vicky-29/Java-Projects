<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="application/json" %>
<%@ include file="header.jsp" %>

<%
    String query = request.getParameter("query");
    String jsonResponse = "[";

    // Fetch matching cities from the database
    ResultSet cities = db.getRows("SELECT city_name FROM cities WHERE city_name LIKE ?", "%" + query + "%");
    boolean first = true;

    try {
        while (cities.next()) {
            if (!first) {
                jsonResponse += ",";
            }
            jsonResponse += "\"" + cities.getString("city_name") + "\"";
            first = false;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    jsonResponse += "]";
    out.print(jsonResponse);
%>

<%@ include file="footer.jsp" %>