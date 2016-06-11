package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.OrderDao;
import com.model.Order;
import com.dao.IncomeDao;
import com.dao.MenuDao;
import com.model.Income;
import com.model.Menu;

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
	            String dish=request.getParameter("dishname");
	            String specifications=request.getParameter("specifications");
	            String fidelitycarddiscount=request.getParameter("fidelitycarddiscount");
	            
	            int currUserId=Integer.parseInt(request.getParameter("idUser"));
	            
	            	     	           	            
	            Order newOrder = new Order( Integer.parseInt(quantity), dish, specifications, fidelitycarddiscount, currUserId);
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
		 
		 else if (request.getParameter("close_order")!=null)
		 {
			 String currentDate = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());
			 			 
			 OrderDao orderDao = new OrderDao(new Configuration().configure().buildSessionFactory());
			 List<Order> myList = null;
			 myList = orderDao.findOrders();
			 Order a = myList.get(0);
			
			 MenuDao menuDao = new MenuDao(new Configuration().configure().buildSessionFactory());
			 List<Menu> menuList = null;
			 menuList = menuDao.findMenuItems();
			 Menu m = menuList.get(0);
			 
			 int orderTotalCost=0;
			 int price=0;
			 String orderedDishes="";
			 for (Order myorder : myList) {
				 if (myList.indexOf(myorder) == myList.size()-1){
					 orderedDishes = orderedDishes.concat(myorder.getDish()).concat(".");
				 }
				 else 
					 orderedDishes = orderedDishes.concat(myorder.getDish()).concat(", ");
			 }
			 
			 for (Menu mymenu : menuList) {
				 for (Order myorder : myList) {
					 if (myorder.getDish().equals(mymenu.getDish()))
					 {						 
						 price = mymenu.getDishPrice();
						 orderTotalCost+=price * myorder.getQuantity();
					 }
				 }					
			  }
						
			int currentUserId=Integer.parseInt(request.getParameter("idUser"));
		    Income newIncome = new Income( currentUserId, currentDate ,orderTotalCost, orderedDishes);
	        IncomeDao iDao = new IncomeDao(new Configuration().configure().buildSessionFactory());
	        iDao.addIncome(newIncome);
	          
	        
	        
	        response.sendRedirect("Table.jsp");			 
		 }
		 
		 else if (request.getParameter("place_order")!=null)
		 {
			 //SELFIE PULA
		 }
		 
		 
		
	}

}
