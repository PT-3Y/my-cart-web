package com.learn.mycart.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	
	private static String jdbcURL = "jdbc:postgresql://ec2-54-87-179-4.compute-1.amazonaws.com:5432/dcph43k58tad92";
	private static String jdbcUsername = "arekldsxxqmrnx";
	private static String jdbcPassword = "bbe884bbd652b5abdce403de03ada7f4f8dc2c301707fdaf109f9a9dbd56ae88";

    //Creating Connection
    public static Connection connection;

    public static Connection getConnection() {

        try {

        	Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			System.out.println("DB CONNECTED.....");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (connection);
    }

    //Creating universal method to close connect will mysql database
    public static void CloseConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    //Creating universal method to query for retriving information
    public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
  
        ResultSet rs = null;
        try {
           
            if (connection == null) {
                getConnection();
            }
           
            rs = connection.createStatement().executeQuery(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    //Creating universal method to query for inserting or updating information in mysql database
    public static int insertUpdateFromSqlQuery(String SqlQueryString) {
        int i = 2;
        try {
           
            if (connection == null) {
                getConnection();
            }
          
            i = connection.createStatement().executeUpdate(SqlQueryString);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return i;
    }
	
	
	
}
