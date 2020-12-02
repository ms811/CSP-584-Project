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


@WebServlet("/Bcblist")

public class Bcblist extends HttpServlet {

	/* Console Page Displays all the Consoles and their Information in Game Speed */
	ArrayList<Foods> bcblist = new ArrayList<Foods>();
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

			bcblist = MySqlDataStoreUtilities.getBcb();
			System.out.println("khfvsrmjgtfdjycv,dsvfgxdhctmykv,guhkumhtgfedvfgbhnm,kjl");
		}
		catch(Exception e)
		{

		}
			System.out.println("After catch"+bcblist);

        request.setAttribute("Foodslist",bcblist);
        request.getRequestDispatcher("bcb.jsp").forward(request,response);
    }
}