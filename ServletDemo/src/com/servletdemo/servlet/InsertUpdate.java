package com.servletdemo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletdemo.dao.DataBaseConnection;
import com.servletdemo.pojo.Employee;

/**
 * Servlet implementation class InsertUpdate
 */
@WebServlet("/InsertUpdate")
public class InsertUpdate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Connection con =null;
		PreparedStatement pst =null;
		List<Employee> employee = new ArrayList<Employee>();

		String ids = request.getParameter("id");
		String type = request.getParameter("type");
		
		try {
			
			DataBaseConnection dbc = new DataBaseConnection();
			 con = dbc.getConnectionNew();
			
		}catch(Exception e) {
			
			String ee = e.toString();
	}
				
		if(type.equals("showdata")) {
			
			String qry = "select *from kathi order by id asc";
			 try {
				pst = con.prepareStatement(qry);
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					int salary = rs.getInt("salary");
					
					Employee emp = new Employee();
					emp.setId(id);
					emp.setName(name);
					emp.setSalary(salary);
					employee.add(emp);					
					
				}
				
				request.setAttribute("employee", employee);
				
				RequestDispatcher rd = request.getRequestDispatcher("Show-Data.jsp");
				rd.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(type.equals("delete")) {
			
			String deqry = "delete from kathi where id="+ids;
			
			try {
				pst = con.prepareStatement(deqry);
				
				 int nu = pst.executeUpdate();
				 
				 if(nu > 0) {
					 out.print("Row Deleted SuccessFully");
					 
				 }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(type.equals("signin")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String signqry = "select *from kathi where id="+username;
			try {
				pst = con.prepareStatement(signqry);
				
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()) {
					int user_name = rs.getInt("id");
					
					if(user_name == Integer.parseInt(username)) {
						
						Employee e = new Employee();
						e.setId(rs.getInt("id"));
						e.setName(rs.getString("name"));
				 		e.setSalary(rs.getInt("salary"));
						employee.add(e);
						
						request.setAttribute("employeelogin", employee);
						RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
						rd.forward(request, response);
					}
				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		try {
			pst.close();
			con.close();
		}catch(Exception e) {
			
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				PrintWriter out = response.getWriter();
				Connection con =null;
				PreparedStatement pst =null;
				

				try {
					
				DataBaseConnection dbc = new DataBaseConnection();
				 con = dbc.getConnectionNew();
				
			}catch(Exception e) {
				
				String ee = e.toString();
		}
				
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String salary = request.getParameter("salary");
		String type = request.getParameter("type");
		
		try {
		if(type.equals("insert")) {
			

			String inqry = "insert into kathi values("+id+",'"+name+"',"+salary+")";
		pst = con.prepareStatement(inqry);
		int nu = pst.executeUpdate();
			if(nu > 0) {
				out.print("Record Inserted Successfully");
			}
					
		}else if(type.equals("check")) {
			
			String checkqry = "select *from kathi where id="+id;
			
			pst = con.prepareStatement(checkqry);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				out.print("Data already available please choose another Id and Details are Id :"+rs.getInt("id")+", Name :"+rs.getString("name")+", Salary :"+rs.getInt("salary"));
			}
			rs.close();
		}else if(type.equals("update")) {
			String upqry = "update kathi set name='"+name+"',salary="+salary+" where id="+id;
		pst = con.prepareStatement(upqry);
		int ud = pst.executeUpdate();
		if(ud > 0) {
			out.print("Data Updated Successfully");
		}
		}
		}catch(Exception e) {
			String ee = e.toString();
		}

	}

}
