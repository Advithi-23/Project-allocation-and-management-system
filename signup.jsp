<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Registration Result</h1>
        <%
            // Retrieve form data
            String emp_id = request.getParameter("emp_id");
            String emp_name = request.getParameter("emp_name");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String skills = request.getParameter("skills");
            String experience = request.getParameter("experience");
            String password = request.getParameter("password");

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/internship";
            String dbUsername = "root";
            String dbPassword = "";

            // Initialize connection and statement
            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Establish connection
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Prepare SQL statement for insertion
                String sql = "INSERT INTO emp (emp_id, emp_name, email, role, skills, experience, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, emp_id);
                stmt.setString(2,emp_name);
                stmt.setString(3, email);
                stmt.setString(4, role);
                stmt.setString(5, skills);
                stmt.setString(6, experience);
                stmt.setString(7, password);

                // Execute SQL statement
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
        %>
                    <div class="alert alert-success" role="alert">
                        Registration successful!
                    </div>
                    <!-- Redirect to dashboard.html after 3 seconds -->
                    <script>
                        setTimeout(function() {
                            window.location.href = '../login/login.html';
                        }, 3000);
                    </script>
        <%
                } else {
        %>
                    <div class="alert alert-danger" role="alert">
                        Registration failed. Please try again.
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <div class="alert alert-danger" role="alert">
                    Error: <%= e.getMessage() %>
                </div>
        <%
            } finally {
                // Close resources
                if (stmt != null) {
                    try { stmt.close(); } catch (SQLException e) { }
                }
                if (conn != null) {
                    try { conn.close(); } catch (SQLException e) { }
                }
            }
        %>
    </div>
</body>
</html>
