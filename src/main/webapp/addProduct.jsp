<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<style>
body {
	background: #f4f6fb;
	font-family: 'Segoe UI', Arial, sans-serif;
	margin: 0;
	padding: 40px 20px;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

.form-container {
	background: #fff;
	padding: 30px 35px;
	border-radius: 15px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.07);
	width: 100%;
	max-width: 420px;
}

h2 {
	text-align: center;
	color: #1976d2;
	margin-bottom: 25px;
}

label {
	display: block;
	margin-bottom: 6px;
	font-weight: 600;
	color: #374151;
}

input[type="text"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 18px;
	border: 1px solid #cfd8dc;
	border-radius: 6px;
	font-size: 15px;
	transition: border 0.3s;
	box-sizing: border-box;
}

input[type="text"].error {
	border-color: #d8000c;
	background: #fff0f0;
}

input[type="submit"] {
	background: #1976d2;
	color: white;
	padding: 12px;
	width: 100%;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 5px;
}

input[type="submit"]:hover {
	background: #125ea2;
}

a {
	display: block;
	text-align: center;
	margin-top: 15px;
	font-size: 14px;
	color: #1976d2;
	text-decoration: none;
}
/* Error Message Box */
.msg-box {
	background-color: #ffe0e0;
	color: #d8000c;
	padding: 12px 16px;
	margin-bottom: 20px;
	border-left: 5px solid #d8000c;
	border-radius: 6px;
	font-size: 14px;
}
/* Success Message Box */
.msg-box.success {
	background-color: #e6f4ea;
	color: #2e7d32;
	border-left: 5px solid #2e7d32;
}
</style>
</head>
<body>

	<div class="form-container">
		<%
		List<String> errorList = (List<String>) request.getAttribute("errorList");
		String msgProd = (String) request.getAttribute("msgProd");

		if (errorList != null && !errorList.isEmpty()) {
		%>
		<div class="msg-box">
			<ul style="padding-left: 20px; margin: 0;">
				<%
				for (String err : errorList) {
				%>
				<li><%=err%></li>
				<%
				}
				%>
			</ul>
		</div>
		<%
		} else if (msgProd != null) {
		%>
		<div class="msg-box success"><%=msgProd%></div>
		<%
		}
		%>

		<h2>Add Product</h2>
		<form action="addProduct" method="get">
			<label for="id">Product ID:</label> <input type="text" name="id"
				id="id" placeholder="Enter product ID"
				class="<%=(errorList != null && errorList.toString().contains("Product ID")) ? "error" : ""%>">

			<label for="name">Product Name:</label> <input type="text"
				name="name" id="name" placeholder="Enter product name"
				class="<%=(errorList != null && errorList.toString().contains("Product Name")) ? "error" : ""%>">


			<label for="brand">Brand:</label><input type="text" name="brand"
				id="brand" placeholder="Enter brand"
				class="<%=(errorList != null && errorList.toString().contains("Brand")) ? "error" : ""%>">

			<label for="price">Price:</label> <input type="text" name="price"
				id="price" placeholder="Enter price"
				class="<%=(errorList != null && errorList.toString().contains("Price")) ? "error" : ""%>">

			<input type="submit" value="ADD PRODUCT"> <a
				href="employeeHome.jsp">Back to Home</a>
		</form>
	</div>

</body>
</html>
