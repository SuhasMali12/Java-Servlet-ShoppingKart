package com.qsp;

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

@WebServlet("/getProduct")
public class GetAllProduct extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
			
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM product");
			
			ResultSet executeQuery = statement.executeQuery();
			
			//create List of type Item to store table data
			List <Item>arrayList = new ArrayList<Item>();
			
			while(executeQuery.next()) {
				int id = executeQuery.getInt(1);
				String name = executeQuery.getString(2);
				String brand = executeQuery.getString(3);
				double price = executeQuery.getDouble(4);
				
				//storing Item object
				arrayList.add(new Item(id,name,brand,price));
			}
			
			//store the arraylist in request object
			req.setAttribute("ProductList", arrayList);
			
			//redirect to displayProduct.jsp file
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("displayRecords.jsp");
			
			requestDispatcher.forward(req, resp);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
