import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@WebServlet("/ProductData")
public class ProductData extends HttpServlet {
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{

PrintWriter pw= response.getWriter();
response.setContentType("text/html");			
 pw.println("<html>");
 pw.println("<body>");

		Utilities utility = new Utilities(request,pw);
		pw.print("<div id='content'><div class='post'><h2 class='title meta'>");
		pw.print("</h2><div class='entry'><table id='bestseller'>");
		pw.print("<tr>");
		pw.print("<td><div id='shop_item'>");
			Product data= (Product)request.getAttribute("data");
			pw.print("<h3>"+data.getproduct_name()+"</h3>");
			pw.print("</ul></div></td>");
			pw.print("</tr>");
			pw.print("</table></div></div></div>");		
		}
		catch(Exception e)
		{
			
		}
	}
	
	public void destroy()	{
      // do nothing.
	}
	

}