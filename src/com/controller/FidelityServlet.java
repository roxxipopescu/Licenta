package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FidelityServlet
 */
@WebServlet("/FidelityServlet")
public class FidelityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 if (request.getParameter("view_fclient")!=null)
		 {
			 request.getRequestDispatcher("ViewHistory.jsp").forward(request,response);
		 }
		 else  if (request.getParameter("update_fclient")!=null)
		 {
			 
		 }
		 else  if (request.getParameter("delete_fclient")!=null)
		 {
			 
		 }
		 response.sendRedirect("FidelityCardOwners.jsp"); 
	}
	
}


