<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <style>
        body {
            background: #f4f6fb;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }
        .navbar {
            background: #1976d2;
            padding: 15px 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        }
        .navbar form {
            display: inline-block;
        }
        .navbar input[type="submit"] {
            background: #fff;
            color: #1976d2;
            padding: 10px 20px;
            font-size: 15px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s, color 0.3s, transform 0.2s;
        }
        .navbar input[type="submit"]:hover {
            background: #1976d2;
            color: #fff;
            transform: scale(1.05);
        }
        .container {
            margin: 60px auto;
            max-width: 400px;
            background: #fff;
            padding: 40px 30px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        }
        .container input[type="submit"] {
            width: 100%;
            background: #1976d2;
            color: #fff;
            border: none;
            padding: 14px;
            font-size: 16px;
            margin: 15px 0;
            border-radius: 25px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }
        .container input[type="submit"]:hover {
            background: #125ea2;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(21, 101, 192, 0.08);
        }
        h2#p-msg, h2#r-msg {
            text-align: center;
            color: #388e3c;
            background: #e8f5e9;
            margin: 20px auto;
            width: 60%;
            border-radius: 8px;
            padding: 12px;
            font-family: 'Segoe UI Semibold', Arial, sans-serif;
        }
    </style>
</head>
<body>

<%
    HttpSession Httpsession = request.getSession();
    String email = (String) Httpsession.getAttribute("email");
    String password = (String) Httpsession.getAttribute("password");
%>

<% if (email != null && password != null) { %>

    <!-- Navbar -->
<div class="navbar">
    <div style="display: flex; justify-content: flex-end;">
        <form action="display">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="submit" value="My Profile">
        </form>
    </div>
</div>


    <!-- Flash Messages -->
    <%
        String msgProd = (String) request.getAttribute("msgProd");
        if (msgProd != null) {
    %>
        <h2 id="p-msg"><%= msgProd %></h2>
    <% } %>

    <%
        String msgRemove = (String) request.getAttribute("remove");
        if (msgRemove != null) {
    %>
        <h2 id="r-msg"><%= msgRemove %></h2>
    <% } %>
    
    <%
        String Nmsg = (String) request.getAttribute("nmsg");
        if (Nmsg != null) {
    %>
        <h2 id="p-msg"><%= Nmsg %></h2>
    <% } %>
    
    <%
        String Bmsg = (String) request.getAttribute("bmsg");
        if (Bmsg != null) {
    %>
        <h2 id="p-msg"><%= Bmsg %></h2>
    <% } %>
    
    <%
        String Pmsg = (String) request.getAttribute("pmsg");
        if (Pmsg != null) {
    %>
        <h2 id="p-msg"><%= Pmsg %></h2>
    <% } %>

    <!-- Main Button Container -->
    <div class="container">
        <form action="addProduct.jsp">
            <input type="submit" value="Add Product">
        </form>

        <form action="updateProduct.jsp">
            <input type="submit" value="Update Product">
        </form>

        <form action="removeProduct.jsp">
            <input type="submit" value="Remove Product">
        </form>

        <form action="getAllProd">
            <input type="submit" value="Get All Products">
        </form>
        
        <form action="employeeLogin.jsp">
    <input type="submit" value="Sign Out" style="width: 60%; padding: 10px; font-size: 14px;">
</form>
    </div>

<% } else {
    response.sendRedirect("employeeLogin.jsp");
} %>
<script>
    window.onload = function () {
        setTimeout(function () {
            const pMsg = document.getElementById("p-msg");
            const rMsg = document.getElementById("r-msg");
            
            if (pMsg) pMsg.style.display = "none";
            if (rMsg) rMsg.style.display = "none";
        }, 3000); // 3000ms = 3 seconds
    };
</script>
</body>
</html>
