package com.bus.controller;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;



public class PassengerDB {
	final String url = "jdbc:mysql://127.0.0.1:3306/busbook";
	final String user = "root";
	final String password = "123@Mysql";
	
	public boolean bookTicket(Hashtable<String, String> data){
		
		String avlSeat;
		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    System.out.println("Error: MySQL JDBC Driver not found.");
		}
		
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			if(conn != null) System.out.println("connected -- passDB");
			
			String query1="INSERT pessengerdetails(pessId,pessName,age,bookingDate,busFare, start, destination,busNo) VALUES(?,?,?,?,?,?,?,?)";
			String query2= "SELECT avlSeat FROM busdetails WHERE(busNo=?)";
			String query3= "UPDATE busdetails SET avlSeat = ? WHERE(busNo =? )";
			
			PreparedStatement statm1 = conn.prepareStatement(query1);
			PreparedStatement statm2 = conn.prepareStatement(query2);
			PreparedStatement statm3 = conn.prepareStatement(query3);
			
			
			statm1.setString(1, data.get("pessId"));
			statm1.setString(2, data.get("pessName"));
			statm1.setString(3, data.get("age")); 
			statm1.setString(4, data.get("bookDate"));
			statm1.setString(5, data.get("busFare"));
			statm1.setString(6, data.get("start"));
			statm1.setString(7, data.get("destination"));
			statm1.setString(8, data.get("busNo"));
			
			int inserted =  statm1.executeUpdate();
		
			statm2.setString(1, data.get("busNo"));
			
            ResultSet res= statm2.executeQuery();
			
			if(res.next()) {
				avlSeat = res.getString("avlSeat");

				int temp = Integer.parseInt(avlSeat);
				temp = temp-1;
				avlSeat = Integer.toString(temp);
				statm3.setString(1, avlSeat);
				statm3.setString(2, data.get("busNo"));
				
				temp = statm3.executeUpdate();
				if(temp>0 && inserted>0) return true;
				else return false;
			}
		  	
		}catch(SQLException e) { System.out.print(e.getMessage());}
		
		return false;
	}
}