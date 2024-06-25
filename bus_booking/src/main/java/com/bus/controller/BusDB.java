package com.bus.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;



public class BusDB {
	final String url = "jdbc:mysql://127.0.0.1:3306/busbook";
	final String user = "root";
	final String password = "123@Mysql";
	
	public Hashtable<Integer,Hashtable<String,String>> getBusData(String start, String destination){
		ResultSet res = null;
		Hashtable<Integer,Hashtable<String,String>> hash1 =  new Hashtable<Integer, Hashtable<String,String>>();
		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    System.out.println("Error: MySQL JDBC Driver not found.");
		}
		
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			if(conn != null) System.out.println("connected");
			
			String query = "select * from busbook.busdetails where(start=? and destination=?)";
			PreparedStatement statm = conn.prepareStatement(query);
			statm.setString(1, start);
			statm.setString(2, destination);
		    res =statm.executeQuery();
		    int i=1;
			while(res.next()) {
				Hashtable<String, String>v1 = new Hashtable<String, String>();
				v1.put("busNo",res.getString("busNo"));
				v1.put("busDepartDate",res.getString("busDepartDate"));
				v1.put("totSeat",res.getString("totSeat"));
				v1.put("avlSeat",res.getString("avlSeat"));
				v1.put("start",res.getString("start"));
				v1.put("destination",res.getString("destination"));
				v1.put("busFare",res.getString("busFare"));
				//System.out.println(v1);
				hash1.put(i, v1);
				i++;
			}  
			
		}catch(SQLException e) { System.out.print(e.getMessage());}
		
		System.out.println("DB\n"+hash1);
		
		return hash1;
	}
}