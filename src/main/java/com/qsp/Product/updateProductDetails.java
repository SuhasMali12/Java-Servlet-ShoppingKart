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
import javax.servlet.http.HttpSession;

@WebServlet("/modify")
public class updateProductDetails extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String brand=req.getParameter("brand");
		String price=req.getParameter("price");
		
		HttpSession session = req.getSession();
		String id=(String)session.getAttribute("productId");
		
		Connection con=null;

		try {
			Class.forName("org.postgresql.Driver");

		   con = DriverManager
					.getConnection("jdbc:postgresql://localhost:5432/shopping_kart?user=postgres&password=root");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(name!=null) {
			try {
			PreparedStatement statement = con.prepareStatement("UPDATE product SET name=? WHERE id=?");
			statement.setString(1, name);
			statement.setInt(2, Integer.parseInt(id));

			int executeUpdate = statement.executeUpdate();

			System.out.println("Name updated!");

			if (executeUpdate > 0) {
				req.setAttribute("nmsg","Name Updated Successfully!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
				requestDispatcher.forward(req, resp);
			}
			} catch (IllegalArgumentException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(brand!=null) {
			try {
			PreparedStatement statement = con.prepareStatement("UPDATE product SET brand=? WHERE id=?");
			statement.setString(1, brand);
			statement.setInt(2, Integer.parseInt(id));

			int executeUpdate = statement.executeUpdate();

			System.out.println("brand updated!");

			if (executeUpdate > 0) {
				req.setAttribute("bmsg","Brand Updated Successfully!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
				requestDispatcher.forward(req, resp);
			}
			} catch (IllegalArgumentException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(price!=null) {
			try {
			PreparedStatement statement = con.prepareStatement("UPDATE product SET price=? WHERE id=?");
			statement.setDouble(1, Double.parseDouble(price));
			statement.setInt(2, Integer.parseInt(id));

			int executeUpdate = statement.executeUpdate();

			System.out.println("brand updated!");

			if (executeUpdate > 0) {
				req.setAttribute("pmsg","Price Updated Successfully!");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("employeeHome.jsp");
				requestDispatcher.forward(req, resp);
			}
			} catch (IllegalArgumentException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
