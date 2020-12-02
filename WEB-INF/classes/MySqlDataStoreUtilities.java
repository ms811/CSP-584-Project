import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;  
import java.sql.Date;
import java.time.LocalDate; 
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

public static boolean insertUser(String username, String password, String userType, String zipCode, String email) {
    try {

        getConnection();
        System.out.println(userType);
        String insertIntoCustomerRegisterQuery = "INSERT INTO login(user,pass,usertype,zipCode,email) "
                + "VALUES (?,?,?,?,?);";

        PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, userType);
        pst.setString(4,zipCode);
        pst.setString(5,email);
        pst.execute();
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return false;
    }

    return true;
}

public static boolean deleteOrder(int orderId) {
        try {

            getConnection();
            String deleteOrderQuery = "Delete from customerorders where OrderId=?";
            PreparedStatement pst = conn.prepareStatement(deleteOrderQuery);
            pst.setInt(1, orderId);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

public static void insertOrder(int userId,String customerName,String email,String userAddress,String creditCardNo,double discount,int orderId,Date orderTime,Date shippingDate,String orderName,String category,double orderPrice,String storeId,String storeAddress,String zipCode, String deliveredOnTime, String transactionStatus,int review)
{
    System.out.println("srtgetryerwtyergbtyvw4r5"+customerName);
    System.out.println(userAddress);
    System.out.println(creditCardNo);
    try
    {
    
        getConnection();
        String insertIntoCustomerOrderQuery = "INSERT INTO customerorders(userId,customerName,email,userAddress,creditCardNo,discount,orderId,orderTime,shippingDate,orderName,category,orderPrice,storeId,storeAddress,zipCode,deliveredOnTime,transactionStatus,review)"
        + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";  
            
        PreparedStatement pst = conn.prepareStatement(insertIntoCustomerOrderQuery);
        //set the parameter for each column and execute the prepared statement
        pst.setInt(1,userId);
        pst.setString(2,customerName);
        pst.setString(3,email);
        pst.setString(4,userAddress);
        pst.setString(5,creditCardNo);
        pst.setDouble(6,discount);
        pst.setInt(7,orderId);
        pst.setDate(8,orderTime);
        pst.setDate(9,shippingDate);
        pst.setString(10,orderName);
        pst.setString(11,category);
        pst.setDouble(12,orderPrice);
        
        pst.setString(13,storeId);
        pst.setString(14,storeAddress);
        pst.setString(15,zipCode);
        pst.setString(16,deliveredOnTime);
        pst.setString(17,transactionStatus);
        pst.setInt(18,review);

        System.out.println("yyyyyy"+pst);
        pst.execute();
    }
    catch(Exception e)
    {
    System.out.print(e);
    }   
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
            User user = new User(rs.getString("user"), rs.getString("pass"), rs.getString("usertype"),rs.getString("zipCode"),rs.getString("email"));
            hm.put(rs.getString("user"), user);

        }
//        System.out.println(hm);
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    return hm;
}
    
public static HashMap<Integer, ArrayList<OrderPayment>> selectOrder()
{   

    HashMap<Integer, ArrayList<OrderPayment>> orderPayments=new HashMap<Integer, ArrayList<OrderPayment>>();
        
    try
    {                   

        getConnection();
        //select the table 
        String selectOrderQuery ="select * from customerorders";            
        PreparedStatement pst = conn.prepareStatement(selectOrderQuery);
        ResultSet rs = pst.executeQuery();  
        ArrayList<OrderPayment> orderList=new ArrayList<OrderPayment>();
        while(rs.next())
        {
            if(!orderPayments.containsKey(rs.getInt("OrderId")))
            {   
                ArrayList<OrderPayment> arr = new ArrayList<OrderPayment>();
                orderPayments.put(rs.getInt("orderId"), arr);
            }
            ArrayList<OrderPayment> listOrderPayment = orderPayments.get(rs.getInt("OrderId"));     
            System.out.println("data is"+rs.getInt("OrderId")+orderPayments.get(rs.getInt("OrderId")));

            //add to orderpayment hashmap
            OrderPayment order= new OrderPayment(rs.getInt("OrderId"),rs.getString("userName"),rs.getString("orderName"),rs.getDouble("orderPrice"),rs.getString("userAddress"),rs.getString("creditCardNo"),rs.getDate("shippingDate").toLocalDate());
            listOrderPayment.add(order);
                    
        }
                
                    
    }
    catch(Exception e)
    {
        
    }
    return orderPayments;
}

public static ArrayList<OrPayment> selectrder(int id)
{   

    ArrayList<OrPayment> orderPayments=new ArrayList<OrPayment>();
        
    try
    {                   

        getConnection();
        //select the table 
        String selectOrderQuery ="select * from customerorders where orderId=?";            
        PreparedStatement pst = conn.prepareStatement(selectOrderQuery);
        pst.setInt(1, id);
        System.out.println(id+"just know");

        ResultSet rs = pst.executeQuery();
        while(rs.next()){
             System.out.println("what else");
            OrPayment order= new OrPayment(rs.getInt("userId"),rs.getString("customerName"),rs.getString("email"),rs.getString("userAddress"),rs.getString("creditCardNo"),rs.getInt("discount"),rs.getInt("orderId"),rs.getDate("orderTime"),rs.getDate("shippingDate"),rs.getString("orderName"),rs.getString("category"),rs.getDouble("orderPrice"),rs.getString("storeId"),rs.getString("storeAddress"),rs.getString("zipCode"),rs.getString("deliveredOnTime"),rs.getString("transactionStatus"),rs.getInt("review"));
           
            orderPayments.add(order);
        }
                
                    
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
   System.out.println(orderPayments+"pppppppppppppppppppppppppppppppppppppppppppp");
    return orderPayments;
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
        
        String selectFood="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectFood);
        pst.setString(1,"food");
        ResultSet rs = pst.executeQuery();
    System.out.println(rs);
        while(rs.next())
        {   
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
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

public static ArrayList<Foods> getPcbh()
{   
    ArrayList<Foods> pchblist=new ArrayList<Foods>();
    try 
    {
        getConnection();
        
        String selectFood="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectFood);
        pst.setString(1,"pchb");
        ResultSet rs = pst.executeQuery();
    System.out.println(rs);
        while(rs.next())
        {   
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            pchblist.add(food);
        }
        // System.out.println(hm);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    return pchblist;
}

public static ArrayList<Foods> getBeverages()
{   
    ArrayList<Foods> beverageslist=new ArrayList<Foods>();
    try 
    {
        getConnection();
        
        String selectFood="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectFood);
        pst.setString(1,"beverages");
        ResultSet rs = pst.executeQuery();
    System.out.println(rs);
        while(rs.next())
        {   
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            beverageslist.add(food);
        }
         System.out.println(beverageslist);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    return beverageslist;
}

public static ArrayList<Foods> getHousehold()
{   
    ArrayList<Foods> householdlist=new ArrayList<Foods>();
    try 
    {
        getConnection();
        
        String selectFood="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectFood);
        pst.setString(1,"household");
        ResultSet rs = pst.executeQuery();
    System.out.println(rs);
        while(rs.next())
        {   
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            householdlist.add(food);
        }
         // System.out.println(bcblist);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    return householdlist;
}

public static ArrayList<Foods> getBcb()
{   
    ArrayList<Foods> bcblist=new ArrayList<Foods>();
    try 
    {
        getConnection();
        
        String selectFood="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectFood);
        pst.setString(1,"bcb");
        ResultSet rs = pst.executeQuery();
    System.out.println(rs);
        while(rs.next())
        {   
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            bcblist.add(food);
        }
         System.out.println(bcblist);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    return bcblist;
}

public static HashMap<String,Foods> getFoodItems()
{   
    HashMap<String,Foods> foodslist = new HashMap<String,Foods>();
    try 
    {
        getConnection();
        
        String selectLaptop="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectLaptop);
        pst.setString(1,"food");
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println("foodid: "+rs.getInt("product_id"));
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            foodslist.put(rs.getString("product_id"), food);                

        }
    }
    catch(Exception e)
    {

    }
    return foodslist;          
}


public static HashMap<String,Foods> getPchbItems()
{   
    HashMap<String,Foods> pchblist = new HashMap<String,Foods>();
    try 
    {
        getConnection();
        
        String selectLaptop="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectLaptop);
        pst.setString(1,"pchb");
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println("foodid: "+rs.getInt("product_id"));
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            pchblist.put(rs.getString("product_id"), food);                

        }
    }
    catch(Exception e)
    {

    }
    return pchblist;          
}

public static HashMap<String,Foods> getBeveragesItems()
{   
    HashMap<String,Foods> beverageslist = new HashMap<String,Foods>();
    try 
    {
        getConnection();
        
        String selectLaptop="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectLaptop);
        pst.setString(1,"beverages");
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println("foodid: "+rs.getInt("product_id"));
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            beverageslist.put(rs.getString("product_id"), food);                

        }
    }
    catch(Exception e)
    {

    }
    return beverageslist;          
}

public static HashMap<String,Foods> getHouseholdItems()
{   
    HashMap<String,Foods> householdlist = new HashMap<String,Foods>();
    try 
    {
        getConnection();
        
        String selectLaptop="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectLaptop);
        pst.setString(1,"household");
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println("foodid: "+rs.getInt("product_id"));
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            householdlist.put(rs.getString("product_id"), food);                

        }
    }
    catch(Exception e)
    {

    }
    return householdlist;          
}

public static HashMap<String,Foods> getBcbItems()
{   
    HashMap<String,Foods> bcblist = new HashMap<String,Foods>();
    try 
    {
        getConnection();
        
        String selectLaptop="select * from  groceryhub where product_category=?";
        PreparedStatement pst = conn.prepareStatement(selectLaptop);
        pst.setString(1,"bcb");
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println("foodid: "+rs.getInt("product_id"));
            Foods food = new Foods(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            bcblist.put(rs.getString("product_id"), food);                

        }
    }
    catch(Exception e)
    {

    }
    return bcblist;          
}


public static ArrayList<Product> getallproducts()
{   
    ArrayList<Product> allproductslist = new ArrayList<Product>();
    try 
    {
        getConnection();
        
        String allproducts="select * from  groceryhub ";
        PreparedStatement pst = conn.prepareStatement(allproducts);
        ResultSet rs = pst.executeQuery();
    
        while(rs.next())
        {   
            System.out.println(rs.getInt("product_id"));
            Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            allproductslist.add(product);                

        }
    }
    catch(Exception e)
    {

    }
    return allproductslist;          
}

// public static ArrayList<Product> getallproducts()
// {   
//     ArrayList<Product> allproductslist = new ArrayList<Product>();
//     try 
//     {
//         getConnection();
        
//         String allproducts="select * from  grocery_food ";
//         PreparedStatement pst = conn.prepareStatement(allproducts);
//         ResultSet rs = pst.executeQuery();
    
//         while(rs.next())
//         {   
//             System.out.println(rs.getInt("product_id"));
//             Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getString("product_currentprice"),rs.getInt("product_discount"),rs.getInt("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
//             allproductslist.add(product);                

//         }
//     }
//     catch(Exception e)
//     {

//     }
//     return allproductslist;          
// }

public static HashMap<String,OrderItem> getAllOrders()
{   
    HashMap<String,OrderItem> orderslist = new HashMap<String,OrderItem>();
    try 
    {
        getConnection();
        
        String getorders="select * from  customerorders";
        PreparedStatement pst = conn.prepareStatement(getorders);
        ResultSet rs = pst.executeQuery();
        System.out.print("i am more than welcome"+rs);
    }
    catch(Exception e)
    {

    }
    return orderslist;          
}

        public static HashMap<Integer,Product> retriveProducts()
    {
      HashMap<Integer,Product> hm=new HashMap<Integer,Product>();
      try
      {
        getConnection();

        String selectConsole="select * from  groceryhub";
        PreparedStatement pst = conn.prepareStatement(selectConsole);
       
        ResultSet rs = pst.executeQuery();
        // System.out.println("data"+rs.size());
        while(rs.next())
        { 
            System.out.println("1");
            Product con = new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_description"),rs.getDouble("product_currentprice"),rs.getInt("product_discount"),rs.getDouble("product_actualprice"),rs.getString("product_category"),rs.getString("product_image"),rs.getString("product_manufacturer"),rs.getInt("inventory"),rs.getString("store_zipcode"),rs.getInt("rating"));
            // System.out.println(rs.getString("product_name"));
            hm.put(rs.getInt("product_id"), con);
            con.setproduct_id(rs.getInt("product_id"));
        }
      }
      catch(Exception e)
      {
      }
      return hm;
    }

    public static HashMap<String, OrderPayment> selectSaleAmount() {
    HashMap<String, OrderPayment> hm = new HashMap<String, OrderPayment>();
    try {
        getConnection();

        //String selectAcc = "select DISTINCT(temp.orderName),temp.saleAmount,orders.orderPrice from orders, (select orderName, count(orderName) as saleAmount from orders group by orderName) as temp where orders.orderName = temp.orderName";
        String selectAcc = "select DISTINCT(temp.orderName),temp.saleAmount,customerorders.orderPrice from customerOrders, (select orderName, count(orderName) as saleAmount from customerOrders group by orderName) as temp where customerorders.orderName = temp.orderName";
        PreparedStatement pst = conn.prepareStatement(selectAcc);
        ResultSet rs = pst.executeQuery();

        int i = 0;
        while (rs.next()) {
            OrderPayment orderPayment = new OrderPayment(rs.getString("orderName"), rs.getDouble("orderPrice"), rs.getInt("saleAmount"));
            i++;
            hm.put(String.valueOf(i), orderPayment);
            //orderPayment.setOrderId(Integer.parseInt(rs.getString("Id")));
        }
    } catch (Exception e) {
        System.out.print(e);
    }
    return hm;
}

public static HashMap<String, OrderPayment> selectDailyTransaction() {
    HashMap<String, OrderPayment> hm = new HashMap<String, OrderPayment>();
    try {
        getConnection();

        String selectAcc = "SELECT count(orderTime) as soldAmount, orderTime from customerOrders group by orderTime";
        PreparedStatement pst = conn.prepareStatement(selectAcc);
        ResultSet rs = pst.executeQuery();

        int i = 0;
        while (rs.next()) {
            OrderPayment orderPayment = new OrderPayment(rs.getInt("soldAmount"), rs.getDate("orderTime"));
            i++;
            hm.put(String.valueOf(i), orderPayment);
            //orderPayment.setId(rs.getString("Id"));
        }
    } catch (Exception e) {
    }
    return hm;
}


}