<%@ page import="java.util.List" %>
<%@ page import="com.qsp.Product.Product" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    body {
        background: #f4f6fb;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        min-height: 100vh;
    }
    table {
        border-collapse: collapse;
        width: 70%;
        margin: 20px auto;
        background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        border-radius: 8px;
        overflow: hidden;
    }
    th, td {
        border: 1px solid #e0e0e0;
        padding: 10px 14px;
        text-align: left;
    }
    th {
        background: #e3eaf6;
        color: #1976d2;
        font-weight: 600;
        font-family: 'Segoe UI Semibold', Arial, sans-serif;
    }
    tr:nth-child(even) {
        background: #f7fafd;
    }
    button, input[type="submit"] {
        background: #1976d2;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 10px 24px;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
        margin-top: 8px;
    }
    button:hover, input[type="submit"]:hover {
        background: #125ea2;
        transform: translateY(-2px) scale(1.03);
    }
</style>

</head>
<body>
	
	<%
        List<Product> prodList = (List<Product>) request.getAttribute("productList");
        if (prodList != null && !prodList.isEmpty()) {
    %>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
        </tr>
        <%
            for (Product p : prodList) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getBrand() %></td>
            <td><%= p.getPrice() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
        <p style="text-align:center;">No products found.</p>
    <%
        }
    %>
    <br><br>
    <div style="text-align: center; margin-top: 40px;">
    <form action="employeeHome.jsp">
    <button type="submit" style="
        background: linear-gradient(to right, #2196f3, #0d47a1);  /* Pure Blue Shades */
        border: none;
        color: white;
        padding: 12px 28px;
        text-align: center;
        font-size: 16px;
        border-radius: 30px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        cursor: pointer;
        transition: all 0.3s ease;
    "
    onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 6px 16px rgba(0,0,0,0.3)'"
    onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 10px rgba(0,0,0,0.2)'">
        Back to Home
    </button>
</form>
</div>

	
</body>
</html>