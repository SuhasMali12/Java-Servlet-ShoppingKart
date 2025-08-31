<%-- Importing the classes used in following jsp file --%>
<%@ page import="java.util.List"%>
<%@ page import="com.qsp.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #ffffff;
        padding: 40px 20px;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        animation: fadeInBody 0.8s ease-out;
    }

    h2 {
        font-size: 2rem;
        margin-bottom: 30px;
        color: #1976d2;
    }

    @keyframes fadeInBody {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    table {
        width: 90%;
        max-width: 800px;
        border-collapse: collapse;
        background-color: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.5s ease-out;
    }

    th, td {
        padding: 14px 20px;
        text-align: center;
        font-size: 15px;
    }

    th {
        background-color: #1976d2;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f4f6fb;
    }

    tr:hover {
        background-color: #e3f2fd;
    }

    td {
        color: #333;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .no-data {
        background-color: #fff3cd;
        color: #856404;
        font-weight: 500;
        padding: 12px 24px;
        border-radius: 8px;
        box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
    }

    .back-btn {
        margin-top: 40px;
        text-align: center;
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

<h2>Product Records</h2>

<%
    List<Item> arrayList = (List<Item>) request.getAttribute("ProductList");

    if (arrayList != null && !arrayList.isEmpty()) {
%>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>BRAND</th>
                <th>PRICE</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Item i : arrayList) {
        %>
            <tr>
                <td><%= i.getId() %></td>
                <td><%= i.getName() %></td>
                <td><%= i.getBrand() %></td>
                <td><%= i.getPrice() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
<%
    } else {
%>
    <div class="no-data">No product data found.</div>
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
