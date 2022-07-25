package com.learn.mycart.dao;

import com.learn.mycart.connection.DBConnection;
import com.learn.mycart.entities.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CategoryDao {

	private Connection connection;

    public CategoryDao(Connection connection) {
        this.connection= connection;
    }

    //saves the category to db
    public int saveCategory(Category cat) {

        String query=" INSERT INTO public.\"Category\"(\r\n" + 
        		"	 category_name, category_desc)\r\n" + 
        		"	VALUES ('"+cat.getCategoryTitle()+"', '"+cat.getCategoryDescription()+"')";
        
        int add= DBConnection.insertUpdateFromSqlQuery(query);
        
        DBConnection.CloseConnection(); 
        
        return add;
    }

    public static List<Category> getCategories() {
    	
    	String query="SELECT category_id, category_name, category_desc\r\n" + 
    			"	FROM public.\"Category\";";
    	
    	ResultSet rs = DBConnection.getResultFromSqlQuery(query);
    	
    	List<Category> list = new ArrayList<>();
    	
        try {
			while (rs.next()) {
			   
			  int id = rs.getInt("category_id");
			  String name = rs.getString("category_name");
			  String desc=  rs.getString("category_desc");
			   
			  
			  Category cat= new Category(id, name, desc);
			  list.add(cat);
			 
			}
			 DBConnection.CloseConnection(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        return list;
    }

    public Category getCategoryById(int cid) {
        Category cat = null;
        ResultSet resultSet;
        try {
        	
        	
        	String query="select * from public.\"Category\" where category_id='" + cid + "';";
        	
        	 resultSet = DBConnection.getResultFromSqlQuery(query);
        	 
        	 if (resultSet.next()) {
        		 
        		 int id = resultSet.getInt("category_id");
        		 String name = resultSet.getString("category_name");
        		 String desc=  resultSet.getString("category_desc");
   			   
   			  
        		 cat= new Category(id, name, desc);
        		 
        	 }

        	 DBConnection.CloseConnection(); 

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cat;
    }
}
