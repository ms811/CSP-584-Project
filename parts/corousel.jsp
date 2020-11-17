<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type = "text/JavaScript">
  $(document).ready(function() {
    $('#Carousel').carousel({
        interval: 5000
    })
});
</script>
<!------ Include the above in your HEAD tag ---------->
<style>
  body{padding-top:20px;}
.carousel {
    margin-bottom: 0;
    padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
    height: 40px;
	width: 40px;
    background: none repeat scroll 0 0 #222222;
    border: 4px solid #FFFFFF;
    border-radius: 23px 23px 23px 23px;
    margin-top: 90px;
}
.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}
.carousel-indicators .active {
background: #428bca;
}
.container {
  padding: 2px 16px;
}
</style>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>







<div class="container">
    <div class="row">
		<div class="col-md-12">
                <div id="Carousel" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#Carousel" data-slide-to="1"></li>
                    <li data-target="#Carousel" data-slide-to="2"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner">
                    
                <div class="item active">
                	<div class="row">
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="https://s3-media2.fl.yelpcdn.com/bphoto/JiOmiuRPxKe7hPBcGi5OIw/o.jpg" alt="Image" style="width:250px;height:250px;"></a>  <div class="container"><h4><b>Jane Doe</b></h4> <p>Interior Designer</p> </div></div>
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="https://s3-media1.fl.yelpcdn.com/bphoto/9IsQCBd2nDSx6795O7kQEQ/o.jpg" alt="Image" style="width:250px;height:250px;"></a>hello</div>
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="https://s3-media2.fl.yelpcdn.com/bphoto/WBXDvsbBHGJGoD_Mtn4rLA/o.jpg" alt="Image" style="width:250px;height:250px;"></a></div>
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="https://s3-media1.fl.yelpcdn.com/bphoto/Dy5BxQv6rXaVwTHuvCawzw/o.jpg" alt="Image" style="width:250px;height:250px;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                		<div class="col-md-3"></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                </div><!--.carousel-inner-->
                  <a data-slide="prev" href="#Carousel" class="left carousel-control"><</a>
                  <a data-slide="next" href="#Carousel" class="right carousel-control">></a>
                </div><!--.Carousel-->
		</div>
	</div>
    </div>
    <div>

                    <c:forEach items="${restaurantslist}" var="restaurantslist">
                    <div>
                        <form>

                            <div>
                                <input type="hidden" name = "name" value="${restaurantslist.name}">
                                
                                
                                

                                    
                                        </div>
                                    </form>

                                    <div>
                                        <h6>$>>>{restaurantslist.name}</h6>
                                        
                                    </div>

                                </div>
                                </c:forEach>
                            </div>
</html>