package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.OrderDao;
import com.model.Order;


/**
 * Servlet implementation class EditOrderServlet
 */
@WebServlet("/EditOrderServlet")
public class EditOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 if(request.getParameter("update_final") != null) 
		 {
			 PrintWriter out = response.getWriter();
	            response.setContentType("text/html;charset=UTF-8");

	            Order a = (Order)request.getSession().getAttribute("toBeUpdated");
	            int idToUpdate = (int)request.getSession().getAttribute("idToUp");

	            String quantity=request.getParameter("quantity");
	            String dish=request.getParameter("dish");
	            String specifications=request.getParameter("specifications");
	            String fidelitycarddiscount=request.getParameter("fidelitycarddiscount");
	            
	            Order newOrder = new Order(idToUpdate, Integer.parseInt(quantity), dish, specifications, fidelitycarddiscount);
	            OrderDao oDao = new OrderDao(new Configuration().configure().buildSessionFactory());
	            oDao.updateOrder(oDao.findOrder(idToUpdate), newOrder);

	            request.getRequestDispatcher("Table.jsp").forward(request, response);
	            //response.sendRedirect("Table.jsp");	
	           
		 }
	}

}
