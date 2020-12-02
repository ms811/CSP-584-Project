import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


@WebServlet("/Foodslist")

public class Foodslist extends HttpServlet {

	/* Console Page Displays all the Consoles and their Information in Game Speed */
	ArrayList<Foods> foodslist = new ArrayList<Foods>();
	String reviewslist;
	// ArrayList<Review> flatArray  = new ArrayList<>();
	// ArrayList<Review> x;
    public void init() throws ServletException
    {
		
		try{
			foodslist = MySqlDataStoreUtilities.getFoods();
			// HashMap<String, ArrayList<Review>> hm = MongoDBDataStoreUtilities.selectReview();
			// Set<String> keySet = hm.keySet();
			// ArrayList<String> listOfKeys  = new ArrayList<String>(keySet);  
			// Collection<ArrayList<Review>> values = hm.values();
  	// 		ArrayList<ArrayList<Review>> listOfValues  = new ArrayList<>(values); 
  	// 		ArrayList<Review> flatArray = new ArrayList<>();
  	// 		listOfValues.forEach(flatArray::addAll);
  	// 		Review[] arrayOfClusters = flatArray.toArray(new Review[0]);
   //          System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+flatArray);
		}
		catch(Exception e)
		{

		}
        // System.out.println(allrestaurants.getName());
    }
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Review> flatArray  = new ArrayList<>();
		
       try{

			foodslist = MySqlDataStoreUtilities.getFoods();
			HashMap<String, ArrayList<Review>> hm = MongoDBDataStoreUtilities.selectReview();
System.out.println("ooooooooo"+hm.values());
			// for(HashMap<String, ArrayList<Review>> entry : hm.entrySet()) {
   //  			System.out.println(entry.getKey() + ": " +  entry.getValue().toString());
			// }
			 
			 Collection<ArrayList<Review>> values = hm.values();
  			 ArrayList<ArrayList<Review>> listOfValues  = new ArrayList<>(values); 

// ArrayList<Review> x = listOfValues.subList(0,1);

  			listOfValues.forEach(flatArray::addAll);
  			
  			 System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+flatArray);
     //        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+flatArray);

		}
		catch(Exception e)
		{

		}
			HttpSession session = request.getSession(); 
		 session.setAttribute("Reviews",flatArray);
        request.setAttribute("Foodslist",foodslist);
        request.getRequestDispatcher("food.jsp").forward(request,response);
    }
}