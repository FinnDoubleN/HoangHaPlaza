<%-- 
    Document   : Manager
    Created on : Oct 23, 2021, 9:04:51 AM
    Author     : ADMIN
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Hoang Ha Plaza</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/management.css" type="text/css">
        <script type="text/javascript" src="/js/management.js"></script>
        <%
            ArrayList<Customer> manageCus = (ArrayList<Customer>) request.getAttribute("manageCus");
        %>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Customer</b></h2>
                            </div>
                            <%
                                Customer account = (Customer) request.getAttribute("account");
                                session.setAttribute("account", account);
                            %>
                            <div class="col-sm-6">
                                <form action="HomePage" method="post" class="nav-item">
                                    <button name="username" class="btn btn-success" style="background-color: #435d7d;">Home</button>
                                </form>
                                <form action="Shop" method="post" class="nav-item">
                                    <button name="username" class="btn btn-success" style="background-color: #435d7d;">Product</button>
                                </form>
                                <form class="nav-item">
                                    <a name="username" href="http://localhost:8084/HoangHa_Plaza/Cart" class="btn btn-success" style="background-color: #435d7d;">Cart</a>
                                </form></div>
                            <div class="col-sm-6" style="min-width: 1075px;">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>Customer Id</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Customer Name</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Customer c : manageCus) {
                            %>
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td><%= c.getCid()%></td>
                                <td><%= c.getUsername()%></td>
                                <td><%= c.getPassword()%></td>
                                <td><%= c.getCname()%></td>
                                <td><%= c.getCphone()%></td>
                                <td><%= c.getcAddress()%></td>
                                <td><%= c.isStatus()%></td>
                                <td>
                                    <form action="Profile" method="post" class="shop-button">
                                    <button name="edit" value="<%= c.getUsername()%>" class="shop-button-buy"data-toggle="modal">Edit</button>
                                    <button name="delete" value="<%= c.getUsername()%>" class="shop-button-buy"data-toggle="modal">Delete</button>
                                    </form>
                                </td>
                            </tr><%}%>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
        <!-- Add Modal HTML -->
        <%
            String notnull = (String) request.getAttribute("notnull");
            String matchUsername = (String) request.getAttribute("matchUsername");
            String matchPassword = (String) request.getAttribute("matchPassword");
            String cfphone = (String) request.getAttribute("cfphone");
        %>  
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="Profile">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Customer</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" placeholder="Username" maxlength="24" name="username">
                                <%if (matchUsername == null || matchUsername.equals("")) {%>
                                <%} else {%>
                                <h1 style="margin: 0; color: black; font-size: 110%">${matchUsername}</h1>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Password" maxlength="24" name="password">
                                <%if (matchPassword == null || matchPassword.equals("")) {%>
                                <%} else {%>
                                <h1 style="margin: 0; color: black; font-size: 110%">${matchPassword}</h1>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label>CfPassword</label>
                                <input type="password" class="form-control" placeholder="Confirm Password" maxlength="24" name="cfpassword">
                                <%if (matchPassword == null || matchPassword.equals("")) {%>
                                <%} else {%>
                                <h1 style="margin: 0; color: black; font-size: 110%">${matchPassword}</h1>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" maxlength="80" name="name">
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" placeholder="Phone" value="+84" maxlength="15" name="phone">
                                <%if (cfphone == null || cfphone.equals("")) {%>
                                <%} else {%>
                                <h1 style="margin: 0; color: black; font-size: 110%">${cfphone}</h1>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" placeholder="Address" maxlength="80" name="address">
                                <%if (notnull == null || notnull.equals("")) {%>
                                <%} else {%>
                                <h1 style="margin: 0; color: black; font-size: 150%">${notnull}</h1>
                                <%}%>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" name="Add" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>