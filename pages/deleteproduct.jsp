<html>
    <head>
        <title>Delete Product</title>
        <meta charset="utf-8">
    </head>
    <style>
        #deleteproductform {
            background-color: white;
            padding: 20px;
            padding-left: 50px;
        }
    </style>
    <body>
        <%@ include file="../parts/header.jsp"%>
        <%@ include file="../parts/navbar.jsp"%>
        <form id="deleteproductform">
            <div class="form-group row">
                <label for="productID" class="col-sm-2 col-form-label">Product ID</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productID" placeholder="Id of the product">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                  <button type="submit" class="btn btn-primary">Delete Product</button>
                </div>
              </div>
        </form>
        <!-- <%@ include file="../parts/footer.jsp"%> -->
    </body>
</html>