<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
</head>
<body>
    <%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship", "root", "");
        String query = "SELECT * FROM emp WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            // User authenticated
            // Store user information in session attributes
            session.setAttribute("loggedInUserEmail", email);
            session.setAttribute("loggedInUserName", rs.getString("emp_name"));
%>
            <div class="alert alert-success" role="alert">
                Login successful!
            </div>
            <!-- Redirect to userdetails.jsp after 3 seconds -->
            <script>
                setTimeout(function() {
                    window.location.href = '../boards/dashboard.jsp';
                }, 3000);
            </script>
<%
        } else {
%>
            <div class="alert alert-danger" role="alert">
                Invalid email or password. Please try again.
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
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { }
        }
    }
%>

</body>
</html>
