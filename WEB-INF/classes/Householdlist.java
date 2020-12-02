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


@WebServlet("/Householdlist")

public class Householdlist extends HttpServlet {

	/* Console Page Displays all the Consoles and their Information in Game Speed */
	ArrayList<Foods> householdlist = new ArrayList<Foods>();
	String reviewslist;
  //   public void init() throws ServletException
  //   {
		
		// try{
		// 	bcblist = MySqlDataStoreUtilities.getBcb();
		// 	HashMap<String, ArrayList<Review>> hm = MongoDBDataStoreUtilities.selectReview();
  //           System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+bcblist);
		// }
		// catch(Exception e)
		// {

		// }
  //       // System.out.println(allrestaurants.getName());
  //   }
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
       try{

			householdlist = MySqlDataStoreUtilities.getHousehold();
			System.out.println("khfvsrmjgtfdjycv,dsvfgxdhctmykv,guhkumhtgfedvfgbhnm,kjl");
		}
		catch(Exception e)
		{

		}
			System.out.println("After catch for household"+householdlist);

        request.setAttribute("Foodslist",householdlist);
        request.getRequestDispatcher("household.jsp").forward(request,response);
    }
}