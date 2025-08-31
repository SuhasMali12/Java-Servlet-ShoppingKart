<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Remove Product</title>
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

        .form-container {
            background: #fff;
            padding: 32px 24px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #1976d2;
            margin-bottom: 25px;
            font-family: 'Segoe UI Semibold', Arial, sans-serif;
        }

        input[type="text"] {
    width: 100%;
    max-width: 100%;
    padding: 12px 15px;
    margin: 12px 0;
    border: 1px solid #cfd8dc;
    border-radius: 8px;
    font-size: 15px;
    transition: border 0.3s;
    box-sizing: border-box;
}


        input[type="text"]:focus {
            border-color: #1976d2;
            outline: none;
            box-shadow: 0 0 8px rgba(25,118,210,0.08);
        }

        input[type="submit"] {
            width: 100%;
            background: #1976d2;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background: #125ea2;
            transform: scale(1.03);
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Remove Product</h2>

        <form action="removeProduct">
            <input type="text" name="id" placeholder="Enter ID">
            <input type="submit" value="Remove Product">
        </form>
    </div>

</body>
</html>
