<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="../index.jsp">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li></li>
              <ul class="nav navbar-nav navbar-right">
          <%
          System.out.println("loggedout"+session.getAttribute("username"));
          if(session.getAttribute("username")!=null){
              String username = session.getAttribute("username").toString();
             if(session.getAttribute("usertype").equals("Customer")){ %>
                    <li><a href="pages/accountpage.jsp"><span class="glyphicon glyphicon-hand-right"></span> <% out.println("Hello "+session.getAttribute("username")+"<br>"); %></a></li>
                    <li><a href="pages/accountpage.jsp"><span class="glyphicon glyphicon-hand-right"></span> Your Account</a></li>
                    <li><a href="Logout" ><span class="glyphicon glyphicon-off"></span>Logout</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
          <% 

            }
            if (session.getAttribute("usertype").equals("StoreManager")){ %>
              <li><a href="#">ProductModify</a></li>
              <li><a href="#">View orders</a></li>
              <li><a href="#">*****</a></li>
              <li><a href="#"> ***********</a></li>
              <li><a href="pages/accountpage.jsp"><span class="glyphicon glyphicon-hand-right"></span> <% out.println("Hello "+session.getAttribute("username")+"<br>"); %></a></li>
              <li><a href="pages/accountpage.jsp"><span class="glyphicon glyphicon-hand-right"></span> Your Account</a></li>
              <li><a href="Logout" ><span class="glyphicon glyphicon-off"></span>Logout</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>

          <%
            }
          }
          if (session.getAttribute("username")==null){
                     %>
                    <li><a href="./login.jsp" ><span class="glyphicon glyphicon-off"></span>Login</a></li>
                    <li><a href="./login.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
          <%
            }
          %>
          
      </ul>
    </div>
  </div>
</nav>

