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
import javax.servlet.http.HttpSession;

@WebServlet("/customerProfile")
public class CustomerProfile extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String username =(String) session.getAttribute("name");
		
	try {
		Class.forName("org.postgresql.Driver");
		
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
		
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM customer WHERE username=?");
		
		statement.setString(1, username);
		
		ResultSet executeQuery = statement.executeQuery();
		
		//create list to type Customer to store table data
		List<Customer> arrayList = new ArrayList<Customer>();
		
		while(executeQuery.next()) {
			int id = executeQuery.getInt(1);
			String name = executeQuery.getString(2);
			long mobno = executeQuery.getLong(3);
			String email = executeQuery.getString(4);
			String usernamex = executeQuery.getString(5);
			
			//store the Customer object in List
			arrayList.add(new Customer(id,name,mobno,email,usernamex));
		}
		
		req.setAttribute("customerList", arrayList);
		
		//request dispatcher to redirect page to customerProfile.jsp
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("customerProfile.jsp");
		
		requestDispatcher.forward(req, resp);
		
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	}

}
