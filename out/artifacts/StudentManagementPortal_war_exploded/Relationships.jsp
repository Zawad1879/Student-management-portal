<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: zawad1879
  Date: 4/23/17
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>Relationships</title>
</head>
<body>

    <div class="container">
        <%
            Statement local_statement = dbConnection.createStatement();
            ResultSet rs = null;
            rs = local_statement.executeQuery("SELECT students.student_name\n" +
                    "    , students.student_id\n" +
                    "    , teachers.teacher_name\n" +
                    "    , teachers.teacher_id\n" +
                    "    , subjects.subject_name\n"+
                    "    , subjects.subject_id\n"+
                    "FROM ((students INNER JOIN teachers " +
                    "ON students.student_assigned_teacher = teachers.teacher_id) " +
                    "INNER JOIN subjects " +
                    "ON teachers.teacher_assigned_subject = subjects.subject_id)");


//            try {
//                rs = local_statement.executeQuery("SELECT students.student_name,teachers.teacher_name FROM students INNER JOIN teachers ON " +
//                        "students.student_assigned_teacher = teachers.teacher_id");
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }

            %>

        <h2>Relationships Table</h2>
        <table class="table table-bordered">


            <thead>
            <tr>
                <th>Student name</th>
                <th>Teacher name</th>
                <th>Subject name</th>
            </tr>
            </thead>
            <tbody>
            <%
                while(rs.next()){
                    String student_name = rs.getString("student_name");
                    String teacher_name = rs.getString("teacher_name");
                    String subject_name = rs.getString("subject_name");
            %>

                <tr>
                    <td><% out.print(student_name); %></td>
                    <td><% out.print(teacher_name); %></td>
                    <td><% out.print(subject_name); %></td>
                </tr>
            <%
                }
            %>

            </tbody>

    </div>

</body>

</html>


