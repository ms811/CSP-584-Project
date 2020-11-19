<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="java.util.ArrayList" %>

    <%

    String productID = request.getParameter("productID");    
    String ProductName = request.getParameter("productName");
    String productDes = request.getParameter("productDes");
    String productCPrice = request.getParameter("productCPrice");
    String productDis = request.getParameter("productDis");
    String productAPrice = request.getParameter("productAPrice");
    String productCat = request.getParameter("productCat");
    String productImg = request.getParameter("productImg");
    String productMan = request.getParameter("productMan");
    String productInv = request.getParameter("productInv");
    String productZip = request.getParameter("productZip");
    String productRating = request.getParameter("productRating");   
    System.out.println(ProductName);
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into grocery_food(product_id,product_name,product_description,product_currentprice,product_discount,product_actualprice,product_category,product_image,product_manufacturer,inventory,store_zipcode,rating)values('"+productID+"','"+ProductName+"','"+productDes+"','"+productCPrice+"','"+productDis+"','"+productAPrice+"','"+productCat+"','"+productImg+"','"+productMan+"','"+productInv+"','"+productZip+"','"+productRating+"')");
    response.sendRedirect("../login.jsp");
    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }
    %>