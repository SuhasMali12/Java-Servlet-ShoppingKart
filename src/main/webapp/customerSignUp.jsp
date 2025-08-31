<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
<style>
    body {
        background: #f4f6fb;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        padding: 40px 20px;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }
    .form-container {
        background: #fff;
        padding: 30px 35px;
        border-radius: 15px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        width: 100%;
        max-width: 420px;
    }
    h2 {
        text-align: center;
        color: #1976d2;
        margin-bottom: 25px;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
    }
    label {
        display: block;
        margin-bottom: 6px;
        font-weight: 600;
        color: #374151;
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 18px;
        border: 1px solid #cfd8dc;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 15px;
        transition: border 0.3s;
    }
    input[type="text"]:focus {
        border-color: #1976d2;
        outline: none;
    }
    input[type="submit"] {
        background: #1976d2;
        color: white;
        padding: 12px;
        width: 100%;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
    }
    input[type="submit"]:hover {
        background: #125ea2;
        transform: translateY(-2px) scale(1.03);
    }
    a {
        display: block;
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #1976d2;
        text-decoration: none;
        transition: color 0.2s;
    }
    a:hover {
        text-decoration: underline;
        color: #125ea2;
    }
    .msg-box {
    background-color: #ffe0e0; /* Light red background for error */
    color: #d8000c;            /* Dark red text */
    padding: 12px 16px;
    margin-bottom: 20px;
    border-left: 5px solid #d8000c;
    border-radius: 6px;
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 14px;
    animation: fadeout 3s ease-in-out forwards;
}
/* Optional: Green success styling (you can toggle via logic in JSP) */
/*
.msg-box.success {
    background-color: #e6f4ea;
    color: #2e7d32;
    border-left: 5px solid #2e7d32;
}
*/

@keyframes fadeout {
    0% { opacity: 1; }
    80% { opacity: 1; }
    100% { opacity: 0; display: none; }
}
</style>
</head>
<body>


<div class="form-container">
<% 
    List<String> errorList = (List<String>) request.getAttribute("errorList"); 
    if (errorList != null && !errorList.isEmpty()) {
%>
    <div class="msg-box">
        <ul style="padding-left: 20px; margin: 0;">
        <% for(String err : errorList) { %>
            <li><%= err %></li>
        <% } %>
        </ul>
    </div>
<% } %>

    <h2>Customer Registration</h2>
    <form action="register">
        <label for="id">Id :</label>
        <input type="text" name="id" id="id" placeholder="Enter id">

        <label for="name">Name :</label>
        <input type="text" name="name" id="name" placeholder="Enter name">

        <label for="mobno">Mobno :</label>
        <input type="text" name="mobno" id="mobno" placeholder="Enter mobile number">

        <label for="email">Email :</label>
        <input type="text" name="email" id="email" placeholder="Enter email">

        <label for="username">Username :</label>
        <input type="text" name="username" id="username" placeholder="Enter username">

        <label for="password">Password :</label>
        <input type="text" name="password" id="password" placeholder="Enter password">

        <input type="submit" value="REGISTER">
        <a href="customerLogin.jsp">Already have an account?</a>
    </form>
</div>

</body>
</html>
