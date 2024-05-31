<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
   <!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style type="text/css">
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
}

.container {
    width: 50%;
    margin: auto;
}

h1 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.btn {
    display: inline-block;
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn:hover {
    background-color: #0056b3;
}
    
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Product</h1>
        <form action="Home" method="post" enctype="multipart/form-data">
        <div class="form-group">
                <label for="name">Id:</label>
                <input type="text" id="name" name="Id" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="productName" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="productCategory" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="model">Model:</label>
                <input type="text" id="model" name=productModel class="form-control"/>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="productDescription" class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="productImage" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
</body>
</html>
   