<%-- 
    Document   : Login
    Created on : Oct 23, 2021, 9:01:53 AM
    Author     : ADMIN
--%>

<%@page import="Model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
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
            .logo{

            }
        </style>
        <%
            ArrayList<Customer> user = (ArrayList<Customer>) request.getAttribute("user");
            Customer account = (Customer) request.getAttribute("account");
            session.setAttribute("account", account);
        %>
    </head>
    <body>


        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                    <div class="full">
                        <div class="center-desk">
                            <div class="logo">
                                <a href="HomePage.jsp"><img src="images/giap.png" alt="#" /></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                    <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                            <ul class="navbar-nav mr-auto">
                                <form action="HomePage" method="post" class="nav-item">
                                    <button class="nav-link">Home</button>
                                </form> 
                                <form action="About" method="post" class="nav-item">
                                    <button class="nav-link">About</button>
                                </form>
                                <form action="Shop" method="post" class="nav-item">
                                    <button class="nav-link">Shop</button>
                                </form>
                                <form action="Contact" method="post" class="nav-item">
                                    <button class="nav-link">Contact us</button>
                                </form>
                                <form action="Profile" method="post" class="nav-item d_none login_btn">  
                                    <button class="nav-link">Profile</button>
                                </form>
                                <form action="Logout" method="post" class="nav-item d_none">
                                    <button class="nav-link">Logout</button>
                                </form>
                            </ul>
                            <ul>
                                <div class="cart-logo">
                                    <a href="http://localhost:8084/HoangHa_Plaza/Cart/" class="link-cart">
                                        <img class="img-logo-menu" src="./images/cart.jpg">
                                    </a>
                                </div>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>

    </header>


    <div class="login-form" ><%
        for (Customer p : user) {
        %>
        <form action="UpdateProfile" method="post">
            <h2 class="text-center">Profile</h2>       
            <div class="form-group">
                Username: <input type="text" class="form-control" value="<%= p.getUsername()%>" maxlength="24" name="username">
            </div>
            <div class="form-group">
                Password: <input type="text" class="form-control" value="<%= p.getPassword()%>" maxlength="32" name="password">
            </div>
            <div class="form-group">
                Name: <input type="text" class="form-control" value="<%= p.getCname()%>"  maxlength="80" name="cname">
            </div>
            <div class="form-group">
                Phone: <input type="text" class="form-control" value="<%= p.getCphone()%>" maxlength="15" name="cphone">
            </div>
            <div class="form-group">
                Address: <input type="text" class="form-control" value="<%= p.getcAddress()%>" maxlength="80" name="cAddress">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Update</button>
            </div>

        </form><%}%>    
    </div>

</body>
</html>