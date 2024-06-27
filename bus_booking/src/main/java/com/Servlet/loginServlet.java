package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email=request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		System.out.println(email +" -->>");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		
		String loginSucess = dao.loginUser(us);
		
		if(loginSucess != "")
		{
			
			response.sendRedirect("index.jsp");
			session.setAttribute("name", loginSucess);
		}
		else {
			session.setAttribute("login-failed", "Invalid UserName and Password");
			response.sendRedirect("login.jsp");
			
		}
		

	}

}
