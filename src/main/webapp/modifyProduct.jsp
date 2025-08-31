<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Product</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background-color: #f4f6fb;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        padding: 40px 20px;
        color: #333;
    }

    .container {
        background: #ffffff;
        padding: 32px 24px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }

    h2 {
        font-size: 1.5rem;
        margin-bottom: 20px;
        color: #1976d2;
        font-weight: 600; /* semibold like in previous page */
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    input[type="text"] {
        padding: 12px;
        font-size: 15px;
        border-radius: 6px;
        border: 1px solid #ccc;
        outline: none;
        width: 100%;
        font-weight: normal;
    }

    input[type="submit"] {
        padding: 12px;
        font-size: 16px;
        font-weight: 500; /* medium */
        border: none;
        border-radius: 6px;
        cursor: pointer;
        background-color: #1976d2;
        color: white;
        transition: all 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #125ea2;
        transform: scale(1.03);
    }
</style>
</head>
<body>

<div class="container">
    <h2>Modify Product</h2>

<%
    String id = request.getParameter("id");
    String option = request.getParameter("UpdateOption");

    if(option.equalsIgnoreCase("name")){
%>
    <h2>Name Update</h2>
    <form action="modify">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="text" name="name" placeholder="Enter name" required>
        <input type="submit" value="Update">
    </form>

<%
    } else if(option.equalsIgnoreCase("price")){
%>
    <h2>Price Update</h2>
    <form action="modify">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="text" name="price" placeholder="Enter price" required>
        <input type="submit" value="Update">
    </form>

<%
    } else if(option.equalsIgnoreCase("brand")){
%>
    <h2>Brand Update</h2>
    <form action="modify">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="text" name="brand" placeholder="Enter brand" required>
        <input type="submit" value="Update">
    </form>
<%
    }
%>
</div>

</body>
</html>
