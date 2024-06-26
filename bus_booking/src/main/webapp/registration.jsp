<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<%@include file="all_component/allcss.jsp"%>
<style>
body {
    background-color: #f8f9fa;
}
.container-flex {
    display: flex;
    min-height: 100vh;
    align-items: center;
    justify-content: center;
}
.image-container {
    margin-right: 20px;
}
.registration-container {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}
.card {
    width: 50%;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.bg-custom {
    background-color: #007bff;
}
</style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <div class="container-flex">
        <div class="image-container">
            <img src="images/bookbg1.png" style="width:600px;">
        </div>
        <div class="registration-container">
            <div class="card mt-4">
                <div class="card-header text-center text-white bg-custom">
                    <i class='fas fa-user-astronaut fa-3x'></i>
                    <h4>Registration</h4>
                </div>
                
                <% 
                String regMsg = (String) session.getAttribute("reg-success");
                if (regMsg != null) {
                %>
                <div class="alert alert-success" role="alert">
                    <p><%=regMsg%></p>
                    <p>To login, <a href="login.jsp" class="alert-link">click here</a>.</p>
                </div>
                <% 
                session.removeAttribute("reg-success");
                }
                %>
                
                <% 
                String failedMsg = (String) session.getAttribute("failed-msg");
                if (failedMsg != null) {
                %>
                <div class="alert alert-danger" role="alert"><%=failedMsg %></div>
                <% 
                session.removeAttribute("failed-msg");
                }
                %>
                
                <div class="card-body">
                    <form action="UserServlet" method="post">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Enter Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fname">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="uemail">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="upassword">
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_component/footer.jsp"%>
</body>
</html>
