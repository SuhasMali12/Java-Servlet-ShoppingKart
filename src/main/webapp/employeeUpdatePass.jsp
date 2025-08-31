<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

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
        margin-bottom: 20px;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
        color: #1976d2;
    }
    h2#success {
        color: green;
        margin-bottom: 10px;
    }
    ul#errorList {
        background: #ffebee;
        color: #b71c1c;
        border-left: 5px solid #b71c1c;
        padding: 10px 15px;
        border-radius: 6px;
        font-size: 14px;
        margin-bottom: 20px;
        text-align: left;
        animation: fadeout 5s ease-in-out forwards;
    }
    ul#errorList li {
        margin-bottom: 5px;
    }
    @keyframes fadeout {
        0% { opacity: 1; }
        80% { opacity: 1; }
        100% { opacity: 0; display: none; }
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 20px;
        border: 1px solid #cfd8dc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 1rem;
    }
    input[type="submit"] {
        background: #1976d2;
        color: white;
        padding: 10px 25px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
    }
    input[type="submit"]:hover {
        background: #125ea2;
        transform: translateY(-2px) scale(1.03);
    }
</style>

</head>
<body>

<div class="container">
<%
    java.util.List<String> errorList = (java.util.List<String>) request.getAttribute("errorList");
    String mobStr = String.valueOf(request.getAttribute("mobNum")); // Handle Long to String safely

    if (errorList != null && !errorList.isEmpty()) {
%>
    <ul id="errorList">
    <% for (String err : errorList) { %>
        <li><%= err %></li>
    <% } %>
    </ul>
<%
    }
%>

    <h2 id="success">Employee Found!</h2>
    <h2>Update Password</h2>

    <form action="updateEmp">
        <input type="hidden" name="mobNum" value="<%= mobStr %>">
        <input type="text" name="newPassword" placeholder="Enter new password">
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
