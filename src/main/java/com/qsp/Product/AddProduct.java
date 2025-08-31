package com.qsp.Product;

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

@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String brand = req.getParameter("brand");
        String price = req.getParameter("price");

        List<String> errorList = new ArrayList<>();

        // === Validations ===
        if (id == null || id.trim().isEmpty()) {
            errorList.add("Product ID is required");
        } else {
            try {
                int pid = Integer.parseInt(id);
                if (pid <= 0) {
                    errorList.add("Product ID must be greater than 0");
                }
            } catch (NumberFormatException e) {
                errorList.add("Product ID must be a valid integer");
            }
        }

     // Product Name validation
        if (name == null || name.trim().isEmpty()) {
            errorList.add("Product Name is required");
        } else if (!name.matches("^[A-Za-z0-9 ]{2,50}$")) {
            errorList.add("Product Name must only contain letters, numbers, and spaces (2–15 characters)");
        }

        // Brand validation
        if (brand == null || brand.trim().isEmpty()) {
            errorList.add("Brand is required");
        } else if (!brand.matches("^[A-Za-z ]{2,50}$")) {
            errorList.add("Brand must only contain letters and spaces (2–50 characters)");
        }

        double productPrice = 0;
        if (price == null || price.trim().isEmpty()) {
            errorList.add("Price is required");
        } else {
            try {
                productPrice = Double.parseDouble(price);
                if (productPrice <= 0) {
                    errorList.add("Price must be greater than 0");
                }
            } catch (NumberFormatException e) {
                errorList.add("Price must be a valid number");
            }
        }

        // === If errors, send back to JSP ===
        if (!errorList.isEmpty()) {
            req.setAttribute("errorList", errorList);
            RequestDispatcher rd = req.getRequestDispatcher("addProduct.jsp");
            rd.forward(req, resp);
            return;
        }

        // === If no errors, save product ===
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

            PreparedStatement statement = connection.prepareStatement("INSERT INTO product VALUES(?,?,?,?)");
            statement.setInt(1, Integer.parseInt(id));
            statement.setString(2, name);
            statement.setString(3, brand);
            statement.setDouble(4, productPrice);

            statement.executeUpdate();

            req.setAttribute("msgProd", "✅ Product Saved Successfully!");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
            requestDispatcher.forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            errorList.add("Database error: " + e.getMessage());
            req.setAttribute("errorList", errorList);
            RequestDispatcher rd = req.getRequestDispatcher("addProduct.jsp");
            rd.forward(req, resp);
        }
    }
}
