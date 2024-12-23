<%@ page language="java" contentType="text/html" import ="java.sql.*" %>
<%

String uname = request.getParameter("uname");
String pass= request.getParameter("pass");
try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","liki");


Statement s=c.createStatement();
			String q1="select * from regforms where uname=? and pass=?";
			s.executeQuery(q1);
			ResultSet rs=s.getResultSet();
			if(rs.next())
			{
				System.out.println("Login Success with username:"+rs.getString("name"));
				
			}
			else
			{
				System.out.println("Login Failed");
			}
con.close();  
}
catch(Exception e)
{%>

<%=e%>

<%}
	
%>

