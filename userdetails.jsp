<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <link rel="stylesheet" href="./main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
        </div>

        <center>
            <table>
                <tr>
                    <td rowspan=7 height="420" width="1000">
                        <h1>Your Info</h1>
                        <hr>
                        <center>
                            <form id="employeeForm" >
                                <table height="420" width="1000">
                                    <tr>
                                        <td>
                                            Employee Name:
                                        </td>
                                        <td>
                                            <input type="text" id="employeeName" disabled>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Employee ID:
                                        </td>
                                        <td>
                                            <input type="text" id="employeeID" disabled>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Recovery Email Address:
                                        </td>
                                        <td>
                                            <input type="email" id="recoveryEmail" disabled>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <center>
                                                
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </center>
                    </td>
                </tr>
            </table>
        </center>
    </div>

    <%-- Import necessary Java classes for database interaction --%>
    <%@ page import="java.sql.*, java.io.*, java.util.*" %>
    <%-- Establish database connection and retrieve employee data --%>
    <%
        // Declare variables to store employee data
        String employeeID = "";
        String employeeName = "";
        String recoveryEmail = "";

        // Database connection parameters
        String URL = "jdbc:mysql://localhost:3306/internship";
        String username = "root";
        String password = "";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, username, password);

            // SQL query to retrieve employee data
            String sql = "SELECT emp_id, emp_name, email FROM emp WHERE email = ?";

            // Create PreparedStatement and set parameters
            ps = con.prepareStatement(sql);
            // Set the employee email parameter here (replace 'user@example.com' with the actual email)
            ps.setString(1, "sahana@gmail.com");

            // Execute the query
            rs = ps.executeQuery();

            // Retrieve employee data if available
            if (rs.next()) {
                employeeID = rs.getString("emp_id");
                employeeName = rs.getString("emp_name");
                recoveryEmail = rs.getString("email");
            }
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <%-- Populate the form fields with retrieved employee data --%>
    <script>
        $(document).ready(function() {
            $('#employeeID').val('<%= employeeID %>');
            $('#employeeName').val('<%= employeeName %>');
            $('#recoveryEmail').val('<%= recoveryEmail %>');
        });
    </script>

</body>
</html>
