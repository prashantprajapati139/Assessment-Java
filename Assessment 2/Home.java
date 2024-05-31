package com.assignment;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		String Id=req.getParameter("Id");
		String productName=req.getParameter("productName");
		String productCategory=req.getParameter("productCategory");
		String productModel=req.getParameter("productModel");	
		String price=req.getParameter("price");
		String productDescription=req.getParameter("productDescription");
		String productImage=req.getParameter("productImage");
       
		
		Part file = req.getPart("productImage");
		String imagefilename=file.getSubmittedFileName();
		String uploadpath="C:\\Users\\prash\\eclipse-workspace\\webproject\\build\\image"+imagefilename;
	
		FileOutputStream fos=new FileOutputStream(uploadpath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();

		try {
			String url = "jdbc:mysql://localhost:3306/EPM"; 
			String username = "root"; 
			String password = "123456"; 
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

		    PreparedStatement pt = con.prepareStatement("insert into products (id,Name, category, Model, price, Description, image) values (?,?, ?, ?, ?, ?, ?)");

		    pt.setString(1, Id);
		    pt.setString(2, productName);
		    pt.setString(3, productCategory);
		    pt.setString(4, productModel);
		    pt.setString(5, price);
		    pt.setString(6, productDescription);
            pt.setString(7, productImage);

		    int count = pt.executeUpdate();

		
		

		    if(count > 0) {
		        resp.setContentType("text/html");
		       
		        RequestDispatcher rd=req.getRequestDispatcher("/ViewProduct.jsp");
		        rd.include(req, resp);
		    } else {
		        resp.setContentType("text/html");
		        out.print("<h2> Add Product not Successfully </h2>");
		        RequestDispatcher rd=req.getRequestDispatcher("/AddProduct.jsp");
		        rd.include(req, resp);
		    }
		} catch (Exception e) {
		    e.printStackTrace(); 
		    resp.setContentType("text/html");
		    out.print("<h2> Exception occurred: " + e.getMessage() + "</h2>");
		    RequestDispatcher rd=req.getRequestDispatcher("/Registration.html");
		    rd.include(req, resp);
		}

		
		
	}

}