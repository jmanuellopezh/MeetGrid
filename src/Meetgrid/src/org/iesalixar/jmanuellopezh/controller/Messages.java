package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;
import java.util.List;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.iesalixar.jmanuellopezh.model.Message;
import org.iesalixar.jmanuellopezh.model.MessageDAOImpl;
import org.iesalixar.jmanuellopezh.model.User;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class Messages
 */
@WebServlet("/Messages")
public class Messages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Messages() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'Messages' has been invoked!");
		
		HttpSession session = request.getSession();
		String sender = (String)session.getAttribute("Id");
		System.out.println(sender);
		User receiverobj = (User) session.getAttribute("visit");
		String receiver = receiverobj.getId();
		System.out.println(receiver);
		
		MessageDAOImpl user = new MessageDAOImpl();
		List<Message> lista = user.readMessages(sender, receiver);
		
		
		session.setAttribute("messages", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("user/messages.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageDAOImpl m =new MessageDAOImpl();

		HttpSession session = request.getSession();
		String sender = (String)session.getAttribute("Id");
		User receiverobj = (User) session.getAttribute("visit");
		String receiver = receiverobj.getId();
		String content=request.getParameter("content");
		
		m.create(sender, receiver, content);
		response.sendRedirect("Messages");
			
	}
			
	

}
