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

import com.dao.ChefDao;
import com.dao.IncomeDao;
import com.dao.MenuDao;
import com.model.Chef;
import com.model.Income;
import com.model.Menu;


@WebServlet("/ChefPageServlet")
public class ChefPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("delete")!=null)
		 {			
			String chefUserId = request.getParameter("chefUserId");
			String currentDate = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());
			String idToDelete =request.getParameter("id");
			int teblId=0;
			String dishName="";				
			
			 ChefDao chefDao = new ChefDao(new Configuration().configure().buildSessionFactory());
			 List<Chef> myChefList = null;
			 myChefList = chefDao.findChefs();
			 
			 for (Chef ch : myChefList){
				 if(ch.getId() == Integer.parseInt(idToDelete))
				 {
					 teblId = ch.getTableId();
					 dishName = ch.getDish();
				 }
			 }
			 
			 MenuDao menuDao = new MenuDao(new Configuration().configure().buildSessionFactory());
			  List<Menu> myMenuList = null;
			  myMenuList = menuDao.findMenuItems();
			  int dishPrice=0;
			  
			for (Menu m : myMenuList)
			{
				if (m.getDish().equals(dishName))
				{
					dishPrice=m.getDishPrice();
				}
			}
			
			Income newIncome = new Income( Integer.parseInt(chefUserId), currentDate ,(double) dishPrice, dishName,teblId);
		    IncomeDao iDao = new IncomeDao(new Configuration().configure().buildSessionFactory());
		    iDao.addIncome(newIncome);
		    		 	
            ChefDao cDao = new ChefDao(new Configuration().configure().buildSessionFactory());
            cDao.removeChef(Integer.parseInt(idToDelete));
            PrintWriter out = response.getWriter();
            
            response.sendRedirect("Chef.jsp");			 
		 }
		
		
	}

}
