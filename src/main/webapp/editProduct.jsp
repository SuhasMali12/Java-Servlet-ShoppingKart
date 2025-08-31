<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
<style>
    body {
        background: #f4f6fb;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container {
        background: #fff;
        padding: 32px 24px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        width: 350px;
        text-align: center;
    }
    h2 {
        color: #008000;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
        margin-bottom: 20px;
    }
    #text{
        color: #1976d2;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
        margin-bottom: 20px;
    }
    button, input[type="submit"] {
        background: #1976d2;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 10px 24px;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
        margin-top: 8px;
    }
    button:hover, input[type="submit"]:hover {
        background: #125ea2;
        transform: translateY(-2px) scale(1.03);
    }
    select {
        width: 100%;
        padding: 10px;
        font-size: 1rem;
        border-radius: 4px;
        border: 1px solid #ccc;
    }
</style>

</head>
<body>
<div class="container" >
	<h2>--Product Found--</h2>
	<h2 id="text">Select What you want to Update?</h2>
	<form action="modifyProduct.jsp">
	<select name="UpdateOption">
	<option>Name</option>
	<option>Price</option>
	<option>Brand</option>
	</select>
	<br><br>
	<input type="submit" value="Click">
	</form>
	</div>
</body>
</html>