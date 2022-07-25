
package com.learn.mycart.dao;
import com.learn.mycart.entities.User;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.User;
import com.learn.mycart.connection.DBConnection;

import java.awt.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.print.PrintException;


public class UserDao {
	
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //get user by email and password
    
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        
        try {
            
            ResultSet resultset = null;
            
            resultset = DBConnection.getResultFromSqlQuery("select * from public.\"User\" where user_email='" + email + "' and user_password='" + password + "'");
           
            if (email != null && password != null) {
                if (resultset.next()) {
                	int c_id=resultset.getInt("user_id");
                    String c_name=resultset.getString("user_name");
                    String c_email=resultset.getString("user_email");
                    String c_password=resultset.getString("user_password");
                    String c_phone=resultset.getString("user_phone");
                    String c_pic=resultset.getString("user_pic");
                    String c_address=resultset.getString("user_address");
                    String c_mode=resultset.getString("user_mode");
                   user= new User(c_id,c_name,c_email,c_password,c_phone,c_pic,c_address,c_mode);
                } 
            }
            
            DBConnection.CloseConnection(); 

        } catch (Exception e) {
            e.printStackTrace();
        }     
 
        return user;
    }
    
    public ArrayList<User> getAllUser() {
    	
    	String query="select * from public.\"User\";";
    	
    	ResultSet resultset = DBConnection.getResultFromSqlQuery(query);
    	
    	ArrayList<User> list = new ArrayList<>();
    	
        try {
			while (resultset.next()) {
			   
				int c_id=resultset.getInt("user_id");
                String c_name=resultset.getString("user_name");
                String c_email=resultset.getString("user_email");
                String c_password=resultset.getString("user_password");
                String c_phone=resultset.getString("user_phone");
                String c_pic=resultset.getString("user_pic");
                String c_address=resultset.getString("user_address");
                String c_mode=resultset.getString("user_mode");
              User user= new User(c_id,c_name,c_email,c_password,c_phone,c_pic,c_address,c_mode);
              
              list.add(user);
			 
			}
			
			 DBConnection.CloseConnection(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        return list;
    }
    
    
    
    public User getUserById(int id) {
		User user = null;
		try {
				
			ResultSet resultset = null;
            
			resultset = DBConnection.getResultFromSqlQuery("select * from public.\"User\" where user_id='" +id+"';"); 

			// Step 4: Process the ResultSet object.
			if (resultset.next()) {
				int c_id=resultset.getInt("user_id");
                String c_name=resultset.getString("user_name");
                String c_email=resultset.getString("user_email");
                String c_password=resultset.getString("user_password");
                String c_phone=resultset.getString("user_phone");
                String c_pic=resultset.getString("user_pic");
                String c_address=resultset.getString("user_address");
                String c_mode=resultset.getString("user_mode");
               user= new User(c_id,c_name,c_email,c_password,c_phone,c_pic,c_address,c_mode);
			}
			
			 DBConnection.CloseConnection(); 
		} catch (SQLException e) {
			 e.printStackTrace();
		}
		return user;
	}
    
    
    
    public User getUserByEmail(String email) {
		User user = null;
		try {
				
			ResultSet resultset = null;
            
			resultset = DBConnection.getResultFromSqlQuery("select * from public.\"User\" where user_email='" +email+"';"); 

			// Step 4: Process the ResultSet object.
			if (resultset.next()) {
				int c_id=resultset.getInt("user_id");
                String c_name=resultset.getString("user_name");
                String c_email=resultset.getString("user_email");
                String c_password=resultset.getString("user_password");
                String c_phone=resultset.getString("user_phone");
                String c_pic=resultset.getString("user_pic");
                String c_address=resultset.getString("user_address");
                String c_mode=resultset.getString("user_mode");
               user= new User(c_id,c_name,c_email,c_password,c_phone,c_pic,c_address,c_mode);
			}
			 DBConnection.CloseConnection(); 
		} catch (SQLException e) {
			 e.printStackTrace();
		}
		return user;
	}
    
    
    public int deleteUser(int id) throws Exception {
		int rowDeleted =1;
		try {
			rowDeleted=DBConnection.insertUpdateFromSqlQuery("delete from public.\"User\" where user_id='" +id+"';");
			 DBConnection.CloseConnection(); 
		}catch(Exception e) {
			rowDeleted=-1;
			 e.printStackTrace();
		}
		return rowDeleted;
	}
    
    
    public int updateUser(User user, int id) throws Exception {
		int rowUpdated =1;
		try {
			rowUpdated=DBConnection.insertUpdateFromSqlQuery("update public.\"User\" set user_name='"+user.getUserName()+"', user_email='"+user.getUserEmail()+"', user_phone='"+user.getUserPhone()+"',  user_address='"+user.getUserAddress()+"',  user_mode='"+user.getUserType()+"' where user_id='" +id+"';");
			 DBConnection.CloseConnection(); 
		}catch(Exception e) {
			rowUpdated=-1;
			 e.printStackTrace();
		}
		return rowUpdated;
	}
    
    
}
