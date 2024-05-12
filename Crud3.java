package programm;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;
public class Crud3 {

	public static void main(String[] args) throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
	       String url = "jdbc:mysql://localhost:3306/mypc";
	       String username = "root";
	       String password = "123456";
	       Connection con = DriverManager.getConnection(url,username,password);
	       Statement stmt = con.createStatement();
	       ResultSet rs  ;
	       PreparedStatement st;
	       
	       String qry = "";
	       int course_id;
	       String course_name;
	       int course_fees;
	       String course_duration;
	       String course_details;
	       int choice;
	       
	       Scanner sc = new Scanner(System.in);
	       Scanner str = new Scanner(System.in);
	       
	       while(true) {
	    	   System.out.println("Welcome To Course Management System");
	    	   System.out.println("1.Add course");
	    	   System.out.println("2.view course");
	    	   System.out.println("3.Search Course |");
	    	   System.out.println("4.Edit Course");
	    	   System.out.println("5.Delete Course");
	    	   System.out.println("6.Exit");
	    	   System.out.println("enter your choice:");
	    	   choice = sc.nextInt();
	    	   switch(choice) {
	    	   case 1:
	    		   System.out.println("Insert new Data");
	    		   System.out.println("Enter course name:");
	    		   course_name=str.nextLine();
	    		   System.out.println("Enter course fees:");
	    		   course_fees=sc.nextInt();
	    		   System.out.println("Enter course duration:");
	    		   course_duration=str.nextLine();
	    		   System.out.println("Enter course details:");
	    		   course_details=str.nextLine();
	    		   qry = "insert into student (course_name,course_fees,course_duration,course_details)values(?,?,?,?)";
	    		   st=con.prepareStatement(qry);
	    		   st.setString(1, course_name);
	    		   st.setInt(2, course_fees);
	    		   st.setString(3,course_duration);
	    		   st.setString(4, course_details);
	                  
	    		   st.executeUpdate();
	    		   System.out.println("data inserted succesfully");
	    		   break;
	    		   
	    	   case 2:
	    		   
	    		   System.out.println("2 View course");
	    		   qry="select course_id,course_name,course_fees,course_duration,course_details from student";
	    		   
	    		   rs=stmt.executeQuery(qry);
	    		   while(rs.next()) {
	    			   course_id=rs.getInt("course_id");
	    			   course_name=rs.getString("course_name");
	    			   course_fees=rs.getInt("course_fees");
	    			   course_duration=rs.getString("course_duration");
	    			   course_details=rs.getString("course_details");
	    			   
	    			   System.out.println("course_id:-"+" "+course_id);
	    			   System.out.println("course_name:-"+" "+course_name);
	    			   System.out.println("course_fees:-"+" "+course_fees);
	    			   System.out.println("course_duration:-"+" "+course_duration);
	    			   System.out.println("course_details:-"+" "+course_details);
	    			   System.out.println("Data fetch Successfully");	
	    			   
	    	   }
	    	  case 3:
	    		  
	    		   System.out.println("3 search course");
	    		   qry="select * from company where id = ?";
	    		   System.out.println("Enter course id:");
	    		   course_id=sc.nextInt();
	    		   st.setInt(1, 1);
	    		   if(rs.next()) {
	    			   System.out.println("course_id: " + rs.getInt("id"));
	    		   }
	    		   else 
	    		   {
	                  System.out.println("No deatils found for id"+course_id);
	               }
	    		   
	    	         
	      }
//	       
	               
	    	  case 4:
	    		  
	    		  
	    		   System.out.println("Edit course ");
	    		   System.out.println("Enter course id:");
	    		   course_id=sc.nextInt();
	    		   System.out.println("Enter course_name:");
	    		   course_name=str.nextLine();
	    		   System.out.println("Enter course_fees:");
	    		   course_fees=sc.nextInt();
	    		   System.out.println("Enter course_duration:");
	    		   course_duration=str.nextLine();
	    		   System.out.println("Enter course_details:");
	    		   course_details=str.nextLine();
	    		   
	    		   qry = "update student set course_name=?,course_fees=?,course_duration=?,course_details=? where course_id=?";
	    		   st=con.prepareStatement(qry);
	    	
	    		   st.setString(1, course_name);
	    		   st.setInt(2, course_fees);
	    		   st.setString(3,course_duration);
	    		   st.setString(4, course_details);
	    		   st.setInt(5,course_id);
	    		   st.executeUpdate();
	    		   System.out.println("Data Updated Success");
	    	       break;
	    	       
	    	  case 5:
	    		   System.out.println("delete course ");
	    		   System.out.println("Enter course id:");
	    		   course_id=sc.nextInt();
	    		   
	    		   qry = "delete from student where course_id=?";
	    		   st=con.prepareStatement(qry);
	    		   
	    		   st.setInt(1,course_id);
	    		   st.executeUpdate();
	    		   System.out.println("Data deleted Successfully");
	    	       break;
	    	       
//	         
              }
	       }	 
	}
}
