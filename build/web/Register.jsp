<%-- 
    Document   : Register
    Created on : Oct 23, 2021, 9:01:53 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            .login-form {
                width: 340px;
                margin: 50px auto;
                font-size: 15px;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }
            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .btn {        
                font-size: 15px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <%
            String notnull = (String) request.getAttribute("notnull");
            String matchUsername = (String) request.getAttribute("matchUsername");
            String matchPassword = (String) request.getAttribute("matchPassword");
            String cfphone = (String) request.getAttribute("cfphone");
        %>  
        <div class="login-form">
            <form action="Register" method="post">
                <h2 class="text-center">Register</h2>       
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" maxlength="24" name="username">
                    <%if (matchUsername == null || matchUsername.equals("")) {%>
                    <%} else {%>
                    <h1 style="margin: 0; color: black; font-size: 110%">${matchUsername}</h1>
                    <%}%>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" maxlength="24" name="password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Confirm Password" maxlength="24" name="cfpassword">
                    <%if (matchPassword == null || matchPassword.equals("")) {%>
                    <%} else {%>
                    <h1 style="margin: 0; color: black; font-size: 110%">${matchPassword}</h1>
                    <%}%>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Name" maxlength="80" name="name">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Phone" value="+84" maxlength="15" name="phone">
                    <%if (cfphone == null || cfphone.equals("")) {%>
                    <%} else {%>
                    <h1 style="margin: 0; color: black; font-size: 110%">${cfphone}</h1>
                    <%}%>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Address" maxlength="80" name="address">
                    <%if (notnull == null || notnull.equals("")) {%>
                    <%} else {%>
                    <h1 style="margin: 0; color: black; font-size: 150%">${notnull}</h1>
                    <%}%>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </div> 
            </form>
            <p class="text-center"><a href="Login.jsp">Already have an Account</a></p>
        </div>
    </body>
</html>