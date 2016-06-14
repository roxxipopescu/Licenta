package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

import com.dao.FidelityCardsDao;
import com.model.FidelityCards;

@WebServlet("/EditFidelityCardServlet")
public class EditFidelityCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if (request.getParameter("update_fcard")!=null)
		 {
			 FidelityCards f = (FidelityCards)request.getSession().getAttribute("toBeUpdated");
			 int idToUpdate = (int)request.getSession().getAttribute("idToUp");
			 
			 String name=request.getParameter("name");
			 String surname=request.getParameter("surname");
			 String bday=request.getParameter("bday");
			 String email = request.getParameter("email");
			 
			 FidelityCards newFCard = new FidelityCards(name, surname, bday, email);
			 FidelityCardsDao fdao = new FidelityCardsDao(new Configuration().configure().buildSessionFactory());
			 fdao.updateFidelityCards(f, newFCard);
			 
			 response.sendRedirect("FidelityCardOwners.jsp");
			 
			 
		 }
		 
	}
	
}


