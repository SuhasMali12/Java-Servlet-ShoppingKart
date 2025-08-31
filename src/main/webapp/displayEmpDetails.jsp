<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Details</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 40px;
    }

    .container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        max-width: 500px;
        margin: auto;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
        color: #333;
        font-weight: normal;
        border-bottom: 1px solid #ddd;
        padding-bottom: 5px;
        margin-bottom: 20px;
    }

    .label {
        font-weight: bold;
        color: #555;
    }

    .value {
        margin-left: 10px;
        color: #000;
    }

    .item {
        margin-bottom: 15px;
    }
</style>

</head>
<body>
<%
    String id = String.valueOf(request.getAttribute("id"));
    String name = String.valueOf(request.getAttribute("name"));
    String mobno = String.valueOf(request.getAttribute("mobno"));
    String role = String.valueOf(request.getAttribute("role"));
    String sal = String.valueOf(request.getAttribute("sal"));
    String mail = String.valueOf(request.getAttribute("mail"));
%>

<div class="container">
    <div class="item"><span class="label">ID:</span><span class="value"><%= id %></span></div>
    <div class="item"><span class="label">Name:</span><span class="value"><%= name %></span></div>
    <div class="item"><span class="label">Mobile No:</span><span class="value"><%= mobno %></span></div>
    <div class="item"><span class="label">Role:</span><span class="value"><%= role %></span></div>
    <div class="item"><span class="label">Salary:</span><span class="value"><%= sal %></span></div>
    <div class="item"><span class="label">Email:</span><span class="value"><%= mail %></span></div>
    
    <div style="text-align: center; margin-top: 30px;">
        <form action="employeeHome.jsp" method="get">
            <button type="submit" style="
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            ">
                Back to Home
            </button>
        </form>
    </div>
    
</div>

</body>
</html>
