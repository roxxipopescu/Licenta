package com.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.cfg.Configuration;

import com.model.User;
import com.dao.UserDao;

/**
 * Servlet implementation class LogInServlet
 */

public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: fmm ").append(request.getContextPath());

    }
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String user =request.getParameter("userName");
	     String pass =request.getParameter("password");

	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        try {
	            UserDao uDAO = new UserDao(new Configuration().configure().buildSessionFactory());
	            User loginUser = new User();
	            loginUser = uDAO.findUser(user, pass);

	           if (loginUser!=null){

	                HttpSession session = request.getSession();
	                session.setAttribute("user", user);
	                session.setAttribute("role", loginUser.getRole());
	                session.setAttribute("id", loginUser.getId());
	                session.setMaxInactiveInterval(20*60);
	                Cookie userName = new Cookie("user", user);
	                Cookie role = new Cookie("role", loginUser.getRole());
	                userName.setMaxAge(30*60);
	                role.setMaxAge(30*60);
	                response.addCookie(userName);
	                response.addCookie(role);
	                if (loginUser.getRole().equals("admin")){
	                    response.sendRedirect("Admin.jsp");
	                }
	                if (loginUser.getRole().equals("waiter"))
	                {
	                    response.sendRedirect("User.jsp");
	                }
	                if (loginUser.getRole().equals("chef"))
	                {
	                    response.sendRedirect("Chef.jsp");
	                }
	                

	            }
	           else{

	               out.print("<br> Bad username or password! <br />");
	               out.print("<a href='index.html'> Go Back to Login </a>");
	           }


	        } finally {
	            out.close();
	        }

	}

}
