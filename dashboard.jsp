<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
     <link rel="stylesheet" href="./main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">
    <!-- <script>
        $(document).ready(function() {
            $(".hamburger").click(function() {
                $(".wrapper").toggleClass("collapse");
            });
        });
    </script> -->
    <!-- Add your CSS links here -->
     <style>
        .task-box {
            background-color: #f4f4f4;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .task-box h4 {
            margin-top: 0;
            color: #333;
        }
        .task-box p {
            margin: 5px 0;
            color: #666;
        }
        .task-box span {
            background-color: #333;
            color: #fff;
            padding: 3px 8px;
            border-radius: 3px;
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
                        <a href="#"><i class="fa fa-align-justify" aria-hidden="true"></i>&nbsp;&nbsp;
                            Backlog</a>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-desktop" aria-hidden="true"></i>
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

        <div class="main_container">
            <div class="card-containers">
                <!-- TO DO Section -->
                <div class="levels">
                    <span class="leveless">TO DO</span>
                    <div class="todo-item list-item" draggable="true">
                        <section>
                            <a href="dashboard.html">
                                <% 
                                    Connection conn = null;
                                    PreparedStatement pstmt = null;
                                    ResultSet rs = null;

                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship", "root", "");
                                        String query = "SELECT * FROM task WHERE status = 'incomplete'";
                                        pstmt = conn.prepareStatement(query);
                                        rs = pstmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                    <div class="task-box">
                                        <h4><%= rs.getString("description") %></h4>
                                        <p>Task ID: <%= rs.getString("task_id") %></p>
                                        <p>Project ID: <%= rs.getString("proj_id") %></p>
                                        <p>Start Date: <%= rs.getString("start_date") %></p>
                                        <p>End Date: <%= rs.getString("end_date") %></p>
                                        <span>Status: Incomplete</span>
                                    </div>
                                <% 
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) {
                                            try { rs.close(); } catch (SQLException e) { }
                                        }
                                        if (pstmt != null) {
                                            try { pstmt.close(); } catch (SQLException e) { }
                                        }
                                        if (conn != null) {
                                            try { conn.close(); } catch (SQLException e) { }
                                        }
                                    }
                                %>
                            </a>
                        </section>
                    </div>
                </div>
                
        
            
                <div class="levels">
                    <span class="leveless">Inprogress</span>
                    
                    <div class="todo-item">
                        <section>
                        <a href="dashboard.html">
                            <% 
                               

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship", "root", "");
                                    String query = "SELECT * FROM task WHERE status = 'inprogress'";
                                    pstmt = conn.prepareStatement(query);
                                    rs = pstmt.executeQuery();

                                    while (rs.next()) {
                                        %>
                                            <div class="task-box">
                                                <h4><%= rs.getString("description") %></h4>
                                                <p>Task ID: <%= rs.getString("task_id") %></p>
                                                <p>Project ID: <%= rs.getString("proj_id") %></p>
                                                <p>Start Date: <%= rs.getString("start_date") %></p>
                                                <p>End Date: <%= rs.getString("end_date") %></p>
                                                <span>Status: inprogress</span>
                                            </div>
                                        <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) {
                                        try { rs.close(); } catch (SQLException e) { }
                                    }
                                    if (pstmt != null) {
                                        try { pstmt.close(); } catch (SQLException e) { }
                                    }
                                    if (conn != null) {
                                        try { conn.close(); } catch (SQLException e) { }
                                    }
                                }
                            %>
                        </section>
                       
                    </div>
                </div>
                <div class="levels">
                    <span class="leveless">Code Review</span>
                    
                    <div class="todo-item">
                        <section>
                        <a href="dashboard.html">
                            <% 
                               

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship", "root", "");
                                    String query = "SELECT * FROM task WHERE status = 'Under Review'";
                                    pstmt = conn.prepareStatement(query);
                                    rs = pstmt.executeQuery();

                                    while (rs.next()) {
                                        %>
                                            <div class="task-box">
                                                <h4><%= rs.getString("description") %></h4>
                                                <p>Task ID: <%= rs.getString("task_id") %></p>
                                                <p>Project ID: <%= rs.getString("proj_id") %></p>
                                                <p>Start Date: <%= rs.getString("start_date") %></p>
                                                <p>End Date: <%= rs.getString("end_date") %></p>
                                                <span>Status: Under Review</span>
                                            </div>
                                        <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) {
                                        try { rs.close(); } catch (SQLException e) { }
                                    }
                                    if (pstmt != null) {
                                        try { pstmt.close(); } catch (SQLException e) { }
                                    }
                                    if (conn != null) {
                                        try { conn.close(); } catch (SQLException e) { }
                                    }
                                }
                            %>
                        </section>
                       
                    </div>
                </div>
                <div class="levels">
                    <span class="leveless">In Testing</span>
                    
                    <div class="todo-item">
                        <section>
                        
                            <% 
                               

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship", "root", "");
                                    String query = "SELECT * FROM task WHERE status = 'In Testing'";
                                    pstmt = conn.prepareStatement(query);
                                    rs = pstmt.executeQuery();

                                    while (rs.next()) {
                                        %>
                                            <div class="task-box">
                                                <h4><%= rs.getString("description") %></h4>
                                                <p>Task ID: <%= rs.getString("task_id") %></p>
                                                <p>Project ID: <%= rs.getString("proj_id") %></p>
                                                <p>Start Date: <%= rs.getString("start_date") %></p>
                                                <p>End Date: <%= rs.getString("end_date") %></p>
                                                <span>Status: In Testing</span>
                                            </div>
                                        <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) {
                                        try { rs.close(); } catch (SQLException e) { }
                                    }
                                    if (pstmt != null) {
                                        try { pstmt.close(); } catch (SQLException e) { }
                                    }
                                    if (conn != null) {
                                        try { conn.close(); } catch (SQLException e) { }
                                    }
                                }
                            %>
                        </section>
                       
                    </div>
                </div>
                <div class="levels">
                    <span class="leveless">Completed</span>
                    
                    <div class="todo-item">
                        <section>
                        <a href="dashboard.html">
                            <% 
                               

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship", "root", "");
                                    String query = "SELECT * FROM task WHERE status = 'Done'";
                                    pstmt = conn.prepareStatement(query);
                                    rs = pstmt.executeQuery();

                                    while (rs.next()) {
                                        %>
                                            <div class="task-box">
                                                <h4><%= rs.getString("description") %></h4>
                                                <p>Task ID: <%= rs.getString("task_id") %></p>
                                                <p>Project ID: <%= rs.getString("proj_id") %></p>
                                                <p>Start Date: <%= rs.getString("start_date") %></p>
                                                <p>End Date: <%= rs.getString("end_date") %></p>
                                                <span>Status: Done</span>
                                            </div>
                                        <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) {
                                        try { rs.close(); } catch (SQLException e) { }
                                    }
                                    if (pstmt != null) {
                                        try { pstmt.close(); } catch (SQLException e) { }
                                    }
                                    if (conn != null) {
                                        try { conn.close(); } catch (SQLException e) { }
                                    }
                                }
                            %>
                        </section>
                       
                    </div>
                </div>
                
                
                
                
                

                <!-- Repeat the above block for other sections (In-Progress, Code Review, In-Testing, Done) -->
            
    </div>

</body>

</html>
