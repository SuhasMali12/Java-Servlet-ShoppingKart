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

    h2 {
        text-align: center;
        color: #1976d2;
        margin-bottom: 25px;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
    }

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

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #cfd8dc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 1rem;
    }

    input[type="submit"] {
        background: #1976d2;
        color: white;
        padding: 10px 25px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
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
    <%
        String msg = (String) request.getAttribute("errorMsg");
        if (msg != null) {
    %>
        <h2 id="error"><%= msg %></h2>
    <%
        }
    %>
    <h2>Forget Password</h2>

    <form action="forgetEmp">
        <input type="text" name="mobno" placeholder="Enter mobile number">
        <input type="submit" value="SUBMIT">
    </form>
</div>

<script type="text/javascript">
    window.onload = function () {
        setTimeout(() => {
            var msg = document.getElementById("error");
            if (msg) {
                msg.style.display = "none";
            }
        }, 3000);
    };
</script>

</body>
</html>
