package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;
import com.model.User;
import com.dao.UserDao;

/**
 * Servlet implementation class EmployerServlet
 */
@WebServlet("/EmployerServlet")
public class EmployerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 if (request.getParameter("view_salary")!=null)
		 {
			 request.getRequestDispatcher("ViewIncomeHistory.jsp").forward(request,response);
		 }
		 else  if (request.getParameter("update_employer")!=null)
		 {
			 
		 }
		 else  if (request.getParameter("add_employer")!=null)
		 {
			 	PrintWriter out = response.getWriter();

	            String name=request.getParameter("name");
	            String surname=request.getParameter("surname");
	            String role=request.getParameter("role");
	            String birthdate=request.getParameter("birthdate");
	            String username=request.getParameter("username");
	            String password=request.getParameter("password");
	            String telephone=request.getParameter("telephone");
	            String contractnb=request.getParameter("contractnb");	     
	           	            
	            User newUser = new User( name, surname, username, password, role, birthdate, telephone, contractnb);
	            UserDao uDao = new UserDao(new Configuration().configure().buildSessionFactory());
	            uDao.addUser(newUser);

	            response.sendRedirect("Admin.jsp"); 
		 }
		 else  if (request.getParameter("delete_employer")!=null)
		 {
			  String idToDelete =request.getParameter("id");
	            UserDao uDao = new UserDao(new Configuration().configure().buildSessionFactory());
	            uDao.removeUser(Integer.parseInt(idToDelete));
	            PrintWriter out = response.getWriter();
	            response.sendRedirect("Admin.jsp");
		 }
		 
	}

}