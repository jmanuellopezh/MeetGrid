package org.iesalixar.jmanuellopezh.controller;

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

/**
 * Servlet implementation class LastMessages
 */
@WebServlet("/LastMessages")
public class LastMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LastMessages() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'LastMessages' has been invoked!");
		
		HttpSession session = request.getSession();
		String receiver = (String)session.getAttribute("Id");

		List<Message> lista = MessageDAOImpl.readLastMessages(receiver);
		
		
		session.setAttribute("lastmessages", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("user/lastmessages.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
