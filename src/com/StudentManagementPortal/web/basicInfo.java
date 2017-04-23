package com.StudentManagementPortal.web;
import com.StudentManagementPortal.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by zawad1879 on 4/19/17.
 */
@WebServlet(name = "basicInfo")
public class basicInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                            throws ServletException, IOException {
        String table_name_singular = request.getParameter("type");
        response.setContentType("text/Html");
        PrintWriter out = response.getWriter();
        out.println("Advice<br>");
        ArrayList <String> temp = new ArrayList<>();
        temp.add(request.getParameter(table_name_singular+"_name"));
        temp.add(request.getParameter(table_name_singular+"_id"));
        insertIntoDatabase insertion = new insertIntoDatabase(table_name_singular+"s",temp);
        retrieveAllRecordsFromDatabase retrieval = new retrieveAllRecordsFromDatabase();
        ResultSet students_resultSet = null;
        ResultSet subjects_resultSet = null;
        ResultSet teachers_resultSet = null;
        try {
            insertion.insert();


        } catch (SQLException e) {
            out.println("Insertion failed");
            e.printStackTrace();
        }
        try {
            students_resultSet = retrieval.retrieve("students");
            subjects_resultSet = retrieval.retrieve("subjects");
            teachers_resultSet = retrieval.retrieve("teachers");
        } catch (SQLException e) {
            out.println("Retrieval failed");
            e.printStackTrace();
        }
        request.setAttribute("student_records",students_resultSet);
        request.setAttribute("subject_records",subjects_resultSet);
        request.setAttribute("teacher_records",teachers_resultSet);
        RequestDispatcher view = request.getRequestDispatcher("allResults.jsp");
        view.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
