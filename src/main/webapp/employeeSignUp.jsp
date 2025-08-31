<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>

<style>
    body {
        background: #f4f6fb;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        padding: 40px 20px;
        min-height: 100vh;
        overflow-x: hidden;
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
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #cfd8dc;
        border-radius: 6px;
        font-size: 15px;
        box-sizing: border-box;
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
        font-size: 16px;
        width: 100%;
        border: none;
        border-radius: 6px;
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
        color: #1976d2;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.2s;
    }
    a:hover {
        color: #125ea2;
        text-decoration: underline;
    }
    @media (max-height: 600px) {
        body {
            align-items: flex-start;
        }
    }
</style>
</head>
<body>

<div class="form-container">
<%@ page import="java.util.List" %>
<%
    List<String> errorList = (List<String>) request.getAttribute("errorList");
    String successMsg = (String) request.getAttribute("msg");
%>

<% if (errorList != null) { %>
    <div style="background:#ffe0e0; color:#b20000; padding:12px; border-left:5px solid red; border-radius:5px; margin-bottom:15px;">
        <ul style="margin:0; padding-left:20px;">
            <% for (String err : errorList) { %>
                <li><%= err %></li>
            <% } %>
        </ul>
    </div>
<% } else if (successMsg != null) { %>
    <div style="background:#e0ffe0; color:#006400; padding:12px; border-left:5px solid green; border-radius:5px; margin-bottom:15px;">
        <%= successMsg %>
    </div>
<% } %>

    <h2>Employee Registration</h2>
    <form action="registerEmp">
        <label for="id">ID</label>
        <input type="text" name="id" id="id" placeholder="Enter ID">

        <label for="name">Name</label>
        <input type="text" name="name" id="name" placeholder="Enter name">

        <label for="mobno">Mobile No</label>
        <input type="text" name="mobno" id="mobno" placeholder="Enter mobile number">

        <label for="role">Role</label>
        <input type="text" name="role" id="role" placeholder="Enter role">

        <label for="sal">Salary</label>
        <input type="text" name="sal" id="sal" placeholder="Enter salary">

        <label for="email">Email</label>
        <input type="text" name="email" id="email" placeholder="Enter email">

        <label for="password">Password</label>
        <input type="text" name="password" id="password" placeholder="Enter password">

        <input type="submit" value="REGISTER">
        <a href="employeeLogin.jsp">Already have an account?</a>
    </form>
</div>

</body>
</html>
