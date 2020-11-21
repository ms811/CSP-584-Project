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


@WebServlet("/Beverageslist")

public class Beverageslist extends HttpServlet {

	/* Console Page Displays all the Consoles and their Information in Game Speed */
	ArrayList<Foods> beverageslist = new ArrayList<Foods>();
	String reviewslist;
    public void init() throws ServletException
    {
		
		try{
			beverageslist = MySqlDataStoreUtilities.getBeverages();
			HashMap<String, ArrayList<Review>> hm = MongoDBDataStoreUtilities.selectReview();
            System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+beverageslist);
		}
		catch(Exception e)
		{

		}
        // System.out.println(allrestaurants.getName());
    }
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
       try{

			beverageslist = MySqlDataStoreUtilities.getBeverages();
			System.out.println("khfvsrmjgtfdjycv,dsvfgxdhctmykv,guhkumhtgfedvfgbhnm,kjl");
		}
		catch(Exception e)
		{

		}
			System.out.println("After catch"+beverageslist);

        request.setAttribute("Foodslist",beverageslist);
        request.getRequestDispatcher("beverages.jsp").forward(request,response);
    }
}