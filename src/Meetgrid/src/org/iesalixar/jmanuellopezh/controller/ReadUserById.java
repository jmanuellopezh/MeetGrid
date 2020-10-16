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
import org.iesalixar.jmanuellopezh.model.User;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class ReadUserById
 */
@WebServlet("/ReadUserById")
public class ReadUserById extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadUserById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		 UserDAOImpl user = new UserDAOImpl();
		
	    // primero selecciona el tipo de contenidos y otros campos de cabecera de la respuesta
	    response.setContentType("text/html");
	    // Luego escribe los datos de la respuesta


	    HttpSession session = request.getSession();
	    User u = user.readUserById(request.getParameter("id"));
	    System.out.println(u.toString());

	    
	    
	    
	    //guardo el perfil visitado
	    
	    session.setAttribute("visit", u);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("user/profile.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 

		 logger.info("Un usuario ha accedido al perfil del usuario "+u.getEmail()+"");

	} catch (ServletException e) {
		e.printStackTrace();
	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
