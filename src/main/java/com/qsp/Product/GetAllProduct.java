package com.qsp.Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getAllProd")
public class GetAllProduct extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	System.out.println("Get all product process start..!");
	
	try {
		Class.forName("org.postgresql.Driver");
		
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
		
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM product");
		
		ResultSet executeQuery = statement.executeQuery();
		
		//create a list to store all products
		List<Product>productList = new ArrayList<Product>();
		
		while(executeQuery.next()) {
			int id = executeQuery.getInt(1);
			String name = executeQuery.getString(2);
			String brand = executeQuery.getString(3);
			double price = executeQuery.getDouble(4);
			
			//adding product in arraylist
			productList.add(new Product(id,name,brand,price));
		}
		
		req.setAttribute("productList", productList);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("displayProductDetail.jsp");
		requestDispatcher.forward(req, resp);
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	
	}

}
