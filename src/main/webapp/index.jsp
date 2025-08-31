<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #8360c3, #2ebf91);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: white;
            font-size: 3em;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.5);
            margin-bottom: 50px;
        }

        form {
            margin: 10px;
        }

        input[type="submit"] {
            padding: 15px 40px;
            font-size: 1.1em;
            font-weight: bold;
            border: none;
            border-radius: 30px;
            background-color: #ffffff;
            color: #333;
            cursor: pointer;
            transition: 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        input[type="submit"]:hover {
            background-color: #f1f1f1;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>Welcome to the User Portal</h1>
    
    <form action="customerPage.jsp">
        <input type="submit" value="Customer" />
    </form>

    <form action="employeePage.jsp">
        <input type="submit" value="Employee" />
    </form>
</body>
</html>