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
        width: 360px;
        text-align: center;
    }
    h2 {
        margin-bottom: 20px;
        color: #1976d2;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
    }
    h2#success {
        color: green;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
        margin-bottom: 10px;
    }
    .error-box {
        color: #b71c1c;
        background: #ffebee;
        border-left: 5px solid #b71c1c;
        padding: 10px 15px;
        border-radius: 6px;
        font-size: 14px;
        text-align: left;
        margin-bottom: 20px;
        animation: fadeout 6s ease-in-out forwards;
    }
    .error-box ul {
        margin: 0;
        padding-left: 20px;
    }
    @keyframes fadeout {
        0% { opacity: 1; }
        70% { opacity: 1; }
        100% { opacity: 0; display: none; }
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 15px 0;
        border: 1px solid #cfd8dc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 1rem;
    }
    input[type="submit"] {
        width: 95%;
        padding: 10px;
        background: #1976d2;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
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
        String mobStr = String.valueOf(request.getAttribute("mobNum")); // fixed cast issue
    %>

    <% if (errorList != null && !errorList.isEmpty()) { %>
        <div class="error-box">
            <ul>
                <% for (String err : errorList) { %>
                    <li><%= err %></li>
                <% } %>
            </ul>
        </div>
    <% } %>

    <h2 id="success">Customer Found!</h2>
    <h2>Update Password</h2>

    <form action="update">
        <input type="hidden" name="mobNum" value="<%= mobStr %>">
        <input type="text" name="newPassword" placeholder="Enter New Password">
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
