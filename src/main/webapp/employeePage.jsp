<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>

<style>
    body {
        background: #e3f2fd;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.3);
        padding: 30px 40px;
        border-radius: 18px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        width: 320px;
        text-align: center;
        background-image: linear-gradient(145deg, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0.05) 100%);
    }

    h1 {
        color: #0d47a1;
        font-size: 2.2em;
        margin-bottom: 25px;
        white-space: nowrap; /* ensures single line */
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
    }

    h2 {
        color: #444;
        margin-bottom: 20px;
        font-size: 18px;
    }

    input[type="submit"] {
        padding: 12px 25px;
        border: none;
        border-radius: 8px;
        font-size: 15px;
        margin: 10px 0;
        width: 100%;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
        color: #fff;
    }

    form[action="employeeSignUp.jsp"] input[type="submit"] {
        background: #00bcd4;
    }

    form[action="employeeLogin.jsp"] input[type="submit"] {
        background: #1976d2;
    }

    input[type="submit"]:hover {
        transform: translateY(-2px) scale(1.03);
        opacity: 0.95;
    }
</style>

</head>
<body>

<div class="container">
    <h1>Welcome, Employee</h1>

    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <h2><%= msg %></h2>
    <%
        }
    %>

    <form action="employeeSignUp.jsp">
        <input type="submit" value="Sign Up">
    </form>

    <form action="employeeLogin.jsp">
        <input type="submit" value="Sign In">
    </form>
</div>

</body>
</html>