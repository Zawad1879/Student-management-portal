package com.StudentManagementPortal.model;


import java.sql.*;

/**
 * Created by zawad1879 on 4/20/17.
 */
public class databaseOperations {

    protected Connection database_connection;
    protected final String DB_DRIVER = "com.mysql.jdbc.Driver";
    protected final String DB_CONNECTION = "jdbc:mysql://localhost:3306/testdb";
    protected final String DB_USER = "root";
    protected final String DB_PASSWORD = "zawad";
    PreparedStatement prepared_statement;
    ResultSet rs;

    Statement local_statement;

    public databaseOperations(){
        database_connection = getDBConnection();

    }

    public Connection getDBConnection() {

        Connection dbConnection = null;

        try {

            Class.forName(DB_DRIVER);

        } catch (ClassNotFoundException e) {

            System.out.println(e.getMessage());

        }

        try {

            dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
                    DB_PASSWORD);
            return dbConnection;

        } catch (SQLException e) {

            System.out.println(e.getMessage());

        }

        return dbConnection;

    }

    public ResultSet retrieveAllRecords(String table_name) throws SQLException {
        local_statement = database_connection.createStatement();
        rs = local_statement.executeQuery("SELECT * FROM "+table_name);
        return rs;
    }

    public String getColumnName(int i, String table_name) throws SQLException {
        local_statement = database_connection.createStatement();
        rs = local_statement.executeQuery("SELECT * FROM "+table_name);
        ResultSetMetaData rsmd = rs.getMetaData();
        return rsmd.getColumnName(i);
    }

    public int getColumnType(int i, String table_name) throws SQLException {
        local_statement = database_connection.createStatement();
        rs = local_statement.executeQuery("SELECT * FROM "+table_name);
        ResultSetMetaData rsmd = rs.getMetaData();
        return rsmd.getColumnType(i);
    }
}
