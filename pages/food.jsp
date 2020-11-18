<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
    <%
                        String id = request.getParameter("userid");
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "project";
                        String userid = "root";
                        String password = "root";
                        try {
                        Class.forName(driver);
                        } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                        }
                       %>
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
        <% for(int i = 0; i < 3; i+=1) { %>

        <div class="container">    
            <div class="row">
              <div class="col-sm-4">
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/sourdough.jpg" class="img-responsive" style="width:100%" alt="Sourdough bread Image"></div>
                  <div class="panel-footer">Sourdough Bread </div>
                    <div>
                   
                       <%
                            try{
                           
                            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root", "f8lw2A9sp");
                            Statement statement=connection.createStatement();
                            String sql ="select * from grocery where category = 'food'";
                            ResultSet resultSet = statement.executeQuery(sql);
                            while(resultSet.next()){
                            String Naming = resultSet.getString("name") ;
                           String cat = resultSet.getString("category") ;
                           session.setAttribute("Name",Naming);
                           session.setAttribute("Category",cat);
                          out.println(session.getAttribute("Name"));
                            %>
                                                  
<!--
                           String Naming = resultSet.getString("name") ;
                           String cat = resultSet.getString("category") ;
                           sess.setAttribute("Name",Naming);
                           sess.setAttribute("Category",cat);
-->
                           
                           <div class="panel-footer"><%=resultSet.getString("name") %></div>
                           
                           <div class="panel-footer"><%=resultSet.getString("category") %></div>
                               
                            <p style="text-decoration: line-through;" class="panel-footer"><%=resultSet.getString("name") %><p>
                           
                           <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
                        
                           </%div>
                                <form action="cart.jsp">
                                <input type="submit" value="checkout">
                                </form>
                  <button type="button"> <a href="review.jsp">Creazione Nuovo Corso</a></button>
                </div>
              </div>
              <div class="col-sm-4"> 
                <div class="panel panel-primary">
                  <div class="panel-heading">Food</div>
                  <div class="panel-body"><img src="../images/food/cereal.jpg" class="img-responsive" style="width:100%" alt="Cereal box Image"></div>
                  <div class="panel-footer">Breakfast</div>
                  <button type="button"> <a href="../Restaurantslist">Creazione</a></button>
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

          <% } %>
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