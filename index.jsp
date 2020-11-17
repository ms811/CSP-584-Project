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
  <body onload="init()">
  
  <div class="jumbotron">
    <div class="container text-center">
      <!-- <a href="#">
          <img class="logo" src="images/logo.png" alt="CSGO Howl" style="float:left";>
      </a> 	 -->
      <h1>Grocery Hub</h1>      
      <p>WE CARE FOR YOU</p>
    </div>
  </div>

<%@ include file="parts/navbar.jsp" %>
<%@ include file="parts/searchbar.jsp" %>
<br>
<%@ include file="pages/content.jsp" %> 
</body>
<%@ include file="parts/footer.jsp" %> 
</html>
