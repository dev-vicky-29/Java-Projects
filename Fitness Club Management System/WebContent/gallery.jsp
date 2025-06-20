<%@ page import="java.sql.*" %>
<%@ page import="com.util.db.DataAccess" %>
<%@ include file="header.jsp" %>

<%
    ResultSet rs = null;
    try {
        rs = db.getRows("SELECT * FROM gallery ");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>


    <style>
        .gallery-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            padding: 20px;
        }
        .gallery-item {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background: #fff;
            text-align: center;
            transition: transform 0.3s;
        }
        .gallery-item:hover {
            transform: scale(1.05);
        }
        .gallery-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid #ddd;
        }
        .gallery-item h3 {
            margin: 10px 0;
            font-size: 18px;
            color: #333;
        }
    </style>


    <h2 style="text-align:center;">Fitness Club Gallery</h2>

    <div class="gallery-container">
        <% 
            while (rs != null && rs.next()) { 
                String imagePath = "GalleryImages/" + rs.getString("ImagePath"); 
        %>
            <div class="gallery-item">
                <img src="<%= imagePath %>" alt="<%= rs.getString("Title") %>">
                <h3><%= rs.getString("Title") %></h3>
            </div>
        <% } %>
    </div>

<%@ include file="footer.jsp" %>
