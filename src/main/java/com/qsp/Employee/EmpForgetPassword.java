package com.qsp.Employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forgetEmp")
public class EmpForgetPassword extends HttpServlet {
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String mobno = req.getParameter("mobno");

        boolean isValid = true;
        String errorMessage = "";

        // Mobile number validation
        if (mobno == null || mobno.isEmpty()) {
            isValid = false;
            errorMessage = "Mobile number is required.";
        } else if (mobno.length() != 10) {
            isValid = false;
            errorMessage = "Mobile number must be exactly 10 digits.";
        } else {
            for (int i = 0; i < mobno.length(); i++) {
                char ch = mobno.charAt(i);
                if (ch < '0' || ch > '9') {
                    isValid = false;
                    errorMessage = "Mobile number must contain only digits.";
                    break;
                }
            }
        }

        // If validation fails
        if (!isValid) {
            req.setAttribute("errorMsg", errorMessage);
            RequestDispatcher rd = req.getRequestDispatcher("employeeForgetPass.jsp");
            rd.forward(req, resp);
            return;
        }

        long mNum = Long.parseLong(mobno);

        try {
            Class.forName("org.postgresql.Driver");

            Connection connection = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

            PreparedStatement statement = connection.prepareStatement("SELECT * FROM employee WHERE mobno=?");

            statement.setLong(1, mNum);

            ResultSet executeQuery = statement.executeQuery();

            if (executeQuery.next()) {
                req.setAttribute("mobNum", mNum);
                RequestDispatcher rd = req.getRequestDispatcher("employeeUpdatePass.jsp");
                rd.forward(req, resp);
            } else {
                req.setAttribute("errorMsg", "Mobile number not found!");
                RequestDispatcher rd = req.getRequestDispatcher("employeeForgetPass.jsp");
                rd.include(req, resp);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "Server error occurred.");
            RequestDispatcher rd = req.getRequestDispatcher("employeeForgetPass.jsp");
            rd.forward(req, resp);
        }
    }
}
