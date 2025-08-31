<%@ page import="java.util.List" %>
<%@ page import="com.qsp.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>

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
        max-width: 600px;
        margin: 30px auto;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
        color: #333;
        font-weight: normal;
        border-bottom: 1px solid #ddd;
        padding-bottom: 5px;
        margin-bottom: 20px;
        text-align: center;
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

    .no-data {
        text-align: center;
        margin-top: 100px;
        font-size: 22px;
        color: #c0392b;
    }

    .back-btn {
        text-align: center;
        margin-top: 40px;
    }

    .back-btn form {
        display: inline-block;
    }

    .back-btn button {
        background-color: #1976d2;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    .back-btn button:hover {
        background-color: #125ea2;
    }
</style>

</head>
<body>

<%
    List<Customer> arrayList = (List<Customer>) request.getAttribute("customerList");

    if (arrayList != null && !arrayList.isEmpty()) {
        for (Customer c : arrayList) {
%>
    <div class="container">
        <h2>Customer Details</h2>
        <div class="item"><span class="label">ID:</span><span class="value"><%= c.getId() %></span></div>
        <div class="item"><span class="label">Name:</span><span class="value"><%= c.getName() %></span></div>
        <div class="item"><span class="label">Mobile No:</span><span class="value"><%= c.getMobno() %></span></div>
        <div class="item"><span class="label">Email:</span><span class="value"><%= c.getEmail() %></span></div>
        <div class="item"><span class="label">Username:</span><span class="value"><%= c.getUsername() %></span></div>
    </div>
<%
        }
    } else {
%>
    <div class="no-data">Unable to load customer data!</div>
<%
    }
%>

<div class="back-btn">
    <form action="customerHome.jsp">
        <button type="submit">Back to Home</button>
    </form>
</div>

</body>
</html>
