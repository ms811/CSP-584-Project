import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Random;
import java.util.HashMap;
import java.util.*;
import java.util.Map;
import java.util.ArrayList;

public class MySqlDataStoreUtilities {
    static Connection conn = null;

    public static void getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=utf8", "root", "root");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

public static boolean insertUser(String username, String password, String userType) {
    try {

        getConnection();
        System.out.println(userType);
        String insertIntoCustomerRegisterQuery = "INSERT INTO login(user,pass,usertype) "
                + "VALUES (?,?,?);";

        PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, userType);
        pst.execute();
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return false;
    }

    return true;
}

public static HashMap<String, User> selectUser() {
    HashMap<String, User> hm = new HashMap<String, User>();
    try {
        getConnection();
        Statement stmt = conn.createStatement();
        String selectCustomerQuery = "select * from login";
        ResultSet rs = stmt.executeQuery(selectCustomerQuery);
//        System.out.println(rs);
        while (rs.next()) {
            User user = new User(rs.getString("user"), rs.getString("pass"), rs.getString("usertype"));
            hm.put(rs.getString("user"), user);

        }
//        System.out.println(hm);
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    return hm;
}
    
public static ArrayList<Restaurants> getRestaurants()
{	
	ArrayList<Restaurants> restaurantslist=new ArrayList<Restaurants>();
	try 
	{
		getConnection();
		
		String selectMorning="select * from morning";
		PreparedStatement pst = conn.prepareStatement(selectMorning);
		ResultSet rs = pst.executeQuery();
	System.out.println(rs);
		while(rs.next())
		{	
        Restaurants restaurant = new Restaurants(rs.getString("name"),rs.getString("image"),rs.getString("contactno"),rs.getString("url"),rs.getString("rating"));
				restaurantslist.add(restaurant);
		}
        // System.out.println(hm);
	}
	catch(Exception e)
	{
        System.out.println(e.getMessage());
	}
	return restaurantslist;
}

public static ArrayList<Foods> getFoods()
{   
    ArrayList<Foods> foodslist=new ArrayList<Foods>();
    try 
    {
        getConnection();
        
        String selectFood="select * from  grocery_food where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectFood);
        pst.setString(1,"food");
        ResultSet rs = pst.executeQuery();
    System.out.println(rs);
        while(rs.next())
        {   
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getString("product_currentprice"),rs.getInt("product_discount"),rs.getInt("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            foodslist.add(food);
        }
        // System.out.println(hm);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    return foodslist;
}

public static HashMap<String,Foods> getFoodItems()
{   
    HashMap<String,Foods> foodslist = new HashMap<String,Foods>();
    try 
    {
        getConnection();
        
        String selectLaptop="select * from  grocery_food where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectLaptop);
        pst.setString(1,"food");
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println("foodid: "+rs.getInt("product_id"));
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getString("product_currentprice"),rs.getInt("product_discount"),rs.getInt("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            foodslist.put(rs.getString("product_id"), food);                

        }
    }
    catch(Exception e)
    {

    }
    return foodslist;          
}

public static ArrayList<Product> getallproducts()
{   
    ArrayList<Product> allproductslist = new ArrayList<Product>();
    try 
    {
        getConnection();
        
        String allproducts="select * from  grocery_food ";
        PreparedStatement pst = conn.prepareStatement(allproducts);
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println(rs.getInt("product_id"));
            Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getString("product_currentprice"),rs.getInt("product_discount"),rs.getInt("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            allproductslist.add(product);                

        }
    }
    catch(Exception e)
    {

    }
    return allproductslist;          
}

public static HashMap<String,OrderItem> getAllOrders()
{   
    HashMap<String,OrderItem> orderslist = new HashMap<String,OrderItem>();
    try 
    {
        getConnection();
        
        String getorders="select * from  orders ";
        PreparedStatement pst = conn.prepareStatement(getorders);
        ResultSet rs = pst.executeQuery();
        System.out.print("i am more than welcome"+rs);
    }
    catch(Exception e)
    {

    }
    return orderslist;          
}


}