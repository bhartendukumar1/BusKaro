
<%@ page import= "java.sql.Connection" %>
<%@ page import= "com.Db.DBConnect" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("images/gradient_bg.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	opacity: 0.8;
}
</style>

<title>Home</title>
<%@include file="all_component/allcss.jsp"%>
</head>


<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img d-flex align-items-center ps-5">
	<div class=" d-flex justify-content-between">
		<div style="margin-top:100px;">
		<h1 class="text-dark">BusDekho</h1>
		<h2 class="text-dark">Your Ticket, Just a Click Away!</h2>
		<form action="findBus" method="post" class="row g-3">
           <div class="col-auto">
             <label for="start_point" class="visually-hidden fs-4">From</label>
             <input type="text" class="form-control fs-4" id="start_point" name="start" value="" placeholder="Form">
           </div>
           <div class="col-auto">
             <label for="destination" class="visually-hidden fs-4">Destination</label>
             <input type="text" class="form-control fs-4" id="destination" name="destination" placeholder="Destination">
           </div>
           <div class="col-auto">
             <button type="submit" class="btn btn-primary mb-3 px-4 fs-4">Find Bus</button>
           </div>
         </form>
		<!-- <a href="registration.jsp" class="btn btn-light">Register</a> -->
		</div>
		<img src="images/Designer.png"/ style="width:50%;">
	</div>
	</div>
	<%@include file="all_component/footer.jsp" %>
	
</body>

</html>