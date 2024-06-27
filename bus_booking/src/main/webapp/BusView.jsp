<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Add your custom styles here */
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <%@include file="all_component/allcss.jsp"%>
    <div class="bg-secondary p-1 text-capitalize">
        <h2>Available bus information</h2>
        <% 
        Hashtable<Integer, Hashtable<String, String>> hash1 = (Hashtable<Integer, Hashtable<String, String>>) request.getAttribute("data");
        if (hash1 != null && !hash1.isEmpty()) {
            %>
            <p class="fs-2"><%= hash1.get(1).get("start") %> to <%= hash1.get(1).get("destination") %></p>
        <% } %>
    </div>
    
    <table class="table">
        <thead>
            <tr class="table-primary">
                <th scope="col">Bus No.</th>
                <th scope="col">Bus Name</th>
                <th scope="col">Depart Date</th>
                <th scope="col">Capacity</th>
                <th scope="col">Available</th>
                <th scope="col">Start Point</th>
                <th scope="col">Destination</th>
                <th scope="col">Bus Fare</th>
                <th scope="col">Book</th>
            </tr>
        </thead>
        <tbody>
            <%  
            if (hash1 != null && !hash1.isEmpty()) {
                for (int i = 1; i <= hash1.size(); i++) {
                    String busNo = hash1.get(i).get("busNo");
                    String busName = hash1.get(i).get("busName");
                    String busDepartDate = hash1.get(i).get("busDepartDate");
                    String totSeat = hash1.get(i).get("totSeat");
                    String avlSeat = hash1.get(i).get("avlSeat");
                    String start = hash1.get(i).get("start");
                    String destination = hash1.get(i).get("destination");
                    String busFare = hash1.get(i).get("busFare");
            %>
            <tr class="table-info">
                <form action="booking" method="post">
                    <td><input readonly class="form-control" name="busNo" value="<%= busNo %>"></td>
                    <td><input readonly class="form-control" name="busName" value="<%= busName %>"></td>
                    <td><input readonly class="form-control" name="busDepartDate" value="<%= busDepartDate %>"></td>
                    <td><input readonly class="form-control" name="totSeat" value="<%= totSeat %>"></td>
                    <td><input readonly class="form-control" name="avlSeat" value="<%= avlSeat %>"></td>
                    <td><input readonly class="form-control" name="start" value="<%= start %>"></td>
                    <td><input readonly class="form-control" name="destination" value="<%= destination %>"></td>
                    <td><input readonly class="form-control" name="busFare" value="<%= busFare %>"></td>
                    <td><button type="submit" class="btn btn-primary">Click</button></td>
                </form>
            </tr>
            <% 
                }
            } else { 
            %>
            <tr>
                <td colspan="9">No bus information available.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    
</body>
</html>
