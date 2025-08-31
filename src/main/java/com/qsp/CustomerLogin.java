package com.qsp;

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

@WebServlet("/login")
public class CustomerLogin extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		// Check if already logged in
//        HttpSession session = req.getSession(false); // do not create new session
//        if (session != null && session.getAttribute("username") != null) {
//            // Already logged in, redirect to home
//            resp.sendRedirect("customerHome.jsp");
//            return;
//        }
		
		
		String name = req.getParameter("username");
		String password = req.getParameter("password");
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
			
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM customer WHERE username=? AND password=?");
			
			statement.setString(1, name);
			statement.setString(2, password);
			
			ResultSet executeQuery = statement.executeQuery();
			
			
			if(executeQuery.next()) {
				//create new session 
				HttpSession session = req.getSession();
				session.setAttribute("name", name);
				session.setAttribute("password", password);
				
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("customerHome.jsp");
				requestDispatcher.forward(req, resp);
				
			
			}else {
				req.setAttribute("errorMsg", "Invalid Username or Password!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("customerLogin.jsp");
				requestDispatcher.include(req, resp);
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
