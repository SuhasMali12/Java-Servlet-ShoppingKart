<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
    h2#error {
    color: #b71c1c;              /* Dark Red Text */
    background: #ffebee;         /* Light Red Background */
    border-left: 5px solid #b71c1c; /* Left Red Border */
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
h2:not(#error) {
    color: #1976d2; /* Blue */
    margin-bottom: 25px;
    font-family: 'Segoe UI Semibold', Arial, sans-serif;
    font-size: 22px;
    text-align: center;
}

    input[type="text"], input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 8px 0;
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
    .links {
        margin-top: 15px;
    }
    .links a {
        display: inline-block;
        margin: 5px;
        color: #1976d2;
        text-decoration: none;
        transition: color 0.2s;
    }
    .links a:hover {
        color: #125ea2;
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="login-container">
    <%
        String errorMsg = (String) request.getAttribute("errorMsg");
        if (errorMsg != null) {
    %>
        <h2 id="error"><%= errorMsg %></h2>
    <%
        }
    %>
     <h2>Customer Login</h2>
    <form action="login">
        <input type="text" name="username" placeholder="Username"><br>
        <input type="text" name="password" placeholder="Password"><br>
        <input type="submit" value="LOGIN">
    </form>

    <div class="links">
        <a href="customerSignUp.jsp">New User</a><br>
        <a href="forgetPass.jsp">Forget Password?</a>
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
