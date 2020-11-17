import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.lang.*;
import javax.swing.JCheckBox;

@WebServlet("/CartServlet")

public class CartServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();


		/* From the HttpServletRequest variable name,type,maker and acessories information are obtained.*/

		Utilities utility = new Utilities(request, pw);
		String image = (String)request.getParameter("image");
		String name = request.getParameter("name");
		String q = request.getParameter("quantity");
		int quantity = Integer.parseInt(q);
		String id = request.getParameter("id");
		
		String p =(String)request.getParameter("price");
		int price = Integer.parseInt(p);
		String category = request.getParameter("category");

		/* StoreProduct Function stores the Purchased product in Orders HashMap.*/	
		System.out.println(id+"aaaaaaaaaaaaaaaa"+image+"bbbbbbbbbbb"+name+"ccccccccccc"+quantity+"ddddddddd"+price+"eeeeeeeee"+category);
		utility.storeProduct(id,image, name, quantity, price,category);
		displayCart(request, response);
	}
	

/* displayCart Function shows the products that users has bought, these products will be displayed with Total Amount.*/

	protected void displayCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		Utilities utility = new Utilities(request,pw);
		
		if(!utility.isLoggedin()){
			HttpSession session = request.getSession(true);				
			session.setAttribute("login_msg", "Please Login to add items to cart");
			response.sendRedirect("login.jsp");
			return;
		}
		
		request.getRequestDispatcher("/parts/header.jsp").include(request, response);
		request.getRequestDispatcher("/parts/navbar.jsp").include(request, response);
		pw.print("<div id='content'><div class='post'><h2 class='title meta'>");
		pw.print("<a style='font-size: 24px;'>Cart("+utility.CartCount()+")</a>");
		pw.print("</h2><div class='entry'>");
		pw.print("<form name ='Cart' action='CheckOut' method='post'>");
		if(utility.CartCount()>0)
		{
			pw.print("<table  class='gridtable'>");
			int i = 1;
			int total = 0;
			
		

				for (OrderItem oi : utility.getCustomerOrders()) 
			{
				pw.print("<form name ='CartForm' action='RemoveCart' method='post'>");
				pw.print("<tr>");
				pw.print("<td>"+i+".</td><td>"+oi.getName()+"</td><td>: "+oi.getPrice()+"</td>");
				pw.print("<td><input type='submit' name='RemoveCart' value='Remove' class='btnbuy' /></td>");
				pw.print("<input type='hidden' name='orderName' value='"+oi.getName()+"'>");
				pw.print("<input type='hidden' name='orderPrice' value='"+oi.getPrice()+"'>");
				pw.print("</tr>");
				pw.print("</form>");
				total = total +oi.getPrice();
				i++;
			}
				pw.print("<form action='CheckOut' method='post'>");
				pw.print("<input type='hidden' name='orderTotal' value='"+total+"'>");	
				pw.print("<tr><th></th><th>Total</th><th>"+total+"</th>");
			pw.print("<tr><td></td><td></td><td><input type='submit' name='CheckOut' value='CheckOut' class='btnbuy' /></td>");
			pw.print("</table></form>");
			/* This code is calling Carousel.java code to implement carousel feature*/
			// pw.print(carousel.carouselfeature(utility));
		}
		else
		{
			pw.print("<h4 style='color:red'>Your Cart is empty</h4>");
		}
		pw.print("</div></div></div>");	
		request.getRequestDispatcher("/parts/footer.jsp").include(request, response);	
}


}