package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.UserDao;
import com.model.User;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if (request.getParameter("update_final")!=null)
		 {
			  PrintWriter out = response.getWriter();	            

	           User b = (User)request.getSession().getAttribute("toBeUpdated");
	           int idToUpdate = (int)request.getSession().getAttribute("idToUp");

	            String name=request.getParameter("name");
	            String surname=request.getParameter("surname");
	            String role=request.getParameter("role");
	            String birthdate=request.getParameter("birthdate");
	            String username=request.getParameter("username");
	            String password=request.getParameter("password");
	            String telephone=request.getParameter("telephone");
	            String contractnb=request.getParameter("contractnb");	  
	            
	            User newUser = new User( name, surname, username, password, role, birthdate, telephone, contractnb);
	            UserDao uDao2 = new UserDao(new Configuration().configure().buildSessionFactory());
	            uDao2.updateUser(uDao2.findUser(idToUpdate), newUser);

	           // response.sendRedirect("Admin.jsp");	
		 }
	}

}
