<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: zawad1879
  Date: 4/24/17
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>Add subject</title>
</head>
<body>

<%
    Connection dbConnection = null;
    final String DB_DRIVER = "com.mysql.jdbc.Driver";
    final String DB_CONNECTION = "jdbc:mysql://localhost:3306/testdb";
    final String DB_USER = "root";
    final String DB_PASSWORD = "zawad";



    try {

        Class.forName(DB_DRIVER);

    } catch (ClassNotFoundException e) {

        System.out.println(e.getMessage());

    }

    try {

        dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
                DB_PASSWORD);

    } catch (SQLException e) {

        System.out.println(e.getMessage());

    }


%>

<%
    Statement local_statement = dbConnection.createStatement();
    ResultSet rs = null;
    rs = local_statement.executeQuery("SELECT * FROM students");

%>
<div class="container">
    <div class = "row">
        <h1>Add Subject</h1>
    </div>
    <form method="post" action="basicInfo.do">
        <input type="hidden" name="type" value="subject" />
        <div class="form-group row">
            <label for="subject_name_text_input" class="col-2 col-form-label">Subject name</label>
            <div class="col-10">
                <input class="form-control" type="text" placeholder="Enter subject name" id="subject_name_text_input" name="subject_name">
            </div>
        </div>
        <div class="form-group row">
            <label for="subject_id_text_input" class="col-2 col-form-label">Subject id</label>
            <div class="col-10">
                <input class="form-control" type="text" placeholder="Enter subject id" id="subject_id_text_input" name="subject_id">
            </div>
        </div>
        <div class="form-group row">
            <label for="student_select" class="col-2 col-form-label">Select student</label>
            <div class="col-10">
                <select id="student_select" name="subject_assigned_student_id">
                    <%
                        while(rs.next()){
                            String student_name = rs.getString("student_name");
                            int student_id = rs.getInt("student_id");
                    %>
                    <option value=<% out.print(student_id); %>><% out.print(student_name); %></option>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="row">
            <input type="submit" value="Submit">
        </div>

    </form>
</div>




</body>
</html>
