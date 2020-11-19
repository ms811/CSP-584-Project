import java.io.IOException;
import java.io.*;

public class Review implements Serializable {
    private String productName;
    private String Name;
    private String productid;
    private String date;
    private String rating;
    private String feedback;


    public Review(String productName, String Name, String productid, String date,
                  String rating, String feedback) {
        this.productName = productName;
        this.Name = Name;
        this.rating = rating;
        this.productid= productid;
        this.date = date;
        this.feedback = feedback;
    }

    public String getProductName() {
        return productName;
    }

    public String getName() {
        return Name;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getRating() {
        return rating;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getProductId() {
        return productid;
    }

    public void setProductId(String productid) {
        this.productid = productid;
    }

}
