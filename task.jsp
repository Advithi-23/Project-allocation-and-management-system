<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Insert</title>
    <meta charset="UTF-8">
    <title>Task</title>
     <link rel="stylesheet" href="./main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">
    <style>
        .main {
            padding-top: 100px; /* Adjust this value based on your navbar height */
        }
    </style>
    <!-- <script>
        $(document).ready(function() {
            $(".hamburger").click(function() {
                $(".wrapper").toggleClass("collapse");
            });
        });
    </script> -->
    <!-- Add your CSS links here -->
    <!-- Include any necessary CSS stylesheets here -->
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
                                <i class="fa fa-search"></i></a>
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
            <!-- Navbar content -->
        </div>
        
        <div class="sidebar">
         <ul>
                    <li>
                        <a href="../boards/dashboard.jsp"><i class="fa fa-align-justify" aria-hidden="true"></i>&nbsp;&nbsp;
                            Backlog</a>
                    </li>

                    <li>
                        <a href="../boards/dashboard.jsp"><i class="fa fa-desktop" aria-hidden="true"></i>
                            &nbsp;&nbsp;
                            Board</a>
                    </li>

                    <li>
                        <a href="../reports/report.html"><i class="fa fa-bar-chart" aria-hidden="true"></i>
                            &nbsp;
                            &nbsp;
                            Report</a>
                    </li>

                    <li>
                        <a href="../issues/new.html"> <i class="fa fa-files-o" aria-hidden="true"></i>&nbsp; New Task / Issue</a>
                    </li>
                    <li>
                        <a href="../issues/NewProj.html"> <i class="fa fa-files-o" aria-hidden="true"></i>&nbsp; New Project</a>
                    </li>

                    <li>

                        <a href="../settings/settings.html"> <i class="fa fa-cogs" aria-hidden="true"></i> &nbsp;&nbsp; Settings</a>
                    </li>

                    <li>

                        <a href="../users/userdetails.jsp"> <i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp; My Profile</a>
                    </li>

                    <li>

                        <a href="../login/login.html">
                            <i class="fa fa-sign-out" aria-hidden="true"></i> &nbsp;&nbsp; Logout
                        </a>
                    </li>
                    <br>
        		</ul>
            <!-- Sidebar content -->
        </div>        
        <!-- Main content -->
        <div class="main" align="center">
        
            <h1>Data Insert</h1>
            <% 
                Connection con = null;
                PreparedStatement ps = null;
                try {
                    // Retrieve form data
                    int taskId = Integer.parseInt(request.getParameter("task_id"));
                    int projId = Integer.parseInt(request.getParameter("proj_id"));
                    String description = request.getParameter("description");
                    String startDate = request.getParameter("start_date");
                    String endDate = request.getParameter("end_date");
                    String assignedTo = request.getParameter("assigned_to");
                    String status = request.getParameter("status");

                    // Database connection parameters
                    String URL = "jdbc:mysql://localhost:3306/internship"; 
                    String username = "root";
                    String password = "";

                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(URL, username, password);

                    // Prepare and execute SQL statement
                    String sql = "INSERT INTO task (task_id, proj_id, description, start_date, end_date, assigned_to, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, taskId);
                    ps.setInt(2, projId);
                    ps.setString(3, description);
                    ps.setString(4, startDate);
                    ps.setString(5, endDate);
                    ps.setString(6, assignedTo);
                    ps.setString(7, status);
                    ps.executeUpdate();
                    
                    
                    response.sendRedirect("../boards/dashboard.jsp");
                    // Display success message
            %>
                    <font size="+3" color="green">
                        Successfully created new task .
                    </font>
            <% 
                } catch (Exception e) {
                    // Display error message
            %>
                    <font size="+3" color="red">
                        Unable to insert data: <%= e.getMessage() %>
                    </font>
            <% 
                } finally {
                    // Close resources
                    try { if (ps != null) ps.close(); } catch (SQLException e) { }
                    try { if (con != null) con.close(); } catch (SQLException e) { }
                }
            %>
        </div>
    </div>
</body>
</html>
