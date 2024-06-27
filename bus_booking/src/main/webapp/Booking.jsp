<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger Booking Information</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <%@include file="all_component/allcss.jsp"%>
    <div class="container mt-5">
        <h2>Passenger Booking Information</h2>
        <%
        Hashtable<String, String> bus_info = (Hashtable<String, String>) request.getAttribute("bus_info");
        if (bus_info == null) {
            throw new IllegalArgumentException("bus_info attribute not found or null");
        }
        
        String busNo = bus_info.get("busNo");
        String busName = bus_info.get("busName");
        String busFare = bus_info.get("busFare");
        String destination = bus_info.get("destination");
        String start = bus_info.get("start");
        String bookDate = bus_info.get("bookDate");
        %>
        <form action="passenger" method="post">
            <div class="row">
                <div class="col-6 form-group">
                    <label for="input1">Bus No:</label>
                    <input type="text" class="form-control" id="input1" name="busNo" readonly value="<%=busNo %>">
                </div>
                <div class="col-6 form-group">
                    <label for="input2">Bus Name:</label>
                    <input type="text" class="form-control" id="input2" name="busName" readonly value="<%=busName %>">
                </div>
                <div class="col-10 form-group">
                    <label for="fullname">Full Name:</label>
                    <input type="text" class="form-control" id="fullname" name="pessName" required>
                </div>
                <div class="col-6 form-group">
                    <label for="age">Age:</label>
                    <input type="number" class="form-control" id="age" name="age" required onchange="formValidation(event)">
                </div>
                <div class="col-6 form-group">
                    <label for="input6">Bus Fare:</label>
                    <input type="text" class="form-control" id="input6" name="busFare" readonly value="<%=busFare %>">
                </div>
                <div class="col-10 form-group">
                    <label for="input5">Booking Date:</label>
                    <input type="text" class="form-control" id="input5" name="bookDate" readonly value="<%=bookDate %>">
                </div>
                <div class="col-6 form-group">
                    <label for="input7">From:</label>
                    <input type="text" class="form-control" id="input7" name="start" readonly value="<%=start %>">
                </div>
                <div class="col-6 form-group">
                    <label for="input8">Destination:</label>
                    <input type="text" class="form-control" id="input8" name="destination" readonly value="<%=destination %>">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    
    <script>
    function formValidation(event) {
        switch (event.target.name) {
            case 'age':
                if (event.target.value < 1 || event.target.value > 100) {
                    alert("Enter Age between 1 to 100");
                    event.target.focus();
                }
                break;
        }
    }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
