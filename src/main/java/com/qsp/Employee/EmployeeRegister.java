package com.qsp.Employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registerEmp")
public class EmployeeRegister extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String mobno = req.getParameter("mobno");
        String role = req.getParameter("role");
        String sal = req.getParameter("sal");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        List<String> errors = new ArrayList<>();

        // ID validation
        if (id == null || id.isEmpty() || !id.matches("\\d+")) {
            errors.add("ID must be a valid integer.");
        }

        // Name validation
        if (name == null || name.isEmpty()) {
            errors.add("Name is required.");
        } else {
            if (name.length() < 2 || name.length() > 8)
                errors.add("Name must be 2–8 characters.");
            if (!Character.isLetter(name.charAt(0)))
                errors.add("Name must start with a letter.");
            if (!name.matches("[a-zA-Z ]+"))
                errors.add("Name must contain only letters and spaces.");
        }

        // Mobile number
        if (mobno == null || !mobno.matches("\\d{10}")) {
            errors.add("Mobile number must be exactly 10 digits.");
        }

        // Role validation
        if (role == null || role.trim().isEmpty()) {
            errors.add("Role is required.");
        } else if (!role.matches("[a-zA-Z ]+")) {
            errors.add("Role must only contain letters and spaces.");
        }

        // Salary validation
        if (sal == null || sal.isEmpty() || !sal.matches("\\d+(\\.\\d+)?")) {
            errors.add("Salary must be a valid number.");
        }

        // Email validation
        if (email == null || email.isEmpty() || !email.matches("^\\S+@\\S+\\.\\S+$")) {
            errors.add("Enter a valid email address.");
        }

        // Password validation
        if (password == null || password.isEmpty()) {
            errors.add("Password is required.");
        } else {
            if (password.length() < 8 || password.length() > 20)
                errors.add("Password must be 8–20 characters.");
            if (!password.matches(".*[A-Z].*"))
                errors.add("Password must contain at least one uppercase letter.");
            if (!password.matches(".*[a-z].*"))
                errors.add("Password must contain at least one lowercase letter.");
            if (!password.matches(".*\\d.*"))
                errors.add("Password must contain at least one number.");
            if (!password.matches(".*[@#$%^&+=!_\\-].*"))
                errors.add("Password must contain at least one special character.");
            if (password.contains(" "))
                errors.add("Password must not contain spaces.");
        }

        // Check and forward if errors
        if (!errors.isEmpty()) {
            req.setAttribute("errorList", errors);
            req.getRequestDispatcher("employeeSignUp.jsp").forward(req, resp);
            return;
        }

        // ✅ All Validations Passed: Save to DB
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

            PreparedStatement ps = con.prepareStatement("INSERT INTO employee VALUES (?,?,?,?,?,?,?)");
            ps.setInt(1, Integer.parseInt(id));
            ps.setString(2, name);
            ps.setLong(3, Long.parseLong(mobno));
            ps.setString(4, role);
            ps.setDouble(5, Double.parseDouble(sal));
            ps.setString(6, email);
            ps.setString(7, password);

            ps.execute();
            req.setAttribute("msg", "Employee registered successfully!");
            req.getRequestDispatcher("employeePage.jsp").forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            req.setAttribute("msg", "Server error occurred!");
            req.getRequestDispatcher("employeeSignUp.jsp").forward(req, resp);
        }
    }
}