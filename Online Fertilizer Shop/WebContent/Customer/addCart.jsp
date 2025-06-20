<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%
    DataAccess db = new DataAccess();
    Object id = session.getAttribute("item_id");

    if (id != null) {
        // Fetch product details based on item_id from session
        ResultSet rs = db.getRows("SELECT * FROM Product WHERE ProductID=?", id);
        rs.next();
        
        String pid = rs.getString("ProductID"); // Use column name for better clarity
        String pname = rs.getString("ProductName");
        String priceString = rs.getString("OPrice"); // Use OPrice as the correct price column
        double price = Double.parseDouble(priceString); // Convert price to double
        int qty = 1;
        double total = price * qty; // Use double for total to handle decimal calculations
        String totalString = String.valueOf(total); // Convert total to string

        String pimg = rs.getString("ProductImage");
        String mail = session.getAttribute("mail") + "";

        // Insert into cart table
        db.executeSql("INSERT INTO cart (ProductID, ProductName, Price, Qty, Total, ProductImage, UserName) VALUES(?,?,?,?,?,?,?)", pid, pname, price, qty, total, pimg, mail);

        // Redirect to the cart page
        response.sendRedirect("/Online_Fertilizer_Shop/Customer/cart.jsp");
    } else {
        // If the item_id is passed as a request parameter
        id = request.getParameter("item_id");
        if (id != null) {
            // Fetch product details based on item_id from the request
            ResultSet rs = db.getRows("SELECT * FROM Product WHERE ProductID=?", id);
            rs.next();
            
            String pid = rs.getString("ProductID"); // Use column name for better clarity
            String pname = rs.getString("ProductName");
            String priceString = rs.getString("OPrice"); // Use OPrice as the correct price column
            double price = Double.parseDouble(priceString); // Convert price to double
            int qty = 1;
            double total = price * qty; // Use double for total to handle decimal calculations
            String totalString = String.valueOf(total); // Convert total to string

            String pimg = rs.getString("ProductImage");
            String mail = session.getAttribute("mail") + "";

            // Insert into cart table
            db.executeSql("INSERT INTO cart (ProductID, ProductName, Price, Qty, Total, ProductImage, UserName) VALUES(?,?,?,?,?,?,?)", pid, pname, price, qty, total, pimg, mail);

            // Redirect to the cart page
            response.sendRedirect("/Online_Fertilizer_Shop/Customer/cart.jsp");
        }
    }
%>
