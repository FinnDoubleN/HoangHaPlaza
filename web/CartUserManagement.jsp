<%-- 
    Document   : Manager
    Created on : Oct 23, 2021, 9:04:51 AM
    Author     : ADMIN
--%>
<%@page import="Model.CartUser"%>
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
            ArrayList<CartUser> cart = (ArrayList<CartUser>) request.getAttribute("cart");
        %>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper" style="min-width: 1317px;">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Cart User</b></h2>
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
                                <form action="Profile" method="post" class="nav-item">
                                    <button name="username" class="btn btn-success" style="background-color: #435d7d;">User</button>
                                </form></div>
                            <div class="col-sm-6" style="min-width: 1287px;">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Cart</span></a>
                               
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
                                <th>CustomerID</th>
                                <th>OrderID</th>
                                <th>ProductID</th>
                                <th>ProductName</th>
                                <th>ProductColor</th>
                                <th>ProductPath</th>
                                <th>ProductPrice</th>
                                <th>ProductQuantity</th>
                                <th>ItemQuantity</th>
                                <th>Done or Null</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (CartUser c : cart) {
                            %>
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td><%= c.getCid()%></td>
                                <td><%= c.getoID()%></td>
                                <td><%= c.getProductID()%></td>
                                <td><%= c.getProductName()%></td>
                                <td><%= c.getProductColor()%></td>
                                <td><%= c.getProductPath()%></td>
                                <td><%= c.getProductPrice()%></td>
                                <td><%= c.getProductQuantity()%></td>
                                <td><%= c.getItemQuantity()%></td>
                                <td><%= c.getSess()%></td>
                                <td>
                                    <form action="Cart" method="post" class="shop-button">
                                    <button name="edit" value="<%= c.getoID() %>" class="shop-button-buy"data-toggle="modal">Edit</button>
                                    <button name="delete" value="<%= c.getoID()%>" class="shop-button-buy"data-toggle="modal">Delete</button>
                                    </form>
                                </td>
                            </tr><%}%>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
    </body>
</html>