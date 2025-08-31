<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f6fb;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        min-height: 100vh;
        padding: 40px 20px;
        color: #333;
        animation: fadeInBody 0.8s ease-out;
    }

    .navbar {
        width: 100%;
        display: flex;
        justify-content: flex-end;
        background-color: #1976d2;
        padding: 15px 25px;
        position: fixed;
        top: 0;
        left: 0;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        z-index: 10;
    }

    .navbar form {
        margin-left: 15px;
    }

    .navbar input[type="submit"] {
        padding: 10px 20px;
        font-size: 15px;
        font-weight: 600;
        border: none;
        border-radius: 30px;
        cursor: pointer;
        background: #fff;
        color: #1976d2;
        transition: background 0.3s, color 0.3s, transform 0.2s;
    }

    .navbar input[type="submit"]:hover {
        background: #1976d2;
        color: #fff;
        transform: scale(1.05);
    }

    h2, p {
        font-size: 1.5rem;
        margin-bottom: 20px;
        color: #2d2d2d;
        text-align: center;
        margin-top: 100px;
    }

    form.main-action {
        margin: 30px 0;
        width: 100%;
        max-width: 300px;
    }

    form.main-action input[type="submit"] {
        width: 100%;
        padding: 16px 0;
        font-size: 17px;
        font-weight: 600;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        background: #1976d2;
        color: white;
        transition: background 0.3s, transform 0.2s;
        box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);
    }

    form.main-action input[type="submit"]:hover {
        background: #125ea2;
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(21, 101, 192, 0.08);
    }

    @keyframes fadeInBody {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 600px) {
        body {
            padding: 20px;
        }

        .navbar {
            flex-direction: column;
            align-items: flex-end;
        }

        .navbar form {
            margin: 5px 0;
        }
    }
</style>
</head>
<body>

<%
    HttpSession Httpsession = request.getSession();
    String name = (String) Httpsession.getAttribute("name");
    String password = (String) Httpsession.getAttribute("password");
%>

<% if (name != null && password != null) { %>

    <!-- Navigation Bar -->
    <div class="navbar">
        <form action="customerProfile">
            <input type="submit" value="View Profile">
        </form>
        <form action="index.jsp">
            <input type="submit" value="Logout">
        </form>
    </div>

    <!-- Welcome Message -->
    <h2>Welcome, <%= name %>!</h2>
    <p>You successfully logged in.</p>

    <!-- Main Action Button -->
    <form action="getProduct" class="main-action">
        <input type="submit" value="VIEW PRODUCT">
    </form>

<% } else { %>
    <h2>Login First!</h2>
<% } %>

</body>
</html>
