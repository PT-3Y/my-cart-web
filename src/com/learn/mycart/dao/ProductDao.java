package com.learn.mycart.dao;

import com.learn.mycart.connection.DBConnection;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.entities.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductDao {

    private Connection connection;

    public ProductDao( Connection connection) {
        this.connection = connection;
    }

    public static boolean saveProduct(Product product) {
        boolean f = false;
        
        String p_name=product.getpName();
        String p_desc=product.getpDesc();
        String p_pic=product.getpPhoto();
        int p_price=product.getpPrice();
        int p_dis=product.getpDiscount();
        int p_quan=product.getpQuantity();
        Category p_cat=product.getCategory();
        
        try {

        	 String query="INSERT INTO public.\"Product\"( product_name, product_desc, product_pic, product_price, product_discount, product_quantity, category_id)\r\n" + 
        	 		"    	VALUES ('"+p_name+"', '"+p_desc+"', '"+p_pic+"', '"+p_price+"', '"+p_dis+"', '"+p_quan+"', '"+p_cat.getCategoryId()+"');";
             
             int add= DBConnection.insertUpdateFromSqlQuery(query);
             
             DBConnection.CloseConnection(); 
           
             f = true;
             

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }

    
    public Product getProductById(int pid) {
    	Product pro = null;
        ResultSet rs;
        try {
        	
        	
        	String query="select * from public.\"Product\" where product_id='" + pid + "';";
        	
        	 rs = DBConnection.getResultFromSqlQuery(query);
        	 
        	 if (rs.next()) {
        		 
        		
       			  int id = rs.getInt("product_id");
       			  String name = rs.getString("product_name");
       			  String desc=  rs.getString("product_desc");
       			  String pic=  rs.getString("product_pic");
       			  int price= rs.getInt("product_price");
       			  int dis= rs.getInt("product_discount");
       			  int quan= rs.getInt("product_quantity");
       			  int cat_id=rs.getInt("category_id");
       			  
       			  CategoryDao cdoa = new CategoryDao(DBConnection.getConnection());
                   Category category = cdoa.getCategoryById(cat_id);
       			   
       			  
       			   pro= new Product(id, name, desc, pic, price, dis, quan, category);
        		 
        	 }

           
        	 DBConnection.CloseConnection(); 
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pro;
    }
    //get all products
    public List<Product> getAllProducts() {
    	
    	String query="SELECT product_id, product_name, product_desc, product_pic, product_price, product_discount, product_quantity, category_id\r\n" + 
    			"	FROM public.\"Product\";";
    	
    	ResultSet rs = DBConnection.getResultFromSqlQuery(query);
    	
    	List<Product> list = new ArrayList<>();
    	
        try {
			while (rs.next()) {
			   
			  int id = rs.getInt("product_id");
			  String name = rs.getString("product_name");
			  String desc=  rs.getString("product_desc");
			  String pic=  rs.getString("product_pic");
			  int price= rs.getInt("product_price");
			  int dis= rs.getInt("product_discount");
			  int quan= rs.getInt("product_quantity");
			  int cat_id=rs.getInt("category_id");
			  
			  
			  CategoryDao cdoa = new CategoryDao(DBConnection.getConnection());
              Category category = cdoa.getCategoryById(cat_id);
			   
			  
			  Product pro= new Product(id, name, desc, pic, price, dis, quan, category);
			  list.add(pro);
			 
			}
			
			 DBConnection.CloseConnection(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        return list;
    }

    //get all  products of given category
    public List<Product> getAllProductsById(int cid) {
    	
    	String query="SELECT product_id, product_name, product_desc, product_pic, product_price, product_discount, product_quantity, category_id\r\n" + 
    			"	FROM public.\"Product\" where category_id='" + cid + "';";
    	
    	ResultSet rs = DBConnection.getResultFromSqlQuery(query);
    	
    	List<Product> list = new ArrayList<>();
    	
        try {
			while (rs.next()) {
			   
			  int id = rs.getInt("product_id");
			  String name = rs.getString("product_name");
			  String desc=  rs.getString("product_desc");
			  String pic=  rs.getString("product_pic");
			  int price= rs.getInt("product_price");
			  int dis= rs.getInt("product_discount");
			  int quan= rs.getInt("product_quantity");
			  int cat_id=rs.getInt("category_id");
			  
			  
			  CategoryDao cdoa = new CategoryDao(DBConnection.getConnection());
              Category category = cdoa.getCategoryById(cat_id);
			   
			  
			  Product pro= new Product(id, name, desc, pic, price, dis, quan, category);
			  list.add(pro);
			 
			}
			 DBConnection.CloseConnection(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        return list;
        
        
        
        
    }
    
    
    public int updateProduct(Product pro, int id) throws Exception {
		int rowUpdated =1;
		try {
			rowUpdated=DBConnection.insertUpdateFromSqlQuery("update public.\"Product\" set product_name='"+pro.getpName()+"', product_desc='"+pro.getpDesc()+"', product_pic='"+pro.getpPhoto()+"',  product_price='"+pro.getpPrice()+"',  product_discount='"+pro.getpDiscount()+"', product_quantity='"+pro.getpQuantity()+"', category_id='"+pro.getCategory().getCategoryId()+"' where product_id='" +id+"';");
			
			 DBConnection.CloseConnection(); 
		}catch(Exception e) {
			rowUpdated=-1;
			 e.printStackTrace();
		}
		return rowUpdated;
	}
    

}
