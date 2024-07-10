<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int task_id=Integer.parseInt(request.getParameter("task_id"));
int proj_id=Integer.parseInt(request.getParameter("proj_id"));
String description=request.getParameter("description");
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");
int assigned_to=Integer.parseInt(request.getParameter("assigned_to"));
String status = request.getParameter("status");

try{
	String dbDriver = "com.mysql.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/internship";
	Class.forName(dbDriver);
	Connection con = DriverManager.getConnection(dbURL,"root","");
	
	String sql="update task set  proj_id=?, description=?, start_date=?, end_date=?, assigned_to=?, status=? WHERE task_id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setInt(1,proj_id);
	ps.setString(2, description);
	ps.setString(3, start_date);
	ps.setString(4, end_date);
	ps.setInt(5, assigned_to);
	ps.setString(6, status);
	ps.setInt(7, task_id);
	
	int i=ps.executeUpdate();
	if(i>0)
	{
%>
		<h1><%=i%> Record updated successfully</h1><br>
		<%
		}
	else
	{
		
		%>
				<h1>there is a problem in Record updated</h1><br>
		<%
		
	}
}

catch (Exception e)
{
out.print("cant process"+e);
}

%>

</body>
</html>