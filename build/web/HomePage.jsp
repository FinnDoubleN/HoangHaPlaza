<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Hoang Ha Plaza</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
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
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <!-- body -->
    <body class="main-layout">
        <!-- loader  -->
        <div class="loader_bg">
            <div class="loader"><img src="images/loading.gif" alt="#" /></div>
        </div>
        <!-- end loader -->
        <!-- header -->
        <header>
            <!-- header inner -->
            <div class="header">
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
                                        <form action="HomePage" method="post" class="nav-item active">
                                                <button name="username" class="nav-link">Home</button>
                                        </form>
                                        <form action="About" method="post" class="nav-item">
                                                <button name="username" class="nav-link">About</button>
                                        </form>
                                        <form action="Shop" method="post" class="nav-item">
                                                <button name="username"  class="nav-link">Shop</button>
                                        </form>
                                        <form action="Contact" method="post" class="nav-item">
                                                <button name="username"  class="nav-link">Contact Us</button>
                                        </form> 
                                        <%
                                            Customer account = (Customer) request.getAttribute("account");
                                            session.setAttribute("account", account);
                                            if (account == null) {
                                        %>
                                        <li class="nav-item d_none login_btn">
                                            <a class="nav-link" href="Login.jsp">Login</a>
                                        </li>
                                        <li class="nav-item d_none">
                                            <a class="nav-link" href="Register.jsp">Register</a>
                                        </li>
                                        <%} else {%>
                                        <form action="Profile" method="post" class="nav-item d_none login_btn">  
                                            <button name="user" class="nav-link">Profile</button>
                                        </form>
                                        <form action="Logout" method="post" class="nav-item d_none">
                                            <button name="user" class="nav-link">Logout</button>
                                        </form>
                                        <%}%>
                                    </ul>
                                    <ul>
                                        <div class="cart-logo">
                                            <a <% if (account == null) {%>
                                                href="http://localhost:8084/HoangHa_Plaza/Login"
                                                <%} else {%>
                                                href="http://localhost:8084/HoangHa_Plaza/Cart"
                                                <%}%>
                                                class="link-cart">
                                                <img class="cart" src="images/cart.jpg">
                                            </a>
                                        </div>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- end header inner -->
        <!-- end header -->
        <!-- banner -->
        <section class="banner_main">
            <div id="banner1" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#banner1" data-slide-to="0" class="active"></li>
                    <li data-target="#banner1" data-slide-to="1"></li>
                    <li data-target="#banner1" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <div class="carousel-caption">
                                <div class="text-bg">
                                    <h1> <span class="blu">Welcome <br></span>To Our Plaza</h1>
                                    <figure><img src="images/figure6.jpg" alt="#"/></figure>
                                    <form action="Shop" method="post">
                                            <button class="read_more">Shop</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <div class="carousel-caption">
                                <div class="text-bg">
                                    <h1> <span class="blu">Welcome <br></span>To Our Plaza</h1>
                                    <figure><img src="images/figure7.jpg" alt="#"/></figure>
                                    <form action="Shop" method="post">
                                            <button class="read_more">Shop</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <div class="carousel-caption">
                                <div class="text-bg">
                                    <h1> <span class="blu">Welcome <br></span>To Our Plaza</h1>
                                    <figure><img src="images/inside.jpg" alt="#"/></figure>
                                    <form action="Shop" method="post">
                                            <button class="read_more">Shop</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                </a>
                <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </a>
            </div>
        </section>
        <!-- end banner -->
        <!-- about section -->
        <div class="about">
            <div class="container">
                <div class="row d_flex">
                    <div class="col-md-5">
                        <div class="about_img">
                            <figure><img src="images/about2.jfif" alt="#"/></figure>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="titlepage">
                            <h2>About Our Shop</h2>
                            <p>Nippon Paint Colours helps to add colours into your life and build your dream home.</p>
                            <p>Paint for quarantine</p>
                        </div>
                        <form action="About" method="post">
                            <button class="read_more">About</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- about section -->
        <!--  footer -->
        <footer>
            <div class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <ul class="location_icon">
                                <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i></a><br> Bac Giang City</li>
                                <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a><br> +84 982765291</li>
                                <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a><br> ctyhoangha@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end footer -->
        <!-- Javascript files-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>

