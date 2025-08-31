<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Login</title>

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

    .login-container {
        background: #fff;
        padding: 32px 24px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        width: 350px;
        text-align: center;
    }

    h2 {
        text-align: center;
        color: #1976d2;
        margin-bottom: 25px;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
    }

    /* Error Message Styling */
    h2#error {
        color: #b71c1c;                /* Dark red text */
        background: #ffebee;           /* Light red background */
        border-left: 5px solid #b71c1c; /* Red left border */
        padding: 10px 15px;
        border-radius: 6px;
        font-size: 15px;
        margin-bottom: 20px;
        text-align: left;
        animation: fadeout 4s ease-in-out forwards;
    }

    @keyframes fadeout {
        0% { opacity: 1; }
        70% { opacity: 1; }
        100% { opacity: 0; display: none; }
    }

    input[type="text"], input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #cfd8dc;
        border-radius: 5px;
        font-size: 1rem;
    }

    input[type="submit"] {
        background: #1976d2;
        color: white;
        border: none;
        padding: 10px 20px;
        margin-top: 15px;
        cursor: pointer;
        border-radius: 5px;
        font-size: 16px;
        width: 100%;
        transition: background 0.3s, transform 0.2s;
    }

    input[type="submit"]:hover {
        background: #125ea2;
        transform: translateY(-2px) scale(1.03);
    }

    .links {
        margin-top: 20px;
    }

    .links a {
        display: block;
        color: #1976d2;
        text-decoration: none;
        margin: 5px 0;
        font-size: 14px;
        transition: color 0.2s;
    }

    .links a:hover {
        color: #125ea2;
        text-decoration: underline;
    }
</style>

</head>
<body>

<%
    String errorMsg = (String) request.getAttribute("errorMsg");
%>

<div class="login-container">
    <% if(errorMsg != null) { %>
        <h2 id="error"><%= errorMsg %></h2>
    <% } %>

    <h2>Employee Login</h2>
    <form action="loginEmp">
        <input type="text" name="email" placeholder="Email"><br>
        <input type="password" name="password" placeholder="Password"><br>
        <input type="submit" value="LOGIN">
    </form>

    <div class="links">
        <a href="employeeSignUp.jsp">New Employee</a>
        <a href="employeeForgetPass.jsp">Forgot Password?</a>
    </div>
</div>

<script type="text/javascript">
    window.onload = function(){
        setTimeout(() => {
            var msg = document.getElementById("error");
            if(msg){
                msg.style.display = "none";
            }
        }, 3000);
    };
</script>

</body>
</html>
