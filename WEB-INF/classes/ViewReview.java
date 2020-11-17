

// import java.io.IOException;
// import java.io.PrintWriter;

// import com.mongodb.MongoClient;
// import com.mongodb.DB;
// import com.mongodb.DBCollection;
// import com.mongodb.BasicDBObject;
// import com.mongodb.DBObject;
// import com.mongodb.DBCursor;

// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;
// import java.util.*;

// @WebServlet("/ViewReview")

// public class ViewReview extends HttpServlet {

//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//         response.setContentType("text/html");
//         PrintWriter pw = response.getWriter();
//         Utilities utility = new Utilities(request, pw);
//         review(request, response);
//     }

//     protected void review(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         try {
//             response.setContentType("text/html");
//             PrintWriter pw = response.getWriter();
//             Utilities utility = new Utilities(request, pw);
//             if (!utility.isLoggedin()) {
//                 HttpSession session = request.getSession(true);
//                 session.setAttribute("login_msg", "Please Login to view Review");
//                 response.sendRedirect("Login");
//                 return;
//             }
//             String productName = request.getParameter("name");
//             HashMap<String, ArrayList<Review>> hm = MongoDBDataStoreUtilities.selectReview();
//             String userName = "";
//             String reviewRating = "";
//             String reviewDate;
//             String reviewText = "";
//             String price = "";
//             String city = "";
//             String userAge = "";
//             String userGender = "";
//             String userOccupation = "";
//             String pin = "";

//         } catch (Exception e) {
//             System.out.println(e.getMessage());
//         }


//     }

//     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//         response.setContentType("text/html");
//         PrintWriter pw = response.getWriter();

//     }
// }