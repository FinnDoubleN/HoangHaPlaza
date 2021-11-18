<%-- 
    Document   : EditCategory
    Created on : Nov 10, 2021, 2:21:08 PM
    Author     : ADMIN
--%>

<%@page import="Model.Category"%>
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
        <%
            Category p = (Category) request.getAttribute("category");
        %>
    </head>
    <body>
        <div class="modal-dialog">
                <div class="modal-content">
                    <form action="EditProduct" method="post"> 
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Cart</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" value="Cancel">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" class="form-control" name="cateID" value="<%= p.getId()%>" maxlength="24" name="cateID" readonly>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" class="form-control" name="cateName" value="<%= p.getName()%>" maxlength="24" name="cateName">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Update">
                        </div>
                    </form><%}%>  
                </div>
            </div>
    </body>
</html>
