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
import com.dao.UserDao;
import com.model.Order;
import com.model.User;
import com.dao.ChefDao;
import com.dao.IncomeDao;
import com.dao.MenuDao;
import com.model.Chef;
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
			 
			 double orderTotalCost=0;
			 int price=0;
			 String fidelitycarddiscount;
			 double discount=0;
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
						 fidelitycarddiscount= myorder.getFidelityCardDiscount();
						 double fcd = (double) Integer.parseInt(fidelitycarddiscount);
						 discount =(double) fcd/100;
						 
						 if(discount!=0){
							double reducedPrice = price - price*discount; 
							orderTotalCost+= reducedPrice * myorder.getQuantity();
						 }
						 else{
						 orderTotalCost+=price * myorder.getQuantity();
						 }
					 }
				 }					
			  }
						
			int currentUserId=Integer.parseInt(request.getParameter("idUser"));
		    Income newIncome = new Income( currentUserId, currentDate ,orderTotalCost, orderedDishes);
	        IncomeDao iDao = new IncomeDao(new Configuration().configure().buildSessionFactory());
	        iDao.addIncome(newIncome);
	          
	        for (Order myorder : myList)
	        {
	        	OrderDao odao = new OrderDao(new Configuration().configure().buildSessionFactory());
	        	odao.removeOrder(myorder.getId());
	        }
	        
	        response.sendRedirect("Table.jsp");			 
		 }
		 
		 else if (request.getParameter("place_order")!=null)
		 {
			 OrderDao orderDao = new OrderDao(new Configuration().configure().buildSessionFactory());
			 List<Order> myList = null;
			 myList = orderDao.findOrders();
			 Order a = myList.get(0);
			 
			 UserDao userDao = new UserDao(new Configuration().configure().buildSessionFactory());
			  List<User> myuList = null;
			  myuList = userDao.findUsers();
			  User u = myuList.get(0);
			  
			  int tableId=1;
			  String currentTime = new SimpleDateFormat("HH:mm").format(new Date());
			  
			  if (!myList.isEmpty()) {
		            for (Order myorder : myList) {
		            	int wId = myorder.getWaiterId();      
		            	User myUser = userDao.findUser(wId);
		            	
		            	String uName = myUser.getFirstName();
		            	int qty = myorder.getQuantity();
		            	String dishName = myorder.getDish();
		            	
			
		            	Chef newchef= new Chef(tableId, uName, qty, dishName, currentTime);
		            	ChefDao chefDao = new ChefDao(new Configuration().configure().buildSessionFactory());
		            	chefDao.addChef(newchef);
		            
		            }
		            
		            response.sendRedirect("Table.jsp");			
		 
		 
		
			  	}
		 
		 
		 }

}
}
