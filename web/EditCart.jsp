<%-- 
    Document   : EditCartg
    Created on : Nov 10, 2021, 12:41:14 PM
    Author     : ADMIN
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.CartUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            CartUser c = (CartUser) request.getAttribute("cart");
        %>
    </head>
    <body>
        <div class="modal-dialog">
                <div class="modal-content">
                  
                    <form action="Profile"> 
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Customer</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Customer Id</label>
                                <input type="text" class="form-control" value="<%= c.getCid()%>" maxlength="24" name="cid" readonly>
                            </div>
                            <div class="form-group">
                                <label>Order ID</label>
                                <input type="text" class="form-control" value="<%= c.getoID()%>" maxlength="24" name="oID">
                            </div>
                            <div class="form-group">
                                <label>Product ID</label>
                                <input type="text" class="form-control" value="<%= c.getProductID()%>" maxlength="24" name="productID">
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <input type="text" class="form-control" value="<%= c.getProductName()%>"  maxlength="24" name="productName">
                            </div>
                            <div class="form-group">
                                <label>Product Color</label>
                                <input type="text" class="form-control" value="<%= c.getProductColor()%>"  maxlength="24" name="productColor">
                            </div>
                            <div class="form-group">
                                <label>Product Path</label>
                                <input type="text" class="form-control" value="<%= c.getProductPath()%>" maxlength="24" name="productPath">
                            </div>
                            <div class="form-group">
                                <label>Product Price</label>
                                <input type="text" class="form-control" value="<%= c.getProductPrice()%>" maxlength="24" name="productPrice">
                            </div>
                            <div class="form-group">
                                <label>Product Quantity</label>
                                <input type="text" class="form-control" value="<%= c.getProductQuantity()%>" maxlength="24" name="productQuantity">
                            </div>
                            <div class="form-group">
                                <label>Item Quantity</label>
                                <input type="text" class="form-control" value="<%= c.getItemQuantity()%>" maxlength="24" name="itemQuantity">
                            </div>
                            <div class="form-group">
                                <label>Done or Null</label>
                                <input type="text" class="form-control" value="<%= c.getSess()%>" maxlength="24" name="itemQuantity">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" name="Edit" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
    </body>
</html>