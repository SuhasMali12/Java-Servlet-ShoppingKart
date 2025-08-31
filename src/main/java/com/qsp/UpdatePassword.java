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

@WebServlet("/update")
public class UpdatePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String newPass = req.getParameter("newPassword");
        String mobNum = req.getParameter("mobNum");

        System.out.println("New Password: " + newPass);
        System.out.println("Mobile Number: " + mobNum);

        List<String> errorList = new ArrayList<>();

        if (newPass == null || newPass.isEmpty()) {
            errorList.add("Password is required.");
        } else {
            if (newPass.length() < 8 || newPass.length() > 20) {
                errorList.add("Password must be 8–20 characters long.");
            }
            boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false, hasSpace = false;
            String specialChars = "@#$%^&+=!_-";

            for (char ch : newPass.toCharArray()) {
                if (Character.isUpperCase(ch)) hasUpper = true;
                else if (Character.isLowerCase(ch)) hasLower = true;
                else if (Character.isDigit(ch)) hasDigit = true;
                else if (specialChars.indexOf(ch) >= 0) hasSpecial = true;
                else if (ch == ' ') hasSpace = true;
            }

            if (hasSpace) errorList.add("Password must not contain spaces.");
            if (!hasUpper) errorList.add("At least one uppercase letter required.");
            if (!hasLower) errorList.add("At least one lowercase letter required.");
            if (!hasDigit) errorList.add("At least one digit required.");
            if (!hasSpecial) errorList.add("At least one special character (@#$%^&+=!_-) required.");
        }

        if (!errorList.isEmpty()) {
            req.setAttribute("errorList", errorList);
            req.setAttribute("mobNum", mobNum);
            req.getRequestDispatcher("updatePassword.jsp").forward(req, resp);
            return;
        }

        // Update password in DB
        try {
            Class.forName("org.postgresql.Driver");

            Connection connection = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

            PreparedStatement statement = connection.prepareStatement("UPDATE customer SET password = ? WHERE mobno = ?");
            statement.setString(1, newPass);
            statement.setLong(2, Long.parseLong(mobNum));

            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated == 1) {
                RequestDispatcher rd = req.getRequestDispatcher("customerHome.jsp");
                rd.forward(req, resp);
            } else {
                req.setAttribute("errorMsg", "Unable to update password!");
                RequestDispatcher rd = req.getRequestDispatcher("updatePassword.jsp");
                rd.include(req, resp);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "Server error occurred.");
            RequestDispatcher rd = req.getRequestDispatcher("updatePassword.jsp");
            rd.forward(req, resp);
        }
    }
}
