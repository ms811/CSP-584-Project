// //import apple.laf.JRSUIConstants;
// import com.mongodb.*;
// import com.mongodb.client.MongoDatabase;
// import java.util.*;

// public class MongoDBDataStoreUtilities {
//     static DBCollection myReviews;

//     public static DBCollection getConnection() {
//         MongoClient mongo;
//         mongo = new MongoClient("localhost", 27017);

//         DB db = mongo.getDB("CustomerReviews");
//         myReviews = db.getCollection("myReviews");
//         return myReviews;
//     }

//     public static void main(String[] args) {

//         try {
//             MongoClient mongoClient = new MongoClient("localhost", 27017);
//             MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
//             System.out.println("Connect to database successfully");
//         } catch (Exception e) {
//             System.err.println(e.getClass().getName() + ": " + e.getMessage());
//         }
//     }

//     public static HashMap<String, ArrayList<Review>> selectReview() {
//         HashMap<String, ArrayList<Review>> reviews = null;

//         try {

//             getConnection();
//             DBCursor cursor = myReviews.find();
//             reviews = new HashMap<String, ArrayList<Review>>();
//             while (cursor.hasNext()) {
//                 BasicDBObject obj = (BasicDBObject) cursor.next();

//                 if (!reviews.containsKey(obj.getString("productName"))) {
//                     ArrayList<Review> arr = new ArrayList<Review>();
//                     reviews.put(obj.getString("productName"), arr);
//                 }
//                 ArrayList<Review> listReview = reviews.get(obj.getString("productName"));
//                 Review review = new Review(obj.getString("productName"), obj.getString("userName"), obj.getString("productType"),
//                         obj.getString("productMaker"), obj.getString("reviewRating"), obj.getString("reviewDate"), obj.getString("reviewText"),
//                         obj.getString("retailerpin"), obj.getString("price"), obj.getString("retailercity"), obj.getString("userAge"), obj.getString("userGender"), obj.getString("userOccupation"));
//                 //add to review hashmap
//                 listReview.add(review);

//             }
//             return reviews;
//         } catch (Exception e) {
//             reviews = null;
//             return reviews;
//         }
//     }
// }

