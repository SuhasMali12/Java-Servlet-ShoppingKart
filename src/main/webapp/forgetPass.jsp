<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
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
    .container {
        background: #fff;
        padding: 32px 24px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        width: 350px;
        text-align: center;
    }
    h2#error {
        background: #ffeaea;
        color: #d32f2f;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
    }
    h2 {
        text-align: center;
        color: #1976d2;
        margin-bottom: 25px;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
        }
    input[type="text"] {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
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
</style>
</head>
<body>

<div class="container">
<h2>Forgot Password</h2>
    <%
        String msg = (String) request.getAttribute("errorMsg");
        if (msg != null) {
    %>
        <h2 id="error"><%= msg %></h2>
    <%
        }
    %>

    <form action="forgetPassword">
        <input type="text" name="mobno" placeholder="Enter Mobile Number"><br>
        <input type="submit" value="SUBMIT">
    </form>
</div>

<script type="text/javascript">
    window.onload = function() {
        setTimeout(() => {
            const msg = document.getElementById("error");
            if (msg) {
                msg.style.display = "none";
            }
        }, 3000);
    };
</script>

</body>
</html>
