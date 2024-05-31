<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style type="text/css">
    
    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

form {
    margin-top: 20px;
}

input[type="text"],
textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #fff;
    border: none;
    padding: 15px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.hidden {
    display: none;
}

.error {
    color: red;
    margin-top: 10px;
}

    
    </style>
</head>
<body>
    <h1>Edit Product</h1>
    <%
        // Retrieve the product ID from the request
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Retrieve the product details from the database based on the ID
        try {
            String url = "jdbc:mysql://localhost:3306/epm";
            String username = "root";
            String password = "123456";

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            String sql = "select * from products where id=" + id;
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                // Display the current details of the product in input fields
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                String model = resultSet.getString("model");
                String price = resultSet.getString("price");
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                %>
                <form action="Upadteproduct.jsp" method="post">
                    <input type="hidden" name="id" value="<%= id %>">
                    Name: <input type="text" name="name" value="<%= name %>"><br>
                    Category: <input type="text" name="category" value="<%= category %>"><br>
                    Model: <input type="text" name="model" value="<%= model %>"><br>
                    Price: <input type="text" name="price" value="<%= price %>"><br>
                    Description: <textarea name="description"><%= description %></textarea><br>
                    Image: <input type="text" name="image" value="<%= image %>"><br>
                    <input type="submit" value="Update">
                </form>
                <%
            } else {
                out.println("Product not found");
            }
            // Close JDBC objects
            resultSet.close();
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
</body>
</html>