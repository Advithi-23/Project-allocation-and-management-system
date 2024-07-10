<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee Details</title>
</head>
<body>
<%
    // Retrieving parameters from the request and handling potential null values
    String empIdParam = request.getParameter("emp_id");
    String empName = request.getParameter("emp_name");
    String email = request.getParameter("email");

    if(empIdParam == null || empName == null || email == null || empIdParam.isEmpty() || empName.isEmpty() || email.isEmpty()) {
%>
        <h1>Invalid input data</h1><br>
<%
    } else {
        try {
            int empId = Integer.parseInt(empIdParam);

            // Database connection parameters
            String dbDriver = "com.mysql.cj.jdbc.Driver";
            String dbURL = "jdbc:mysql://localhost:3306/internship";
            String dbUsername = "root";
            String dbPassword = "";

            // Registering JDBC driver and establishing connection
            Class.forName(dbDriver);

            try (Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                 PreparedStatement ps = con.prepareStatement("UPDATE emp SET emp_name=?, email=? WHERE emp_id=?")) {

                // Setting parameters for the PreparedStatement
                ps.setString(1, empName);
                ps.setString(2, email);
                ps.setInt(3, empId);

                // Executing the update operation
                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) {
%>
                    <h1><%= rowsUpdated %> Record updated successfully</h1><br>
<%
                } else {
%>
                    <h1>There was a problem updating the record</h1><br>
<%
                }
            }
        } catch (NumberFormatException e) {
            out.print("Invalid Employee ID format: " + e.getMessage());
        } catch (Exception e) {
            out.print("Can't process: " + e.getMessage());
        }
    }
%>
</body>
</html>
