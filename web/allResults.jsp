<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: zawad1879
  Date: 4/22/17
  Time: 11:06 PM
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


    <title>Show all entries</title>
</head>
<body>
<%
    ResultSet students_resultSet =(ResultSet) request.getAttribute("student_records");
    ResultSet subjects_resultSet =(ResultSet) request.getAttribute("subject_records");
    ResultSet teachers_resultSet =(ResultSet) request.getAttribute("teacher_records");

    String student_name = "";
    int student_id = 0;
    String teacher_name = "";
    int teacher_id = 0;
    String subject_name = "";
    int subject_id = 0;
%>

    <div class="container">
        <div class="row">


            <div class="col-md-4">
                <h2>Students Table</h2>
                <table class="table table-bordered">


                    <thead>
                    <tr>
                        <th>Student name</th>
                        <th>Student id</th>
                    </tr>
                    </thead>


                    <tbody>


                    <%
                    while (students_resultSet.next()) {
                        student_name = students_resultSet.getString("student_name");
                        student_id = students_resultSet.getInt("student_id"); %>
                    <tr>
                        <td><% out.print(student_name); %></td>
                        <td><% out.print(student_id); %></td>
                    </tr>
                    <%
                    }
                    %>

                    </tbody>
                </table>
            </div>


            <div class="col-md-4">
                <h2>Teachers Table</h2>
                <table class="table table-bordered">


                    <thead>
                    <tr>
                        <th>Teacher name</th>
                        <th>Teacher id</th>
                    </tr>
                    </thead>


                    <tbody>


                    <%
                        while (teachers_resultSet.next()) {
                            teacher_name = teachers_resultSet.getString("teacher_name");
                            teacher_id = teachers_resultSet.getInt("teacher_id"); %>
                    <tr>
                        <td><% out.print(teacher_name); %></td>
                        <td><% out.print(teacher_id); %></td>
                    </tr>
                    <%
                        }
                    %>

                    </tbody>
                </table>
            </div>


            <div class="col-md-4">
                <h2>Subjects Table</h2>
                <table class="table table-bordered">


                    <thead>
                    <tr>
                        <th>Subject name</th>
                        <th>Subject id</th>
                    </tr>
                    </thead>


                    <tbody>


                    <%
                        while (subjects_resultSet.next()) {
                            subject_name = subjects_resultSet.getString("subject_name");
                            subject_id = subjects_resultSet.getInt("subject_id"); %>
                    <tr>
                        <td><% out.print(subject_name); %></td>
                        <td><% out.print(subject_id); %></td>
                    </tr>
                    <%
                        }
                    %>

                    </tbody>
                </table>
            </div>

        </div>


    </div>

</body>
</html>
