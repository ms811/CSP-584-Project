<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

        <%@ include file="../parts/header.jsp"%>
        <%@ include file="../parts/navbar.jsp"%>

           <div class="container-fluid">
            <div class="row">
              <div class="col-sm-14">
                <div class="panel panel-primary">
                  <c:forEach items="${Foodslist}" var="foodslist">
                    
                    <div class="col-md-3">
                      <form id="myform" action=./product.jsp method="POST">
                        <div>
                                <input type="hidden" name = "product_id" value="${foodslist.product_id}">
                                <input type="hidden" name = "product_name" value="${foodslist.product_name}">
                                <input type="hidden" name = "product_description" value="${foodslist.product_description}">
                                <input type="hidden" name = "product_currentprice" value="${foodslist.product_currentprice}">
                                <input type="hidden" name = "product_discount" value="${foodslist.product_discount}">
                                <input type="hidden" name = "product_actualprice" value="${foodslist.product_actualprice}">
                                <input type="hidden" name = "product_category" value="${foodslist.product_category}">
                                <input type="hidden" name = "product_image" value="${foodslist.product_image}">
                                <input type="hidden" name = "product_manufacturer" value="${foodslist.product_manufacturer}">
                                <input type="hidden" name = "inventory" value="${foodslist.inventory}">
                                <input type="hidden" name = "store_zipcode" value="${foodslist.store_zipcode}">
                                <input type="hidden" name = "rating" value="${foodslist.rating}">

                              
                        </div>

                      <a href="#" class="thumbnail">
                        <div class="panel-body"><img src="${foodslist.product_image}" alt="Image" style="width:250px;height:250px;"></div></a>  
                        <div>
                           <div class="panel-footer">${foodslist.product_name}</div>
                           <div class="panel-footer" style="overflow: hidden;">
                                <p style="float: left;">current Price : ${foodslist.product_currentprice}</p>
                                <p style="float: center;text-decoration: line-through;">($${foodslist.product_actualprice})</p>
                          </div>
                          
                          <div class="panel-footer">$${foodslist.product_discount} Off</div>
                          
                                        <div><button  type="submit" class="btn btn-lg btn-brand btn-full-width"> <a><i>Item Details</i></a></button></div>
                                            
                        </div>
                        <div>  &nbsp;  </div>
                        <div>   &nbsp;</div>
                    </form>
                    </div>
                                    
                                
                                        
                    </c:forEach>
  
              </div>
              
              
            </div>
          </div>
        </div><br>

        

            <%@ include file="../parts/footer.jsp"%>
 
            