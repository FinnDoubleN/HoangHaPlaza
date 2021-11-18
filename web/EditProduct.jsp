<%-- 
    Document   : EditProduct
    Created on : Nov 9, 2021, 10:18:26 PM
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
        <%
            ArrayList<Product> product = (ArrayList<Product>) request.getAttribute("product");
        %>
    </head>
    <body>
        <div class="modal-dialog">
                <div class="modal-content">
                    <%
                        for (Product p : product) {
                    %>
                    <form action="EditProduct" method="post"> 
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Cart</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" value="Cancel">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ProductID</label>
                                <input type="text" class="form-control" name="pid" value="<%= p.getPid()%>" maxlength="24" name="pid" readonly>
                            </div>
                            <div class="form-group">
                                <label>ProductName</label>
                                <input type="text" class="form-control" name="pname" value="<%= p.getPname()%>" maxlength="24" name="pname">
                            </div>
                            <div class="form-group">
                                <label>ProductStock</label>
                                <input type="text" class="form-control" name="stock" value="<%= p.getStock()%>" maxlength="24" name="stock">
                            </div>
                            <div class="form-group">
                                <label>ProductPrice</label>
                                <input type="text" class="form-control" name="price" value="<%= p.getPrice()%>"  maxlength="24" name="price">
                            </div>
                            <div class="form-group">
                                <label>ProductImage</label>
                                <input type="text" class="form-control" name="image" value="<%= p.getImage()%>" maxlength="24" name="image">
                            </div>
                            <div class="form-group">
                                <label>ProductDescription</label>
                                <input type="text" class="form-control" name="description" value="<%= p.getDescription()%>" maxlength="24" name="Description">
                            </div>
                            <div class="form-group">
                                <label>CateID</label>
                                <input type="text" class="form-control" name="cateID" value="<%= p.getCateID()%>" name="cateID">
                            </div>	
                            <div class="form-group">
                                <label>ColorID</label>
                                <input type="text" class="form-control" name="colorID" value="<%= p.getColorID()%>" name="colorID">
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
