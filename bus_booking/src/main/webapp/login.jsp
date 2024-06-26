
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%@include file="all_component/allcss.jsp"%>
	
	  <div class="container-fluid div-color">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card mt-4">
                    <div class="card-header text-center text-white bg-custom">
                        <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                        <h4>Login</h4>
                    </div>
                    <% 
                    
                    	String invalidMsg = (String)session.getAttribute("login-failed");
                    
                    	 if (invalidMsg != null){
                    %>
                    	
                    <div class="alert alert-danger" role="alert"><%=invalidMsg %></div>
                      	<%
                      	session.removeAttribute("login-failed");
                    	 }
                      	%>
                    
                    
                    <div class="card-body">
                        <form action = "loginServlet" method="post">
                          
                            <div class="mb-3">
                                <label for="email" class="form-label">Enter Email</label>
                                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name = "uemail">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Enter Password</label>
                                <input type="password" class="form-control" id="password" name = "upassword">
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>