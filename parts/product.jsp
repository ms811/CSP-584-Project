<!DOCTYPE html>

<html>
    <head>
        <!-- The title of the page changes according to the product -->
        <title>Cetaphil moisturizer</title>
        <meta charset="utf-8">
        <style>

            #productdetails {
                background-color: white;
            }

            .add-to-cart .btn-qty {
                width: 52px;
                height: 46px;
            }
        </style>
    </head>

    <body>

        <%@ include file="header.jsp"%>
        <%@ include file="navbar.jsp"%>

        <div class="container">    
            <div class="row">
                <!-- This section is for the product image -->
                <div class="col-md-6">
                    <div class="panel panel-primary">
                    <div class="panel-heading">Product</div>
                    <div class="panel-body"><img src="../images/bcb/moisturizer.jpg" class="img-responsive" style="width:100%" alt="Moisturizer Image"></div>
                    <div class="panel-footer">Moisturizer</div>
                    </div>
                </div>

                <div class="col-md-6" id="productdetails">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>Cetaphil Daily Moisturizer Cream</h1>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="label label-primary">Brand:Bakoda</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <p class="description">Smooth moisturizer cream for soft skin.</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <span class="sr-only">Four out of five stars</span>
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                            <span class="label label-success">2145</span>
                        </div>
                        <div class="col-md-3">
                            <span class="monospaced">Write a Review</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 bottom-rule">
                            <h2 class="product-price">$15.00</h2>
                        </div>
                    </div>

                    <div class="row add-to-cart">
                        <div class="col-md-5 product-qty">
                            <span class="btn btn-default btn-lg btn-qty">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </span>
                            <input class="btn btn-default btn-lg btn-qty" value="1" />
                            <span class="btn btn-default btn-lg btn-qty">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </span>
                        </div>

                        <div class="col-md-4">
                            <button class="btn btn-lg btn-brand btn-full-width">Add to Cart</button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 text-center">
                            <span class="monospaced">In Stock</span>
                        </div>
                        <div class="col-md-4 col-md-offset-1 text-center">
                            <a class="monospaced" href="#">Buy Now</a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 bottom-rule top-10"></div>
                    </div>

                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                         <a href="#description" aria-controls="description" role="tab" data-toggle="tab">Description</a>
                        </li>
                        <li role="presentation">
                         <a href="#features" aria-controls="features" role="tab" data-toggle="tab">Features</a>
                        </li>
                        <li role="presentation">
                         <a href="#notes" aria-controls="notes" role="tab" data-toggle="tab">Notes</a>
                        </li>
                        <li role="presentation">
                         <a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">Reviews</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="description">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies nulla vel tellus vulputate viverra. Nulla laoreet ac purus nec porttitor. Donec felis leo, tristique sit amet velit eget, ullamcorper bibendum est. Phasellus commodo urna est, ut semper urna feugiat nec. Pellentesque ac nisi nec nunc congue facilisis. Pellentesque quis varius velit. Nulla pharetra viverra dolor non pulvinar. Nam maximus gravida metus ut convallis. Aliquam pharetra felis ante. Fusce dignissim at nulla eget consequat. Integer vulputate, arcu vitae maximus venenatis, neque arcu hendrerit diam, id sodales urna augue non augue. Nullam non lectus velit.
                        </div>
                        <div role="tabpanel" class="tab-pane top-10" id="features">
                            Phasellus fringilla neque vitae risus convallis pulvinar pretium ut odio. Nullam malesuada interdum aliquet. Phasellus lacinia tempor pulvinar. Quisque placerat arcu a rhoncus posuere. Curabitur sollicitudin nisi mi, ut vehicula libero congue et. Morbi nibh massa, porta in arcu vitae, aliquet bibendum tellus. Mauris iaculis scelerisque nisl, eget hendrerit nulla aliquam nec. Cras aliquet risus in tellus viverra malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus suscipit dictum nibh.
                        </div>
                        <div role="tabpanel" class="tab-pane" id="notes">
                            Sed dapibus risus neque, quis convallis felis porta sit amet. Morbi eleifend ipsum ac nibh rhoncus bibendum. Nam eu tempus neque, at auctor dolor. Mauris id vulputate quam. Maecenas pulvinar tempor pharetra. Aliquam dapibus velit in egestas feugiat. Sed viverra consectetur felis, at euismod justo vulputate ut.
                        </div>
                        <div role="tabpanel" class="tab-pane" id="reviews">
                            Sed viverra ante non nisi pretium sagittis. Morbi malesuada tincidunt lectus ornare accumsan. Etiam id justo tortor. Aliquam et lacinia lectus. Morbi molestie eget ligula a bibendum. Morbi tortor lacus, efficitur et mollis eu, auctor et lacus. Donec dignissim urna libero, ac mollis eros malesuada ac. Donec dignissim convallis efficitur. Integer ipsum tellus, porta faucibus libero id, faucibus egestas ligula. Phasellus egestas risus vestibulum ex finibus, ac dictum justo ullamcorper. Maecenas non sem varius, luctus leo nec, molestie arcu. Aenean libero metus, ultricies non elementum at, ornare quis nisi. Morbi accumsan cursus justo, nec euismod ante placerat fermentum. Suspendisse eu porta diam.
                        </div>
                       </div>
                </div>
            </div>
        </div><br>

        <%@ include file="footer.jsp"%>
    </body>

</html>