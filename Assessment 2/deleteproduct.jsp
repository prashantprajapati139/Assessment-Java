<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
</head>
<body>
    <%
     
        int id = Integer.parseInt(request.getParameter("id"));
       
        try {
            String url = "jdbc:mysql://localhost:3306/epm";
            String username = "root";
            String password = "123456";

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            PreparedStatement statement = connection.prepareStatement("delete from products WHERE id=?");
            statement.setInt(1, id);
            int count = statement.executeUpdate();

            if (count > 0) {
                out.println("Product deleted successfully");
            } else {
                out.println("Failed to delete product");
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
</body>
</html>