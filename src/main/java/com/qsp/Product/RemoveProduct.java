package com.qsp.Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/removeProduct")
public class RemoveProduct extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Remove Product Process..!");
		
		String id = req.getParameter("id");
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
			
			PreparedStatement statement = connection.prepareStatement("DELETE FROM product WHERE id=?");
			
			statement.setInt(1, Integer.parseInt(id));
			
			int executeUpdate = statement.executeUpdate();
			
			if(executeUpdate== 1) {
				req.setAttribute("remove", "Product Removed!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
				requestDispatcher.forward(req, resp);
			}else {
				req.setAttribute("remove", "Product Not found!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
				requestDispatcher.forward(req, resp);
			}
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	
	
	
	}
}
