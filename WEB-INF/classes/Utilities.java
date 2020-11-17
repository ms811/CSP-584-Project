import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Random;

@WebServlet("/Utilities")

/* 
	Utilities class contains class variables of type HttpServletRequest, PrintWriter,String and HttpSession.

	Utilities class has a constructor with  HttpServletRequest, PrintWriter variables.
	  
*/

public class Utilities extends HttpServlet{
	HttpServletRequest req;
	PrintWriter pw;
	String url;
	HttpSession session; 
	public Utilities(HttpServletRequest req, PrintWriter pw) {
		this.req = req;
		this.pw = pw;
		this.url = this.getFullURL();
		this.session = req.getSession(true);
	}

public boolean isLoggedin(){
    if (session.getAttribute("username")==null)
        return false;
    return true;
}

public void logout(){
        session.removeAttribute("username");
        session.removeAttribute("usertype");
    }

public String username(){
        if (session.getAttribute("username")!=null){
            System.out.println(session.getAttribute("username"));
            return session.getAttribute("username").toString();
        }
        else{
        return null;
            }
    }

public String getFullURL() {
    String scheme = req.getScheme();
    String serverName = req.getServerName();
    int serverPort = req.getServerPort();
    String contextPath = req.getContextPath();
    StringBuffer url = new StringBuffer();
    url.append(scheme).append("://").append(serverName);

    if ((serverPort != 80) && (serverPort != 443)) {
        url.append(":").append(serverPort);
    }
    url.append(contextPath);
    url.append("/");
    return url.toString();
}
public void storeProduct(String id,String image,String name,int quantity, int price, String category){
    System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiii"+username());
    OrdersHashMap.orders.containsKey(username());

    if(!OrdersHashMap.orders.containsKey(username())){ 
            ArrayList<OrderItem> arr = new ArrayList<OrderItem>();
            OrdersHashMap.orders.put(username(), arr);
        }
        ArrayList<OrderItem> orderItems = OrdersHashMap.orders.get(username());
        HashMap<String,Foods> allfoods = new HashMap<String,Foods> (); 


        if(category.equals("food")){
            Foods foods;
            try{
                allfoods = MySqlDataStoreUtilities.getFoodItems();
            }
            catch(Exception e){
                System.out.println(e);
            }
                        // System.out.println(allfoods);

            foods = allfoods.get(id);
            // System.out.println("llllllllllllllllllllllllllllllllll"+foods);
            OrderItem orderitem = new OrderItem(foods.getproduct_image(), foods.getproduct_name(), quantity, price,foods.getproduct_discount(),category,foods.getproduct_id());
            orderItems.add(orderitem);
         // System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"+orderItems);   
        }
}

    public ArrayList<OrderItem> getCustomerOrders(){
        ArrayList<OrderItem> order = new ArrayList<OrderItem>(); 
        if(OrdersHashMap.orders.containsKey(username()))
            order= OrdersHashMap.orders.get(username());
        return order;
    }

    public int CartCount(){
        if(isLoggedin())
        return getCustomerOrders().size();
        return 0;
    }
}