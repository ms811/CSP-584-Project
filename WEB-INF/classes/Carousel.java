/* This code is used to implement carousel feature in Website. Carousels are used to implement slide show feature. This  code is used to display
all the accessories related to a particular product. This java code is getting called from cart.java. The product which is added to cart, all the
accessories realated to product will get displayed in the carousel.*/


import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;



public class Carousel{

	public String  carouselfeature(Utilities utility){

		ProductRecommenderUtility prodRecUtility = new ProductRecommenderUtility();

		HashMap<Integer, Product> hm = new HashMap<Integer, Product>();
		StringBuilder sb = new StringBuilder();
		String myCarousel = null;

		String name = null;
		String CategoryName = null;
		if(CategoryName==null){
			try{
			hm=MySqlDataStoreUtilities.retriveProducts();
            System.out.println("carousel"+hm);
			name = "";
			}catch(Exception e)
			{

			}

		}
		HashMap<String,String> prodRecmMap = new HashMap<String,String>();
		prodRecmMap = prodRecUtility.readOutputFile();




		int l =0;
		for(String user: prodRecmMap.keySet())
		{
			if(user.equals(utility.username()))
			{
				String products = prodRecmMap.get(user);
				products=products.replace("[","");
				products=products.replace("]","");
				products=products.replace("\"", " ");
				ArrayList<String> productsList = new ArrayList<String>(Arrays.asList(products.split(",")));

		        myCarousel = "myCarousel"+l;

				sb.append("<div id='content' ><div class='post'><h2 class='title meta'>");
				sb.append("<a style='font-size: 24px;'>"+""+" Recommended Products</a>");

				sb.append("</h2>");

				sb.append("<div class='container'>");
				/* Carousels require the use of an id (in this case id="myCarousel") for carousel controls to function properly.
				The .slide class adds a CSS transition and animation effect, which makes the items slide when showing a new item.
				Omit this class if you do not want this effect.
				The data-ride="carousel" attribute tells Bootstrap to begin animating the carousel immediately when the page loads.

				*/
				sb.append("<div class='carousel slide' id='"+myCarousel+"' data-ride='carousel'>");

				/*The slides are specified in a <div> with class .carousel-inner.
				The content of each slide is defined in a <div> with class .item. This can be text or images.
				The .active class needs to be added to one of the slides. Otherwise, the carousel will not be visible.
				*/
				sb.append("<div class='carousel-inner'>");

				int k = 0;
				for(String prod : productsList){
					prod= prod.replace("'", "");
					Product prodObj = new Product();
                    System.out.print("did i stop here");
					prodObj = ProductRecommenderUtility.getProduct(prod.trim());
					System.out.println("product in corousel:"+prodObj);
                    System.out.println(prodObj.getproduct_name());
					if (k==0 )
					{
                        System.out.println("value of k"+k);

						sb.append("<div class='item active' ><div class='col-md-6' style = 'background-color: #58acfa;width:25vw;border :1px solid #141415'>");
					}
					 else
					{
						 System.out.println("value of k"+k);
						sb.append("<div class='item' ><div class='col-md-6' style = 'background-color: #58acfa ;width:40vw;border :1px solid #141415' >");
					}
					sb.append("<div id='shop_item'>");
					sb.append("<h3>"+prodObj.getproduct_name()+"</h3>");
					 sb.append("<strong>"+prodObj.getproduct_currentprice()+"$</strong><ul>");
					 System.out.println(prodObj.getproduct_category()+"/hhh/"+prodObj.getproduct_image());
					 sb.append("<li id='item'><img src='"+prodObj.getproduct_image()+"' alt='' width='200' height='200'/></li>");
					 sb.append("<li><form method='post' action='CartServlet'>" +
					 		"<input type='hidden' name='name' value='"+prod.trim()+"'>"+
					 		"<input type='hidden' name='type' value='"+prodObj.getproduct_category()+"'>"+
						// "<input type='hidden' name='maker' value='"+prodObj.getRetailer()+"'>"+
					 		"<input type='hidden' name='access' value='"+" "+"'>"+
					 		"<input type='submit' class='btnbuy' value='Buy Now'></form></li>");
					 sb.append("<li><form method='post' action='WriteReview'>"+"<input type='hidden' name='name' value='"+prodObj.getproduct_name()+"'>"+
					 		"<input type='hidden' name='type' value='"+prodObj.getproduct_category()+"'>"+
					 		// "<input type='hidden' name='maker' value='"+prodObj.getRetailer()+"'>"+
					 		"<input type='hidden' name='access' value='"+" "+"'>"+
					 		"<input type='hidden' name='price' value='"+prodObj.getproduct_category()+"'>"+
					 		"<input type='submit' value='WriteReview' class='btnreview'></form></li>");
					 sb.append("<li><form method='post' action='ViewReview'>"+"<input type='hidden' name='name' value='"+prodObj.getproduct_name()+"'>"+
					 		"<input type='hidden' name='type' value='"+prodObj.getproduct_category()+"'>"+
					 		// "<input type='hidden' name='maker' value='"+prodObj.getRetailer()+"'>"+
					 		"<input type='hidden' name='access' value='"+" "+"'>"+
					 		"<input type='submit' value='ViewReview' class='btnreview'></form></li>");

					 sb.append("</ul></div></div>");
					 sb.append("</div>");

					 k++;

				}


				sb.append("</div>");
				/*		The "Left and right controls" part:
					This code adds "left" and "right" buttons that allows the user to go back and forth between the slides manually.
				The data-slide attribute accepts the keywords "prev" or "next", which alters the slide position relative to its current position.
				*/
				 sb.append("<a class='left carousel-control' href='#"+myCarousel+"' data-slide='prev' style = 'width : 10% ;background-color:#D7e4ef; opacity :1'>"+
				 		"<span class='glyphicon glyphicon-chevron-left' style = 'color :red'></span>"+
				 		"<span class='sr-only'>Previous</span>"+
						"</a>");
				 sb.append("<a class='right carousel-control' href='#"+myCarousel+"' data-slide='next' style = 'width : 10% ;background-color:#D7e4ef; opacity :1'>"+
				 		"<span class='glyphicon glyphicon-chevron-right' style = 'color :red'></span>"+

							"<span class='sr-only'>Next</span>"+
				 			"</a>");


				 sb.append("</div>");

				 sb.append("</div></div>");
				 sb.append("</div>");
				 l++;

				}
			}
			return sb.toString();
		}
	}
