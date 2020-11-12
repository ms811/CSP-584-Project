<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Food</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->
        <link rel="stylesheet" href="./style.css" type="text/css">
    </head>
    <body>
        <%@ include file="../parts/header.jsp"%>
        <%@ include file="../parts/navbar.jsp"%>
        <!-- <% for(int i = 0; i < 3; i+=1) { %> -->

        <div class="container">    
            <div class="row">
              <div class="col-sm-4">
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><a href="${pageContext.request.contextPath}/parts/product.jsp"><img src="../images/food/sourdough.jpg" class="img-responsive" style="width:100%" alt="Sourdough bread Image"></a></div>
                  <div class="panel-footer">Sourdough Bread </div>
                </div>
              </div>
              <div class="col-sm-4"> 
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/cereal.jpg" class="img-responsive" style="width:100%" alt="Cereal box Image"></div>
                  <div class="panel-footer">Breakfast</div>
                </div>
              </div>
              <div class="col-sm-4"> 
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/honey.jpg" class="img-responsive" style="width:100%" alt="Honey bottle Image"></div>
                  <div class="panel-footer">Honey</div>
                </div>
              </div>
            </div>
          </div><br>

          <!-- <% } %> -->
          <div class="container">    
            <div class="row">
              <div class="col-sm-4">
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/proteinbar.jpg" class="img-responsive" style="width:100%" alt="Proteinbar box Image"></div>
                  <div class="panel-footer">Snacks</div>
                </div>
              </div>
              <div class="col-sm-4"> 
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/pasta.jpg" class="img-responsive" style="width:100%" alt="Pasta Image"></div>
                  <div class="panel-footer">Dinner</div>
                </div>
              </div>
              <div class="col-sm-4"> 
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/salad.png" class="img-responsive" style="width:100%" alt="Salad Image"></div>
                  <div class="panel-footer">Sides</div>
                </div>
              </div>
            </div>

            <%@ include file="../parts/footer.jsp"%>
    </body>
</html>