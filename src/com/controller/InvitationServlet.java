package com.controller;

import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InvitationServlet")
public class InvitationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("send_email")!=null)
		{
			String name=request.getParameter("eventName");
			String date=request.getParameter("eventDate");
			String hour=request.getParameter("eventTime");
			String description=request.getParameter("eventDescription");
			String [] emails=request.getParameterValues("emails");
			
		      String from = "roxxi.popescu@gmail.com";
		      String password = "justdance25";
		      
		      Properties props = new Properties();
		      props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
	          props.put("mail.smtp.port", "587"); //TLS Port
	          props.put("mail.smtp.auth", "true"); //enable authentication
	          props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

	          Authenticator auth = new Authenticator() {
		      protected PasswordAuthentication getPasswordAuthentication() {
	           return new PasswordAuthentication(from, password);
	                }
	            };
		   
		      Session session = Session.getInstance(props, auth);

		      try{
		         // Create a default MimeMessage object.
		         MimeMessage message = new MimeMessage(session);

		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(from));
		         		        		         		       		         
		         for(int i=0; i<emails.length; i++) 			
		         {		        	
		         // Set To: header field of the header.
		         message.addRecipient(Message.RecipientType.TO, new InternetAddress(emails[i]));
		         }

		         // Set Subject: header field
		         message.setSubject("Invitation to " + name);

		         // Now set the actual message
		         message.setText(name + " will take place on " + date + " at " + hour + " and " + description);

		         // Send message
		         Transport.send(message);
		         System.out.println("Sent message successfully....");
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
			
			response.sendRedirect("FidelityCardOwners.jsp");
			
		}
		
	}

}
