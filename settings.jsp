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
	int task_id = Integer.parseInt(request.getParameter("task_id"));
	out.println("task_id is:"+task_id);
	try
		{
			String dbDriver= "com.mysql.jdbc.Driver";
		    String dbURL= "jdbc:mysql://localhost:3306/internship"; 
		    Class.forName(dbDriver);
		    Connection con = DriverManager.getConnection (dbURL, "root", "");
			Statement statement = con.createStatement();
		String sql="select * from task where task_id="+task_id;
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next())
		{
	%>
	
		<h1>Update Data</h1>
		<form method="post" action="setting_process.jsp">
		
		TASK_ID:<br>
		<input type="text" name="task_id" value="<%=resultSet.getInt("task_id") %>">
		<br>
		PROJECT_ID:<br>
		<input type="text" name="proj_id" value="<%=resultSet.getInt("proj_id") %>">
		<br>
		DESCRIPTION:<br>
		<input type="text" name="description" value="<%=resultSet.getString("description") %>">
		<br>
		START_DATE:<br>
		<input type="text" name="start_date" value="<%=resultSet.getString("start_date") %>">
		<br>
		END_DATE:<br>
		<input type="text" name="end_date" value="<%=resultSet.getString("end_date") %>">
		<br>
		ASSIGNED_TO:<br>
		<input type="text" name="assigned_to" value="<%=resultSet.getString("assigned_to") %>">
		<br>
		STATUS:<br>
		<input type="text" name="status" value="<%=resultSet.getString("status") %>">
		<br>
		<input type="submit" value="UPDATE">
		</form>
	<%
	}
	con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
</body>
</html>