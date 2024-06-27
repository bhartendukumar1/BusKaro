package com.bus.controller;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookingControl() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Creating a Hashtable to store bus information
        Hashtable<String, String> bus_info = new Hashtable<String, String>();

        // Retrieving data from request parameters and populating the Hashtable
        bus_info.put("busNo", request.getParameter("busNo"));
        bus_info.put("busName", request.getParameter("busName"));
        bus_info.put("bookDate", request.getParameter("busDepartDate"));
        bus_info.put("start", request.getParameter("start"));
        bus_info.put("destination", request.getParameter("destination"));
        bus_info.put("busFare", request.getParameter("busFare"));

        // Getting session attribute (example: "Id" assumed to be user's email)
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");

        // Forwarding based on session attribute presence
        RequestDispatcher dispatcher1 = request.getRequestDispatcher("Booking.jsp");
        RequestDispatcher dispatcher2 = request.getRequestDispatcher("login.jsp");
        
        try {
            if (name != null) {
                // If session attribute exists, forward to Booking.jsp with bus_info
                request.setAttribute("bus_info", bus_info);
                dispatcher1.forward(request, response);
            } else {
                // If session attribute does not exist, forward to login.jsp
                dispatcher2.forward(request, response);
                session.setAttribute("booking", "true");
            }
        } catch (Exception e) {
            // Handle any exceptions
            System.out.println("Exception: " + e.getMessage());
            dispatcher2.forward(request, response); // Forward to login.jsp on error
        }
    }
}
