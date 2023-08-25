<%-- 
    Document   : AddProduct
    Created on : Nov 10, 2021, 11:31:00 AM
    Author     : ADMIN
--%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
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
    </head>
    <body>
        <div class="modal fade">
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
                                <input type="text" class="form-control" placeholder="" maxlength="24" name="pid">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductName</label>
                                <input type="text" class="form-control" placeholder="" maxlength="80" name="pname">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductStock</label>
                                <input type="text" class="form-control" placeholder="" maxlength="80" name="stock">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ProductPrice</label>
                                <input type="text" class="form-control" placeholder="" maxlength="80" name="price">
                            </div>
                            <div class="form-group">
                                <label>ProductImage</label>
                                <input type="text" class="form-control" placeholder="" maxlength="80" name="image" accept="image/*">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control" placeholder=""  maxlength="80" name="description">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>CateID</label>
                                <input type="text" class="form-control" placeholder=""  maxlength="15" name="cateID">
                                <h1 style="margin: 0; color: black; font-size: 110%"></h1>
                            </div>
                            <div class="form-group">
                                <label>ColorID</label>
                                <input type="text" class="form-control" placeholder="" maxlength="15" name="colorID">
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
