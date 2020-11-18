<!DOCTYPE html>
<html>
  <head>
    <title>Home Page</title>
    <meta charset="utf-8">

    <style>
      /* #maincontent {
        background-color: white;
      } */

      #leftnavbar {
        border-radius: 10%;
      }

      div {
        border-radius: 20%;
      }

      img {
        border-radius: 20%;
      }
    </style>
  </head>

  <body>
    <div class="container-fluid" >
      <div class="col-lg-4" >
        <div class="col-sm">
          <div class="panel panel-primary" id="leftnavbar">
            <div class="panel-heading">Food</div>
            <div class="panel-body"><a href="${pageContext.request.contextPath}/Foodslist"><img src="./images/food.jpg" class="rounded" style="width:100%" alt="Food Image"></div>
            <div class="panel-footer">Veg-Non Veg</div>
          </div>
        </div>
        <div class="col-sm"> 
          <div class="panel panel-primary">
            <div class="panel-heading">Beverages</div>
            <div class="panel-body"><a href="${pageContext.request.contextPath}/pages/beverages.jsp"><img src="./images/beverages.jpg" class="img-responsive" style="width:100%" alt="Beverages Image"></a></div>
            <div class="panel-footer">Soft Drinks, Alcohol</div>
          </div>
        </div>
        <div class="col-sm"> 
          <div class="panel panel-primary">
            <div class="panel-heading">Household</div>
            <div class="panel-body"><a href="${pageContext.request.contextPath}/pages/household.jsp"><img src="./images/household.jpg" class="img-responsive" style="width:100%" alt="Household Supplies Image"></a></div>
            <div class="panel-footer">Dish Washing Liquids, Clothes Surf etc</div>
          </div>
        </div>
        <div class="col-sm">
          <div class="panel panel-primary">
            <div class="panel-heading">Personal Care, Health & Beauty</div>
            <div class="panel-body"><a href="${pageContext.request.contextPath}/pages/pchb.jsp"><img src="./images/personalcare.jpg" class="img-responsive" style="width:100%" alt="Personal Care and Beauty Image"></a></div>
            <div class="panel-footer">Soaps, BodyWash etc </div>
          </div>
        </div>
        <div class="col-sm"> 
          <div class="panel panel-primary">
            <div class="panel-heading">Body Care & Beauty</div>
            <div class="panel-body"><a href="${pageContext.request.contextPath}/pages/bcb.jsp"><img src="./images/bodycare.jpg" class="img-responsive" style="width:100%" alt="Body Care and Beauty Image"></a></div>
            <div class="panel-footer">Face Wash Etc</div>
          </div>
        </div>
        <div class="col-sm"> 
          <div class="panel panel-primary">
            <div class="panel-heading">Deals</div>
            <div class="panel-body" id="leftnavbar"><a href="${pageContext.request.contextPath}/pages/deals.jsp"><img src="./images/deals.jpg" class="img-responsive" style="width:100%" alt="Deal Image"></a></div>
            <div class="panel-footer">Deals of the Day</div>
          </div>
        </div>
      </div>
    
      <div class="col-lg-8" id="maincontent">
        <img src="./images/main.webp" class="img-responsive" style="width:100%; margin-bottom: 20px;" alt="Main image in the landing page">
        <div class="row">
          <div class="col-md-6">
            <img src="./images/food/sourdough.jpg" class="rounded mx-auto d-block" style="height: 250px; width: 250px; margin-left: 150px; border-radius: 20px;">
          </div>
          <div class="col-md-6">
            <img src="./images/food/salad.png" class="rounded mx-auto d-block" style="height: 250px; width: 250px; margin-left: 50px;">
          </div>
          
        </div>
        
      </div>    
        
    </div>
    
  </body>
  
</html>



