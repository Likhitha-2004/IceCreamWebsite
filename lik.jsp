<%@ page language="java" contentType="text/html" import ="java.sql.*" %>
<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String pass= request.getParameter("pass");
String pass2= request.getParameter("pass2");



try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","liki");

PreparedStatement pst= con.prepareStatement("insert into regforms values(?,?,?,?)");

pst.setString(1,name);
pst.setString(2,email);
pst.setString(3,pass);
pst.setString(4,pass2);



pst.executeUpdate();

if(pst!=null)
{
out.print("<h2> Registered Successfull :)</h2>");
%>
				<center><h1><b>user:</b>
            <%= request.getParameter("name")%>
         </h1>
		<a href="reg.html"><input type="submit" value="home">
		</center>
		<%
		
}
pst.close();
con.close();  
}
catch(Exception e)
{%>

<%=e%>

<%}
	
%>

