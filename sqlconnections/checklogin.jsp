<!-- 

<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="java.util.ArrayList" %>

    <%

    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from login where user='"+userid+"' and pass='"+pwd+"'");
    ArrayList<String> loggeinuser = new ArrayList<String>();



    if (rs.next()) {
        loggeinuser.add(rs.getString("user"));
        loggeinuser.add(rs.getString("pass"));
        loggeinuser.add(rs.getString("usertype"));
        System.out.println(loggeinuser);

        String nameOfTextFile = "C:\\apache-tomcat-7.0.34\\webapps\\project\\test.txt";
        try {   
            PrintWriter pw = new PrintWriter(new FileOutputStream(nameOfTextFile));
            pw.flush();
            pw.println(""+rs.getString("user"));
            //clean up
            pw.close();
        } catch(IOException e) {
        out.println(e.getMessage());
        }

        session.setAttribute("userid", userid);
        response.sendRedirect("../index.jsp");
    } else {
        request.setAttribute("errorMessage", "Invalid user or password");
        request.getRequestDispatcher("../login.jsp").forward(request, response);
             }

    %> -->