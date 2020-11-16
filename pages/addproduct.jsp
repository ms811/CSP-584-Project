<html>
    <head>
        <title>Add products</title>
        <meta charset="utf-8"> 
        <style>
            #addproductform {
                background-color: white;
                padding: 20px;
                padding-left: 50px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../parts/header.jsp"%>
        <%@ include file="../parts/navbar.jsp"%>

        <form id="addproductform">
            <div class="form-group row">
                <label for="productName" class="col-sm-2 col-form-label">Product Name</label>
                <div class="col-sm-4"> 
                    <input type="text" class="form-control" id="productName" placeholder="Name of the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="productDescription" class="col-sm-2 col-form-label">Product Description</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productDescription" placeholder="Descrive about the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="productCurrentPrice" class="col-sm-2 col-form-label">Product Current Price</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productCurrentPrice" placeholder="Price of the product after discount">
                </div>
            </div>
            <div class="form-group row">
                <label for="productDiscount" class="col-sm-2 col-form-label">Product Discount</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productDiscount" placeholder="Discount on the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="productActualPrice" class="col-sm-2 col-form-label">Product Actual Price</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productActualPrice" placeholder="Actual price of the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="productCategory" class="col-sm-2 col-form-label">Product Category</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productPrice" placeholder="Category of the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="productManufacturer" class="col-sm-2 col-form-label">Product Manufacturer</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="productManufacturer" placeholder="Manufacturer of the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="inventory" class="col-sm-2 col-form-label">Inventory</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="inventory" placeholder="Inventory of the product">
                </div>
            </div>
            <div class="form-group row">
                <label for="storeZipcode" class="col-sm-2 col-form-label">Store Zipcode</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="storeZipcode" placeholder="Zipcode of the store">
                </div>
            </div>
        </form>
        <!-- <%@ include file="../parts/footer.jsp"%> -->
    </body>
    
</html>