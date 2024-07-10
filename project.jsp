<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Insert</title>
    <link rel="stylesheet" href="./main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">
    <style>
        .main {
            padding-top: 100px; /* Adjust this value based on your navbar height */
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="top_navbar">
            <div class="hamburger">
                <div class="one"></div>
                <div class="two"></div>
                <div class="three"></div>
            </div>
            <div class="top_menu">
                <div class="logo">
                    PMS
                </div>
                <ul>
                    <li>
                        <a href="#">
                            <i class="fa fa-search"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-bell"></i>
                        </a>
                    </li>
                    <li>
                        <a href="../users/userdetails.htm">
                            <i class="fa fa-user"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="sidebar">
            <ul>
                <li>
                    <a href="../boards/dashboard.jsp"><i class="fa fa-align-justify" aria-hidden="true"></i>&nbsp;&nbsp; Backlog</a>
                </li>
                <li>
                    <a href="../boards/dashboard.jsp"><i class="fa fa-desktop" aria-hidden="true"></i>&nbsp;&nbsp; Board</a>
                </li>
                <li>
                    <a href="../reports/report.html"><i class="fa fa-bar-chart" aria-hidden="true"></i>&nbsp;&nbsp; Report</a>
                </li>
                <li>
                    <a href="../issues/new.html"><i class="fa fa-files-o" aria-hidden="true"></i>&nbsp; New Task / Issue</a>
                </li>
                <li>
                    <a href="../issues/NewProj.html"><i class="fa fa-files-o" aria-hidden="true"></i>&nbsp; New Project</a>
                </li>
                <li>
                    <a href="../settings/settings.html"><i class="fa fa-cogs" aria-hidden="true"></i>&nbsp;&nbsp; Settings</a>
                </li>
                <li>
                    <a href="../users/userdetails.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp; My Profile</a>
                </li>
                <li>
                    <a href="../login/login.html"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp; Logout</a>
                </li>
                <br>
            </ul>
        </div>  
        
        <!-- Main content -->
       <div class="main" align="center">
            <h1>Data Insert</h1>
            <% 
                Connection con = null;
                PreparedStatement ps = null;
                try {
                    // Retrieve form data
                    int projId = Integer.parseInt(request.getParameter("proj_id"));
                    String projName = request.getParameter("proj_name");
                    String description = request.getParameter("description");
                    String startDate = request.getParameter("start_date");
                    String endDate = request.getParameter("end_date");
                    int managerId = Integer.parseInt(request.getParameter("manager_id"));

                    // Database connection parameters
                    String URL = "jdbc:mysql://localhost:3306/internship"; 
                    String username = "root";
                    String password = "";

                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(URL, username, password);

                    // Prepare and execute SQL statement
                    String sql = "INSERT INTO project (proj_id, proj_name, description, start_date, end_date, manager_id) VALUES (?, ?, ?, ?, ?, ?)";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, projId);
                    ps.setString(2, projName);
                    ps.setString(3, description);
                    ps.setString(4, startDate);
                    ps.setString(5, endDate);
                    ps.setInt(6, managerId);
                    ps.executeUpdate();

                    // Display success message
            %>
                    <font size="+3" color="green">
                        Successfully new project has been created.
                    </font>
            <% 
                } catch (SQLException e) {
                    // Display SQL exception
            %>
                    <font size="+3" color="red">
                        SQL Error: <%= e.getMessage() %>
                    </font>
            <% 
                } catch (Exception e) {
                    // Display other exceptions
                    StringWriter sw = new StringWriter();
                    e.printStackTrace(new PrintWriter(sw));
                %>
                    <font size="+3" color="red">
                        Error: <%= sw.toString() %>
                    </font>
                <%
                } finally {
                    // Close resources
                    if (ps != null) {
                        try {
                            ps.close();
                        } catch (SQLException e) {
                            // Log or handle the exception
                        }
                    }
                    if (con != null) {
                        try {
                            con.close();
                        } catch (SQLException e) {
                            // Log or handle the exception
                        }
                    }
                }
            %>
        </div>
    </div>
</body>
</html>