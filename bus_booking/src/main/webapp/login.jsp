<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row justify-content-center">
			<div class="col-md-4 mt-4">
				<div class="card">
					<div class="card-header text-center bg-custom text-white">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>
					<div class="card-body">
						<% 
                            String invalidMsg = (String)session.getAttribute("login-failed");
                            if (invalidMsg != null) {
                        %>
						<div class="alert alert-danger" role="alert"><%= invalidMsg %></div>
						<%
                            session.removeAttribute("login-failed");
                            }
                        %>
						<form action="loginServlet" method="post">
							<div class="mb-3">
								<label for="uemail" class="form-label">Enter Email</label> <input
									type="email" class="form-control" id="uemail" name="uemail"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="upassword" class="form-label">Enter Password</label>
								<input type="password" class="form-control" id="upassword"
									name="upassword">
							</div>
							<button type="submit" class="btn btn-primary">Login</button>
						</form>
					</div>
					<div class="card-footer text-center">
						<p class="mb-0">
							Don't have an account? <a href="registration.jsp"
								class="text-primary">Register here</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>
