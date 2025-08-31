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

@WebServlet("/display")
public class displayEmp extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
			
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM employee WHERE email=?");
			statement.setString(1, email);
			
			ResultSet executeQuery = statement.executeQuery();
			
			if(executeQuery.next()) {
				int id = executeQuery.getInt(1);
				String name = executeQuery.getString(2);
				long mobno = executeQuery.getLong(3);
				String role = executeQuery.getString(4);
				double sal = executeQuery.getDouble(5);
				String mail = executeQuery.getString(6);
				req.setAttribute("id", Integer.toString(id));
				req.setAttribute("name", name);
				req.setAttribute("mobno", Long.toString(mobno));
				req.setAttribute("role", role);
				req.setAttribute("sal", Double.toString(sal));
				req.setAttribute("mail", mail);
				
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("displayEmpDetails.jsp");
				requestDispatcher.forward(req, resp);
			}else {
				req.setAttribute("msg", "Unable to fetch employee data!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("displayEmpDetails.jsp");
				requestDispatcher.include(req, resp);
			}
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	
	}
}
