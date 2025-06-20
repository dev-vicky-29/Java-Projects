<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%
    DataAccess db = new DataAccess();
    Object id = session.getAttribute("item_id");

    if (id == null) {
        id = request.getParameter("item_id"); // Check if ID is passed via request
    }

    if (id != null) {
        try {
            // Fetch product details from Product table
            ResultSet rs = db.getRows("SELECT * FROM Product WHERE ProductID = ?", id);

            if (rs.next()) {
                // Retrieve values from Product table
                String pid = rs.getString("ProductID");
                String pname = rs.getString("ProductName");
                String priceString = rs.getString("OPrice"); // Use Offer Price (OPrice)
                double price = Double.parseDouble(priceString); // Convert price to double
                int qty = 1; // Default quantity
                double total = price * qty; // Calculate total price
                String pimg = rs.getString("ProductImage");
                String mail = (String) session.getAttribute("mail");

                if (mail != null && !mail.isEmpty()) {
                    // Insert product into Cart table
                    db.executeSql(
                        "INSERT INTO cart (ProductID, ProductName, Price, Qty, Total, ProductImage, UserName) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        pid, pname, price, qty, total, pimg, mail
                    );

                    // Redirect to the cart page
                    response.sendRedirect("/Online_Book_Shop/Customer/cart.jsp");
                } else {
                    out.println("<h3>User not logged in. Please log in to add items to the cart.</h3>");
                }
            } else {
                out.println("<h3>Product not found!</h3>");
            }
        } catch (SQLException e) {
            out.println("<h3>Database error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } catch (NumberFormatException e) {
            out.println("<h3>Price conversion error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<h3>Unexpected error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    } else {
        out.println("<h3>No product selected!</h3>");
    }
%>
