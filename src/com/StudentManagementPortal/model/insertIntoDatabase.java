package com.StudentManagementPortal.model;

import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 * Created by zawad1879 on 4/19/17.
 */

public class insertIntoDatabase extends databaseOperations {
    String table_name;
    ArrayList <String> field_values;

    public insertIntoDatabase(String table_name, ArrayList <String> field_values){
        super();
        this.table_name = table_name;
        this.field_values = field_values;
    }

    public void insert() throws SQLException {
        prepared_statement = database_connection.prepareCall(prepareSqlStatement());
        for(int i = 1; i <= field_values.size(); i++){
            if (getColumnType(i,table_name) == Types.INTEGER){
                prepared_statement.setInt(i,Integer.parseInt(field_values.get(i-1)));
            }
            else{
                prepared_statement.setString(i,field_values.get(i-1));
            }
        }

        prepared_statement.execute();
    }

    public String prepareSqlStatement() throws SQLException {
        String statement = "INSERT INTO "+table_name+"(";
        int number_of_values = field_values.size();
       // ArrayList <String> column_names = new ArrayList<>();
        for(int i = 1; i <= number_of_values; i++){
            statement += getColumnName(i,table_name); //might take long time since everything selected in table each time query runs
            if(i == number_of_values){
                statement += ") ";
            }
            else {
                statement += ", ";
            }
        }
        statement +="VALUES(";
        for(int i = 1; i <= number_of_values; i++) {
            statement += "?";
            if(i == number_of_values){
                statement += ")";
            }
            else{
                statement += ", ";
            }
        }

        return statement;
    }

}
