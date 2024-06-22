
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
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img d-flex align-items-center ps-5">
	<div class=" d-flex justify-content-between">
		<div style="margin-top:100px;">
		<h1 class="text-dark">BusDekho</h1>
		<h2 class="text-dark">Your Ticket, Just a Click Away!</h2>
		<a href="login.jsp" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
		<a href="registration.jsp" class="btn btn-light">Register</a>
		</div>
		<img src="images/Designer.png"/ style="width:50%;">
	</div>
	</div>
	<%@include file="all_component/footer.jsp" %>
	
</body>

</html>