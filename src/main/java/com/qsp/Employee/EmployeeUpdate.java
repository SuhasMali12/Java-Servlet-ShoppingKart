package com.qsp.Employee;

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

@WebServlet("/updateEmp")
public class EmployeeUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mobnum = req.getParameter("mobNum");
        String newPass = req.getParameter("newPassword");

        List<String> errorList = new ArrayList<>();

        if (newPass == null || newPass.trim().isEmpty()) {
            errorList.add("Password is required.");
        } else {
            if (newPass.length() < 8 || newPass.length() > 20) {
                errorList.add("Password must be 8–20 characters long.");
            }

            boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false, hasSpace = false;
            String specialChars = "@#$%^&+=!_-";

            for (int i = 0; i < newPass.length(); i++) {
                char ch = newPass.charAt(i);
                if (Character.isUpperCase(ch)) hasUpper = true;
                else if (Character.isLowerCase(ch)) hasLower = true;
                else if (Character.isDigit(ch)) hasDigit = true;
                else if (specialChars.indexOf(ch) != -1) hasSpecial = true;
                else if (Character.isWhitespace(ch)) hasSpace = true;
            }

            if (hasSpace) errorList.add("Password must not contain spaces.");
            if (!hasUpper) errorList.add("Password must include at least one uppercase letter.");
            if (!hasLower) errorList.add("Password must include at least one lowercase letter.");
            if (!hasDigit) errorList.add("Password must include at least one number.");
            if (!hasSpecial) errorList.add("Password must include at least one special character (@#$%^&+=!_-).");
        }

        // If there are validation errors
        if (!errorList.isEmpty()) {
            req.setAttribute("errorList", errorList);
            req.setAttribute("mobNum", mobnum);
            RequestDispatcher rd = req.getRequestDispatcher("employeeUpdatePass.jsp");
            rd.forward(req, resp);
            return;
        }

        // Proceed to update in DB
        try {
            Class.forName("org.postgresql.Driver");

            Connection connection = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

            PreparedStatement statement = connection.prepareStatement(
                "UPDATE employee SET password=? WHERE mobno=?");

            statement.setString(1, newPass);
            statement.setLong(2, Long.parseLong(mobnum));

            int executeUpdate = statement.executeUpdate();

            if (executeUpdate > 0) {
                req.setAttribute("msg", "Password updated successfully.");
                RequestDispatcher rd = req.getRequestDispatcher("employeeLogin.jsp");
                rd.forward(req, resp);
            } else {
                errorList.add("Unable to update password. Try again.");
                req.setAttribute("errorList", errorList);
                req.setAttribute("mobNum", mobnum);
                RequestDispatcher rd = req.getRequestDispatcher("employeeUpdatePass.jsp");
                rd.forward(req, resp);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            errorList.add("Server error occurred.");
            req.setAttribute("errorList", errorList);
            req.setAttribute("mobNum", mobnum);
            RequestDispatcher rd = req.getRequestDispatcher("employeeUpdatePass.jsp");
            rd.forward(req, resp);
        }
    }
}
