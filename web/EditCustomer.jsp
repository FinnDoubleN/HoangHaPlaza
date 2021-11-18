<%-- 
    Document   : EditProduct
    Created on : Nov 9, 2021, 10:18:26 PM
    Author     : ADMIN
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Model.Customer"%>
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
            Customer p = (Customer) request.getAttribute("manageCus");
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
                                <label>Id</label>
                                <input type="text" class="form-control" value="<%= p.getCid()%>" maxlength="24" name="cid" readonly>
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" value="<%= p.getUsername()%>" maxlength="24" name="username">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" class="form-control" value="<%= p.getPassword()%>" maxlength="24" name="password">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" value="<%= p.getCname()%>"  maxlength="24" name="cname">
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" value="<%= p.getCphone()%>" maxlength="24" name="cphone">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" value="<%= p.getcAddress()%>" maxlength="24" name="cAddress">
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <input type="boolean" class="form-control" value="<%= p.isStatus()%>" name="status">
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
