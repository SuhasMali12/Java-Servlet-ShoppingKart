package com.qsp.Product;

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
import javax.servlet.http.HttpSession;

@WebServlet("/updateProd")
public class UpdateProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Update Product process started..!");

		String id = req.getParameter("id");

		try {
			Class.forName("org.postgresql.Driver");

			Connection connection = DriverManager
					.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");

			PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE id=?");

			statement.setInt(1, Integer.parseInt(id));

			ResultSet executeQuery = statement.executeQuery();

			if (executeQuery.next()) {
				HttpSession session = req.getSession();
				session.setAttribute("productId", id);

				System.out.println("Id present in DB!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("editProduct.jsp");

				requestDispatcher.forward(req, resp);

			} else {
				System.out.println("Id not present in DB!");
				req.setAttribute("msg", "Id not found!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("updateProduct.jsp");
				requestDispatcher.include(req, resp);

			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
