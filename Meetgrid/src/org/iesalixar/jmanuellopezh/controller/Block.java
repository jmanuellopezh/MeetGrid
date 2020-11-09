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
import org.iesalixar.jmanuellopezh.model.MessageDAOImpl;
import org.iesalixar.jmanuellopezh.model.User;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class Block
 */
@WebServlet("/Block")
public class Block extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Register.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Block() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'Block' has been invoked!");
		
		HttpSession session = request.getSession();
		String owner = (String)session.getAttribute("Id");
		
		
		UserDAOImpl user = new UserDAOImpl();
		List<User> lista = user.readBlocks(owner);
		
		
		session.setAttribute("blocks", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("user/block.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAOImpl us =new UserDAOImpl();
	
		//doGet(request, response);
		HttpSession session = request.getSession();
		String owner = (String)session.getAttribute("Id");
		User blockedobj = (User) session.getAttribute("visit");
		String blocked = blockedobj.getId();
		
		if (!(us.checkExistingBlocked(owner, blocked))) {
		
		us.block(owner, blocked);
		logger.info("El usuario id "+ owner + " bloqueó al usuario "+blocked);
		
		}else {
			logger.info("No se puede bloquear al mismo usuario dos veces");

		}
		
		response.sendRedirect("Block");
		
	}

}
