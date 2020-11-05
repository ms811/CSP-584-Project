<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Grocery Hub</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="./style.css" rel="stylesheet" type="text/css">
</head>

<body>
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <title>Grocery Hub</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
      /* Remove the navbar's default rounded borders and increase the bottom margin */ 
      .navbar {
        margin-bottom: 50px;
        border-radius: 0;
      }
      
      /* Remove the jumbotron's default bottom margin */ 
       .jumbotron {
          background: url('images/header.jpg') no-repeat center center fixed;
          -moz-background-size: cover;
          -webkit-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          margin-bottom: 0;
          background-color: #1ee671;
      }
     
      /* Add a gray background color and some padding to the footer */
      footer {
        background-color: #f2f2f2;
        padding: 25px;
      }
  
      body { 
      background: url('images/background.jpg') no-repeat center center fixed;
      -moz-background-size: cover;
      -webkit-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
  
    </style>
  </head>
  <body>
  
  <div class="jumbotron">
    <div class="container text-center">
      <!-- <a href="#">
          <img class="logo" src="images/logo.png" alt="CSGO Howl" style="float:left";>
      </a> 	 -->
      <h1>Grocery Hub</h1>      
      <p>WE CARE FOR YOU</p>
    </div>
  </div>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="pages/accountpage.jsp"><span class="glyphicon glyphicon-user">
          <%
          String fileName = "test.txt";
          InputStream ins = application.getResourceAsStream(fileName);
          try
          {
          if(ins == null)
          {
          response.setStatus(response.SC_NOT_FOUND);
          }
          else
          {
          BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
          String data;
          while((data= br.readLine())!= null)
          {
          out.println(data+"<br>");
          }
          } 
          }
          catch(IOException e)
          {
          out.println(e.getMessage());
          }
          %>
        <li><a href="pages/accountpage.jsp"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="./login.jsp"><span class="glyphicon glyphicon-off"></span> Login</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>

<%@ include file="parts/searchbar.jsp" %>

<br>

<%@ include file="pages/content.jsp" %> 
</body>
<%@ include file="parts/footer.jsp" %> 
</html>
