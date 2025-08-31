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
import javax.servlet.http.HttpSession;

@WebServlet("/loginEmp")
public class EmployeeLogin extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
			
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM employee WHERE email=? AND password=?");
			
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet executeQuery = statement.executeQuery();
			
			
			if(executeQuery.next()) {
				//create new session 
				HttpSession session = req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("password", password);
				
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
				requestDispatcher.forward(req, resp);
				
			
			}else {
				req.setAttribute("errorMsg", "Invalid Username or Password!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeLogin.jsp");
				requestDispatcher.include(req, resp);
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
