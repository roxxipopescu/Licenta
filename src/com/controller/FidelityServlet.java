package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.FidelityCardsDao;
import com.dao.OrderDao;
import com.model.FidelityCards;

@WebServlet("/FidelityServlet")
public class FidelityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		if (request.getParameter("update_fclient")!=null)
		 {
			String idToUpdate =request.getParameter("idf");
			FidelityCardsDao fdao = new FidelityCardsDao(new Configuration().configure().buildSessionFactory());
			FidelityCards f = fdao.findFidelityCards(Integer.parseInt(idToUpdate));
			request.getSession().setAttribute("idToUp", Integer.parseInt(idToUpdate));
            request.getSession().setAttribute("toBeUpdated", f); 
            
            request.getRequestDispatcher("EditFidelityCardOwners.jsp").forward(request, response);
            
            
			
		 }
		 else  if (request.getParameter("delete_fclient")!=null)
		 {
			 String idToDelete =request.getParameter("idf");
			 FidelityCardsDao fdao = new FidelityCardsDao(new Configuration().configure().buildSessionFactory());
	         fdao.removeFidelityCards(Integer.parseInt(idToDelete));
			 response.sendRedirect("FidelityCardOwners.jsp");
		 }
		
		 else  if (request.getParameter("add_fclient")!=null)
		 {
			 String name=request.getParameter("name");
			 String surname=request.getParameter("surname");
			 String bday=request.getParameter("bday");
			 String email=request.getParameter("email");
			 
			 FidelityCards fcard = new FidelityCards(name, surname, bday, email);
			 FidelityCardsDao fdao = new FidelityCardsDao(new Configuration().configure().buildSessionFactory());
			 fdao.addFidelityCards(fcard);
			 
			 response.sendRedirect("FidelityCardOwners.jsp");
		 }
		 
	}
	
}


