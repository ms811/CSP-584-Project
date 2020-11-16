<html>
    <head>
        <title></title>
        <meta charset="utf-8">
    </head>
    <style>
        #smpc {
            /* background-color: white; */
            padding-left: 40%;
            
        }
    </style>
    <body>
        <%@ include file="../parts/header.jsp"%>
        <%@ include file="../parts/navbar.jsp"%>
        <div id="smpc"> 
            <div class="btn-group-vertical" role="group">
                <a href="addproduct.jsp"><button type="button" class="btn btn-primary">Add Product</button></a>
                <a href="updateproduct.jsp"><button type="button" class="btn btn-primary">Update Product</button></a>
                <a href="deleteproduct.jsp"><button type="button" class="btn btn-primary">Delete Product</button></a>
            </div>
        </div>        
    </body>
    <!-- <%@ include file="../parts/footer.jsp"%> -->
</html>