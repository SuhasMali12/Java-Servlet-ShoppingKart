package com.qsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class CustomerRegistration extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String id = req.getParameter("id");
	    String name = req.getParameter("name");
	    String mobno = req.getParameter("mobno");
	    String email = req.getParameter("email");
	    String username = req.getParameter("username");
	    String password = req.getParameter("password");

	    List<String> errors = new ArrayList<>();

	 // --- Name validation ---
	 if (name == null || name.isEmpty()) {
	     errors.add("Name is required.");
	 } else {
	     for (char ch : name.toCharArray()) {
	         if (!Character.isLetter(ch)) {
	             errors.add("Name must contain only letters.");
	             break;
	         }
	     }
	 }

	 // --- Mobile number validation ---
	 if (mobno == null || mobno.length() != 10) {
	     errors.add("Mobile number must be exactly 10 digits.");
	 } else {
	     for (char ch : mobno.toCharArray()) {
	         if (!Character.isDigit(ch)) {
	             errors.add("Mobile number must contain only digits.");
	             break;
	         }
	     }
	 }

	 // --- Email validation ---
	 int atIndex = (email != null) ? email.indexOf('@') : -1;
	 int dotIndex = (email != null) ? email.lastIndexOf('.') : -1;
	 if (email == null || atIndex == -1 || dotIndex == -1 || dotIndex < atIndex) {
	     errors.add("Invalid email format.");
	 }

	 // --- Username validation ---
	 if (username == null || username.length() < 2) {
	     errors.add("Username must be at least 2 characters.");
	 } else {
	     if (Character.isDigit(username.charAt(0))) {
	         errors.add("Username must not start with a number.");
	     }
	     for (char ch : username.toCharArray()) {
	         if (!(Character.isLetterOrDigit(ch) || ch == '_')) {
	             errors.add("Username can only contain letters, digits, and underscores.");
	             break;
	         }
	     }
	     if (username.length() < 4) {
	         errors.add("Username must be at least 4 characters.");
	     }
	 }

	 // --- Password validation ---
	 if (password == null || password.length() < 8) {
	     errors.add("Password must be at least 8 characters long.");
	 } else {
	     boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false, hasSpace = false;
	     for (char ch : password.toCharArray()) {
	         if (Character.isUpperCase(ch)) hasUpper = true;
	         else if (Character.isLowerCase(ch)) hasLower = true;
	         else if (Character.isDigit(ch)) hasDigit = true;
	         else if (ch == ' ') hasSpace = true;
	         else hasSpecial = true;
	     }

	     if (hasSpace) errors.add("Password must not contain spaces.");
	     if (!(hasUpper && hasLower && hasDigit && hasSpecial)) {
	         errors.add("Password must contain at least 1 uppercase, 1 lowercase, 1 digit, and 1 special character.");
	     }
	 }

	 // --- If any error, show them all ---
	 if (!errors.isEmpty()) {
	     req.setAttribute("errorList", errors);
	     req.getRequestDispatcher("customerSignUp.jsp").forward(req, resp);
	     return;
	 }


	    // ✅ All validations passed — insert into DB
	    try {
	        Class.forName("org.postgresql.Driver");
	        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

	        PreparedStatement ps = con.prepareStatement("INSERT INTO customer VALUES(?,?,?,?,?,?)");
	        ps.setInt(1, Integer.parseInt(id));
	        ps.setString(2, name);
	        ps.setLong(3, Long.parseLong(mobno));
	        ps.setString(4, email);
	        ps.setString(5, username);
	        ps.setString(6, password);

	        ps.execute();
	        System.out.println("Customer registered!");

	        req.setAttribute("msg", "Customer registered successfully!");
	        req.getRequestDispatcher("customerPage.jsp").forward(req, resp);

	    } catch (Exception e) {
	        e.printStackTrace();
	        req.setAttribute("msg", "Something went wrong while saving data.");
	        req.getRequestDispatcher("customerRegistration.jsp").forward(req, resp);
	    }
	}

}
