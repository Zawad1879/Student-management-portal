package com.StudentManagementPortal.model;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Created by zawad1879 on 4/22/17.
 */
public class retrieveAllRecordsFromDatabase extends databaseOperations {

    private String table_name;

    public retrieveAllRecordsFromDatabase(){
        super();
    }

    public ResultSet retrieve(String table_name) throws SQLException {
        return retrieveAllRecords(table_name);
    }
}
