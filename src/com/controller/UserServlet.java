package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.OrderDao;
import com.dao.RestaurantTablesDao;
import com.model.Order;
import com.model.RestaurantTables;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if (Integer.parseInt(request.getParameter("tablenb"))== 1)
		 {
			RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
            RestaurantTables a = rtDao.findRestaurantTable(1);
            
            request.getSession().setAttribute("idToServe", 1);
            request.getSession().setAttribute("tableToBeServed", a);
            request.getRequestDispatcher("Table.jsp").forward(request,response);
		 }
		
		else if (Integer.parseInt(request.getParameter("tablenb"))== 2)
		 {
			RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
            RestaurantTables a = rtDao.findRestaurantTable(2);
            
            request.getSession().setAttribute("idToServe", 2);
            request.getSession().setAttribute("tableToBeServed", a);
            request.getRequestDispatcher("Table.jsp").forward(request,response);
		 }
		
		else if (Integer.parseInt(request.getParameter("tablenb"))== 3)
		{
			RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
            RestaurantTables a = rtDao.findRestaurantTable(3);
            
            request.getSession().setAttribute("idToServe", 3);
            request.getSession().setAttribute("tableToBeServed", a);
            request.getRequestDispatcher("Table.jsp").forward(request,response);
		}
		
		else if (Integer.parseInt(request.getParameter("tablenb"))== 4)
		{
			RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
            RestaurantTables a = rtDao.findRestaurantTable(4);
            
            request.getSession().setAttribute("idToServe", 4);
            request.getSession().setAttribute("tableToBeServed", a);
            request.getRequestDispatcher("Table.jsp").forward(request,response);
		}
		
		else if (Integer.parseInt(request.getParameter("tablenb"))== 5)
		{
			RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
            RestaurantTables a = rtDao.findRestaurantTable(5);
            
            request.getSession().setAttribute("idToServe", 5);
            request.getSession().setAttribute("tableToBeServed", a);
            request.getRequestDispatcher("Table.jsp").forward(request,response);
		}
	
		
	
	
	
	}

}
