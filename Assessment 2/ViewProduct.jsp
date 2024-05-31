<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Catalog</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 20px auto;
        }

        .message {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .deals {
            background-color: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        th:first-child, td:first-child {
            padding-left: 20px;
        }

        th:last-child, td:last-child {
            padding-right: 20px;
        }

        .no-data {
            text-align: center;
            padding: 20px;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 3px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .btn.edit {
            background-color: #28a745;
        }

        .btn.delete {
            background-color: #dc3545;
        }

        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            <h2>Product List</h2>
        </div>
        <div class="deals">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
                <%
                try {
                    String url = "jdbc:mysql://localhost:3306/epm";
                    String username = "root";
                    String password = "123456";

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(url, username, password);
                    Statement statement = connection.createStatement();
                    String sql = "select * from products";
                    ResultSet resultSet = statement.executeQuery(sql);

                    if (!resultSet.isBeforeFirst()) {
                        out.println("<tr><td colspan='8' class='no-data'>No data found</td></tr>");
                    } else {
                      
                        while(resultSet.next()) {
                            %>
                <tr>
                    <td><%= resultSet.getString("id") %></td>
                    <td><%= resultSet.getString("name") %></td>
                    <td><%= resultSet.getString("category") %></td>
                    <td><%= resultSet.getString("model") %></td>
                    <td><%= resultSet.getString("price") %></td>
                    <td><%= resultSet.getString("description") %></td>
                    <td><img src="<%= resultSet.getString("image") %>"
                        alt="Product Image" style="max-width: 100px; max-height: 100px;"></td>
                    <td>
                        <button class="btn edit" onclick="editProduct(<%= resultSet.getInt("id") %>);">Edit</button>
                        <button class="btn delete" onclick="deleteProduct(<%= resultSet.getInt("id") %>);">Delete</button>
                    </td>
                </tr>
                <%
                        }
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
            </table>
        </div>
    </div>
    <script>
    function editProduct(id) {
        window.location.href = "EditProduct.jsp?id=" + id;
    }

    function deleteProduct(id) {
        if (confirm("Are you sure you want to delete this product?")) {
         
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "delete_product.jsp?id=" + id, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                   
                    location.reload();
                }
            };
            xhr.send();
        }
    }
    
    function deleteProduct(id) {
        if (confirm("Are you sure you want to delete this product?")) {
         
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "deleteproduct.jsp?id=" + id, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                  
                    location.reload();
                }
            };
            xhr.send();
        }
    }
</script>


</body>
</html>
