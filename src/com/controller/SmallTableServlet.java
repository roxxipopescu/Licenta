package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.OrderDao;
import com.dao.UserDao;
import com.model.Order;

/**
 * Servlet implementation class SmallTableServlet
 */
@WebServlet("/SmallTableServlet")
public class SmallTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if (request.getParameter("add_order")!=null)
		 {
			 PrintWriter out = response.getWriter();

	            String quantity=request.getParameter("quantity");
	            String dish=request.getParameter("dish");
	            String specifications=request.getParameter("specifications");
	            String fidelitycarddiscount=request.getParameter("fidelitycarddiscount");
	            	     	           	            
	            Order newOrder = new Order( Integer.parseInt(quantity), dish, specifications, fidelitycarddiscount);
	            OrderDao oDao = new OrderDao(new Configuration().configure().buildSessionFactory());
	            oDao.addOrder(newOrder);

	            response.sendRedirect("Table.jsp"); 
		 }
		 else  if (request.getParameter("delete_order")!=null)
		 {
			 	String idToDelete =request.getParameter("id");
	            OrderDao oDao = new OrderDao(new Configuration().configure().buildSessionFactory());
	            oDao.removeOrder(Integer.parseInt(idToDelete));
	            PrintWriter out = response.getWriter();
	            
	            response.sendRedirect("Table.jsp");			 
		 }
		 else  if (request.getParameter("update_order")!=null)
		 {
			 String idToUpdate = request.getParameter("id");
	            OrderDao oDao = new OrderDao(new Configuration().configure().buildSessionFactory());

	            Order a = oDao.findOrder(Integer.parseInt(idToUpdate));

	            request.getSession().setAttribute("idToUp", Integer.parseInt(idToUpdate));
	            request.getSession().setAttribute("toBeUpdated", a);
	            request.getRequestDispatcher("EditOrder.jsp").forward(request,response);
			 
		 }
		 
		 
		 
		
	}

}
