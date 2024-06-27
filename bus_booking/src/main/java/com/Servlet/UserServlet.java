package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("fname");
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");
        
        
        // Creating a UserDetails object and setting its properties
        UserDetails userDetails = new UserDetails();
        userDetails.setName(name);
        userDetails.setEmail(email);
        userDetails.setPassword(password);

        // Adding the user to the database
        UserDAO dao = new UserDAO(DBConnect.getConn());
        boolean regSucess = dao.addUser(userDetails);

        
        // Generate the response based on the registration result
        HttpSession session;
        if (regSucess) {
            session = request.getSession();
            session.setAttribute("reg-success", "Registration Sucessfully...");
            response.sendRedirect("registration.jsp");
        } else {
        	session = request.getSession();
        	session.setAttribute("failed-msg", "Something went wrong!");
        	response.sendRedirect("registration.jsp");
        }
    }
}
