<%@page import="java.util.ArrayList" %>
    <head>
        <%@ include file="header.jsp"%>
        <%@ include file="navbar.jsp"%>
        
        <style>
            .container {
                max-width: 80vw;
                margin: auto;
                background: white;
                padding: 10px;
                }
        </style>
        </head>
        <div class="container">    
            <div class="row">
                <!-- This section is for the product image -->
                <div class="col-md-6">
                    <div class="panel panel-primary">
                    
                    <div class="panel-body"><img src='<%=request.getParameter("product_image")%>' class="img-responsive" style="width:100%" alt="Moisturizer Image"></div>
                    </div>
                </div>

                <div class="col-md-6" id="productdetails">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><input type="text" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_name")%>' name="name"/>
                                
                            </h1>
                        </div>
                    </div>
                   

                    <div class="row">
                        <div class="col-md-12">
                            <span><input disabled type="text" style="border: none;border-color: transparent;background-color: #6495ED;border-radius: 25px;" value='category:<%=request.getParameter("product_category")%>' name="product_category"/></span>
                        </div>
                    </div><br>

                    <div class="row">
                        
                        <div class="col-md-3">
                            <h6><%=request.getParameter("rating")%><span class="glyphicon glyphicon-star" aria-hidden="true"></span> Average Rating</h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 bottom-rule">
                            <h2 class="product-price"><input disabled type="text" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_currentprice")%>' name="product_currentprice"/>
                                

                            </h2>
                        </div>
                    </div>

                    <div class="row add-to-cart">
                        <form method="post" action="CartServlet">
                        <div class="col-md-5 product-qty">
                            Quantity:
                            <input type="number" id="myNumber" value ='1' min="1" max='<%=request.getParameter("inventory")%>' name="quantity" />
                            <input type="hidden" value='<%=request.getParameter("product_currentprice")%>' name="price"/>
                            <input type="hidden" value='<%=request.getParameter("product_id")%>' name="id"/>
                                <input type="hidden" value='<%=request.getParameter("product_name")%>' name="name"/>
                                <input type="hidden" value='<%=request.getParameter("product_image")%>' name="image"/>
                                <input type="hidden" value='<%=request.getParameter("product_category")%>' name="category"/>
                       
                        </div>

                        <div class="col-md-4">
                            <input type="submit" class="btn btn-lg btn-brand btn-full-width" value="Add to Cart">
                        </div>
                    </form>
                    </div>

                    <div class="row">
                        <div class="col-md-4 col-md-offset-1 text-center">
                            <span class="monospaced"><%=request.getParameter("inventory")%> Items Available In Stock</span>
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
                         <a href="#notes" aria-controls="notes" role="tab" data-toggle="tab">Add Review</a>
                        </li>
                        <li role="presentation">
                            <a href="#showreviews" aria-controls="notes" role="tab" data-toggle="tab">ShowReviews</a>
                        </li>
                        <li role="presentation">
                         <a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">Reviews</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="description">
                            <input disabled type="text" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_description")%>' name="product_description"/>
                        </div>
                        <div role="tabpanel" class="tab-pane top-10" id="features">
                            <input disabled type="text" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_description")%>' name="product_description"/>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="notes">
                            <form id="feedback" action="mongodbconnections/reviews.jsp">
                                <div class="pinfo">Your personal info</div>
                                <div class="pinfo">Name</div>   
                            <div class="form-group">
                                <div class="col-md-12 inputGroupContainer">
                                <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input  name="name" placeholder="John Doe" class="form-control"  type="text">
                                </div>
                                </div>
                            </div>
                            <br><br>
                            <div class="pinfo">Date</div>
                            <div class="form-group">
                                <div class="col-md-12 inputGroupContainer">
                                <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input name="date" type="date" class="form-control" >
                                </div>
                                </div>
                            </div>
                            <br><br>
                            <div class="pinfo">Rate our Product.</div>
                            
                            <div class="form-group">
                                <div class="col-md-12 inputGroupContainer">
                                <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-heart"></i></span>
                                <select class="form-control" name = "rating" id="rating">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    </select>
                                    </div>
                                </div>
                                </div>
                            
                            <br><br>

                            <h1><input type="hidden" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_name")%>' name="productname" id="productname"/></h1>
                            <h1><input type="hidden" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_id")%>' name="productid" id="productid"/></h1>
                            <div class="pinfo">Write your feedback.</div>
                            <div class="form-group">
                                <div class="col-md-12 inputGroupContainer">
                                <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                <textarea class="form-control" name = "feedback" id="feedback" rows="3"></textarea>
                                </div>
                                </div>
                            </div>
                            <br><br><br><br>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                            
                            
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="showreviews">
                            <h1>reviews</h1>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="reviews">
                            <form id="feedback" action="review.jsp">
                            <h1><input type="hidden" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_name")%>' name="productname" id="productname"/></h1>
                            <h1><input type="hidden" style="border: none;border-color: transparent;"value='<%=request.getParameter("product_id")%>' name="productid" id="productid"/></h1>
                            <%@ include file="review.jsp"%>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                       </div>
                </div>
            </div>
        </div><br>
        <%
        ArrayList<String> obg = new ArrayList<String>();
            String name = (String)request.getParameter("product_name");
            String image = (String)request.getParameter("product_image");
            String price = (String)request.getParameter("product_currentprice");
            String id =(String)request.getParameter("product_id");
            String description =(String)request.getParameter("product_description");
            String discount =(String)request.getParameter("product_discount");
            String actualprice =(String)request.getParameter("product_actualprice");
            String category =(String)request.getParameter("product_category");
            String manufacturer =(String)request.getParameter("product_manufacturer");
            String inventory =(String)request.getParameter("inventory");
            String zipcode =(String)request.getParameter("product_zipcode");
            String rating =(String)request.getParameter("rating");
            obg.add(id);
            obg.add(name);
            obg.add(description);
            obg.add(price);
            obg.add(discount);
            obg.add(actualprice);
            obg.add(category);
            obg.add(image);
            obg.add(manufacturer);
            obg.add(inventory);
            obg.add(zipcode);
            obg.add(rating);
            
            
            session.setAttribute("name", name);
                       
            session.setAttribute("image", image);
            session.setAttribute("price", price);
            session.setAttribute("obj",obg);%>
<div>
    
</div>

        <%@ include file="footer.jsp"%>

<div>
    
</div>
    <scipt>
   
    </scipt>
    </body>

</html>