<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("username");
session.putValue("userid",userid);
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");

Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from login where user='"+userid+"' and pass='"+password+"'");

try{
rs.next();
if(rs.getString("pass").equals(password)&&rs.getString("user").equals(userid))
{
response.sendRedirect("../index.jsp");
}
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>