<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style type="text/css">
    .view-link {
    display: inline-block;
    background-color: #4caf50;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 20px;
    transition: background-color 0.3s;
    border: none;
    cursor: pointer;
    font-size: 16px;
    outline: none;
}

.view-link:hover {
    background-color: #45a049;
}
    
    </style>
</head>
<body>
    <%
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String model = request.getParameter("model");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        
        
        try {
            String url = "jdbc:mysql://localhost:3306/epm";
            String username = "root";
            String password = "123456";

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            PreparedStatement statement = connection.prepareStatement("UPDATE products SET name=?, category=?, model=?, price=?, description=?, image=? WHERE id=?");
            statement.setString(1, name);
            statement.setString(2, category);
            statement.setString(3, model);
            statement.setString(4, price);
            statement.setString(5, description);
            statement.setString(6, image);
            statement.setInt(7, id);
            int count = statement.executeUpdate();

            if (count > 0) {
                out.println("Product updated successfully");
            } else {
                out.println("Failed to update product");
            }
            
            statement.close();
            connection.close();
        } catch (SQLException e) {
            out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            out.println("Class not found: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            out.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }
        
    %>
    <a href="ViewProduct.jsp?id=<%= id %>" class="view-link">View Updated Product</a>
    
    
</body>
</html>