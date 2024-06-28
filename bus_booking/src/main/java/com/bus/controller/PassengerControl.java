package com.bus.controller;
 import com.bus.controller.PassengerDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/passenger")
public class PassengerControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public PassengerControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Creating new instance of PassengerDB
		
		PassengerDB pessDB = new PassengerDB();
		 
		// Creating a Hashtable to store bus information
        Hashtable<String, String> bus_info = new Hashtable<String, String>();

        // Retrieving data from request parameters and populating the Hashtable
        bus_info.put("busNo", request.getParameter("busNo"));
        bus_info.put("busName", request.getParameter("busName"));
        bus_info.put("bookDate", request.getParameter("bookDate"));
        bus_info.put("start", request.getParameter("start"));
        bus_info.put("destination", request.getParameter("destination"));
        bus_info.put("busFare", request.getParameter("busFare"));
        bus_info.put("pessName", request.getParameter("pessName"));
        bus_info.put("age", request.getParameter("age"));
       
		boolean temp = pessDB.bookTicket(bus_info);
		
		PrintWriter out  = response.getWriter();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Acknowledge.jsp");
		
		if(temp == true) dispatcher.forward(request, response);
		else out.println("<h1>Ticket Booking Failed.</h1>");
	}
		

}
