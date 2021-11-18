<%-- 
    Document   : CategoryManagement
    Created on : Nov 10, 2021, 2:01:03 PM
    Author     : ADMIN
--%>

<%@page import="Model.Category"%>
<%@page import="Model.Customer"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
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
            ArrayList<Category> category = (ArrayList<Category>) request.getAttribute("category");
        %>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Category</b></h2>
                            </div>
                            <%
                                Customer account = (Customer) request.getAttribute("account");
                                session.setAttribute("account", account);
                            %>
                            <div class="col-sm-6">
                                <form action="HomePage" method="post" class="nav-item">
                                    <button name="username" class="btn btn-success" style="background-color: #435d7d;">Home</button>
                                </form>
                                <form class="nav-item">
                                    <a name="username" href="http://localhost:8084/HoangHa_Plaza/Cart" class="btn btn-success" style="background-color: #435d7d;">Cart</a>
                                </form>
                                <form action="Profile" method="post" class="nav-item">
                                    <button name="username" class="btn btn-success" style="background-color: #435d7d;">User</button>
                                </form>
                            </div>
                            <div class="col-sm-6" style="min-width: 1072px;">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Category</span></a>					
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Category Id</th>
                                <th>Category Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Category c : category) {
                            %>
                            <tr>
                                <td><%= c.getId()%></td>
                                <td><%= c.getName()%></td>
                                <td>
                                    <form action="CategoryManagement" method="post" class="shop-button">
                                        <button name="edit" value="<%= c.getId()%>" class="shop-button-buy"data-toggle="modal">Edit</button>
                                        <button name="delete" value="<%= c.getId()%>" class="shop-button-buy"data-toggle="modal">Delete</button>
                                    </form>
                                </td>
                            </tr><%}%>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
       <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="CustomerManagement">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Customer</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>ProductID</label>
                                <input type="text" class="form-control" placeholder="Username" maxlength="24" name="username">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductName</label>
                                <input type="password" class="form-control" placeholder="Password" maxlength="24" name="password">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductColor</label>
                                <input type="password" class="form-control" placeholder="Confirm Password" maxlength="24" name="cfpassword">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductPath</label>
                                <input type="text" class="form-control" placeholder="Name" maxlength="80" name="name">
                            </div>
                            <div class="form-group">
                                <label>ProductPrice</label>
                                <input type="text" class="form-control" placeholder="Phone" value="+84" maxlength="15" name="phone">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductQuantity</label>
                                <input type="text" class="form-control" placeholder="Phone" value="+84" maxlength="15" name="phone">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ItemQuantity</label>
                                <input type="text" class="form-control" placeholder="Phone" value="+84" maxlength="15" name="phone">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
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
